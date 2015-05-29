//
//  TappableLabel.m
//  tabbable
//
//  Created by Aleksey Tyurenkov on 5/29/15.
//  Copyright (c) 2015 com.ita. All rights reserved.
//

#import "TappableLabel.h"

@implementation TappableLabel
{
    NSTextStorage* _textStorage;
    NSLayoutManager* _layoutManager;
    NSTextContainer* _textContainer;
}


- (NSTextStorage *)textStorage
{
    if (!_textStorage)
    {
        _textStorage = [[NSTextStorage alloc] init];
        [_textStorage addLayoutManager:self.layoutManager];
        [self.layoutManager setTextStorage:_textStorage];
    }
    
    return _textStorage;
}


- (NSLayoutManager *)layoutManager
{
    if (!_layoutManager)
    {
        // Create a layout manager for rendering
        _layoutManager = [[NSLayoutManager alloc] init];
        _layoutManager.delegate = self;
        [_layoutManager addTextContainer:self.textContainer];
    }
    
    return _layoutManager;
}

- (NSTextContainer *)textContainer
{
    if (!_textContainer)
    {
        _textContainer = [[NSTextContainer alloc] init];
        _textContainer.lineFragmentPadding = 0;
        _textContainer.maximumNumberOfLines = self.numberOfLines;
        _textContainer.lineBreakMode = self.lineBreakMode;
        _textContainer.widthTracksTextView = YES;
        _textContainer.size = self.frame.size;
        
        [_textContainer setLayoutManager:self.layoutManager];
    }
    
    return _textContainer;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    // Update our container size when the view frame changes
    self.textContainer.size = self.bounds.size;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    CGSize size = frame.size;
    size.width = MIN(size.width, self.preferredMaxLayoutWidth);
    size.height = 0;
    self.textContainer.size = size;
}

- (void)setBounds:(CGRect)bounds
{
    [super setBounds:bounds];
    
    CGSize size = bounds.size;
    size.width = MIN(size.width, self.preferredMaxLayoutWidth);
    size.height = 0;
    self.textContainer.size = size;
}

- (void)setPreferredMaxLayoutWidth:(CGFloat)preferredMaxLayoutWidth
{
    [super setPreferredMaxLayoutWidth:preferredMaxLayoutWidth];
    
    CGSize size = self.bounds.size;
    size.width = MIN(size.width, self.preferredMaxLayoutWidth);
    self.textContainer.size = size;
}

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines
{
    // Use our text container to calculate the bounds required. First save our
    // current text container setup
    CGSize savedTextContainerSize = self.textContainer.size;
    NSInteger savedTextContainerNumberOfLines = self.textContainer.maximumNumberOfLines;
    
    // Apply the new potential bounds and number of lines
    self.textContainer.size = bounds.size;
    self.textContainer.maximumNumberOfLines = numberOfLines;
    
    // Measure the text with the new state
    CGRect textBounds;
    NSRange glyphRange = [self.layoutManager
                              glyphRangeForTextContainer:self.textContainer];
    textBounds = [self.layoutManager boundingRectForGlyphRange:glyphRange
                                                   inTextContainer:self.textContainer];
        
    // Position the bounds and round up the size for good measure
    textBounds.origin = bounds.origin;
    textBounds.size.width = ceilf(textBounds.size.width);
    textBounds.size.height = ceilf(textBounds.size.height);


    // Restore the old container state before we exit under any circumstances
    self.textContainer.size = savedTextContainerSize;
    self.textContainer.maximumNumberOfLines = savedTextContainerNumberOfLines;

    
    return textBounds;
}
@end
