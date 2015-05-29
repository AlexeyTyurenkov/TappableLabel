//
//  ViewController.m
//  tabbable
//
//  Created by Aleksey Tyurenkov on 5/29/15.
//  Copyright (c) 2015 com.ita. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIColor* fgColor = [UIColor greenColor];
    UIColor* bgColor = [UIColor orangeColor];
    UIFont* fontSize = [UIFont systemFontOfSize:16];

    NSDictionary* style = @{
                            NSForegroundColorAttributeName: fgColor,
                            NSBackgroundColorAttributeName: bgColor,
                            NSFontAttributeName: fontSize
                            };
    
    NSAttributedString* myString = [[NSAttributedString alloc] initWithString:@"Touch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code MagazineTouch Code Magazine"
                                                                   attributes:style];
    NSDictionary* linkStyle = @{
                                NSForegroundColorAttributeName: [UIColor purpleColor],
                                NSFontAttributeName: [UIFont boldSystemFontOfSize:33]
                                };
    NSAttributedString* myLink = [[NSAttributedString alloc] initWithString:@" googl3 " attributes:linkStyle];
    self.specialLabel.numberOfLines = 0;
    self.cintrolLabel.numberOfLines = 0;
    NSMutableAttributedString* concat = [[NSMutableAttributedString alloc] initWithAttributedString:myString];
    [concat appendAttributedString:myLink];
    self.cintrolLabel.attributedText = concat;
    self.specialLabel.attributedText = concat;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
