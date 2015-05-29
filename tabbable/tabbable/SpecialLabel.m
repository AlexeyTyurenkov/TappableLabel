//
//  SpecialLabel.m
//  tabbable
//
//  Created by Aleksey Tyurenkov on 5/29/15.
//  Copyright (c) 2015 com.ita. All rights reserved.
//

#import "SpecialLabel.h"
#import <CoreText/CoreText.h>

@implementation SpecialLabel

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setRecognizer];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setRecognizer];
    }
    return self;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setRecognizer];
    }
    return self;
}


- (void)setRecognizer
{
    // Make sure user interaction is enabled so we can accept touches
    self.userInteractionEnabled = YES;
    
    // Default background colour looks good on a white background
    self.selectedLinkBackgroundColor = [UIColor colorWithWhite:0.95 alpha:1.0];
    
    // Attach a default detection handler to help with debugging
    self.linkTapHandler = ^(NSURL *URL) {
        NSLog(@"Default handler for %@", URL);
    };
    
    UITapGestureRecognizer *touch = [[UITapGestureRecognizer alloc] initWithTarget:self
                                                                            action:@selector(handleTouch:)];
    touch.delegate = self;
    [self addGestureRecognizer:touch];
}


- (void)handleTouch:(UITapGestureRecognizer*)touch
{
    NSLog(@"Tap");
    CGPoint tapLocation = [touch locationInView:self];
    NSLog(@"x = %f; y = %f ",tapLocation.x, tapLocation.y);
    NSLog(@"%ld",(long)[self touchCharacter:tapLocation]);
}




- (NSInteger)touchCharacter:(CGPoint)point
{
    NSInteger result = NSNotFound;

    CGRect textRect = [self textRectForBounds:self.bounds limitedToNumberOfLines:self.numberOfLines];
    CGPoint reversePoint = CGPointMake(point.x, self.frame.size.height-point.y);
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathAddRect(path, NULL, textRect);
    CTFramesetterRef framesetter = CTFramesetterCreateWithAttributedString((__bridge CFAttributedStringRef)self.attributedText);
    CTFrameRef frame = CTFramesetterCreateFrame(framesetter, CFRangeMake(0, (CFIndex)[self.attributedText length]), path, NULL);
    
    CFArrayRef lines = CTFrameGetLines(frame);
    
    CGPoint* lineOrigins = malloc(sizeof(CGPoint)*CFArrayGetCount(lines));
    
    CTFrameGetLineOrigins(frame, CFRangeMake(0,0), lineOrigins);
    
    for(CFIndex i = 0; i < CFArrayGetCount(lines); i++)
    {
        CTLineRef line = CFArrayGetValueAtIndex(lines, i);
        
        CGPoint origin = lineOrigins[i];
        if (reversePoint.y > origin.y) {
            NSInteger index = CTLineGetStringIndexForPosition(line, reversePoint);
            NSLog(@"index %ld", (long)index);
            result = index;
            break;
        }
    }
    free(lineOrigins);
    return result;
}

@end
