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
    self.specialLabel.numberOfLines = 0;
    self.cintrolLabel.numberOfLines = 0;
    self.cintrolLabel.attributedText = myString;
    self.specialLabel.attributedText = myString;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
