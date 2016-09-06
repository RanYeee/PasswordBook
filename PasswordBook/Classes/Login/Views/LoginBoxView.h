//
//  LoginBoxView.h
//  PasswordBook
//
//  Created by Rany on 16/9/5.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^ConfirmBlock)(NSString *accountStr,NSString *pwdStr);

@interface LoginBoxView : UIView

- (void)hideAndLoading;

- (void)show;

- (void)endLoading;

- (void)successLoginingComplete:(void(^)())complete;

- (void)confirmButtonDidClick:(ConfirmBlock)confirmBlock;

@end
