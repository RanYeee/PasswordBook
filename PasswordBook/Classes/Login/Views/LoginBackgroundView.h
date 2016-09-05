//
//  LoginBackgroundView.h
//  PasswordBook
//
//  Created by Rany on 16/9/2.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginBackgroundView : UIView


- (void)starLightingWithDuration:(float)duration;

- (void)fadeOutComplete:(void(^)())complete;

@end
