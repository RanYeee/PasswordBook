//
//  LoginBackgroundView.h
//  PasswordBook
//
//  Created by Rany on 16/9/2.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginBackgroundView : UIView


- (void)starLighting;

- (void)fadeOutComplete:(void(^)())complete;

@end
