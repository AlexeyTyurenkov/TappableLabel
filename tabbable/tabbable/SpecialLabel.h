//
//  SpecialLabel.h
//  tabbable
//
//  Created by Aleksey Tyurenkov on 5/29/15.
//  Copyright (c) 2015 com.ita. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SpecialLabel : UILabel <UIGestureRecognizerDelegate>

@property (nonatomic,strong) UIColor* selectedLinkBackgroundColor;
@property (nonatomic, strong) void (^linkTapHandler)(NSURL*);


@end
