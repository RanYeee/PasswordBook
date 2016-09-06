//
//  LoginBackgroundView.h
//  PasswordBook
//
//  Created by Rany on 16/9/2.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginBoxView.h"

@interface LoginBackgroundView : UIView

@property (nonatomic,strong) LoginBoxView *boxView;

- (void)starLightingWithDuration:(float)duration;

- (void)fadeOutComplete:(void(^)())complete;

- (void)warningLight;
@end
