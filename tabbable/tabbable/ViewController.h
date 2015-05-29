//
//  ViewController.h
//  tabbable
//
//  Created by Aleksey Tyurenkov on 5/29/15.
//  Copyright (c) 2015 com.ita. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SpecialLabel.h"


@interface ViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *cintrolLabel;
@property (weak, nonatomic) IBOutlet SpecialLabel *specialLabel;

@end

