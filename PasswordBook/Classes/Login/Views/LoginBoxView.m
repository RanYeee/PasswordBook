//
//  LoginBoxView.m
//  PasswordBook
//
//  Created by Rany on 16/9/5.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "LoginBoxView.h"
#import "LoginTextField.h"

@interface LoginBoxView ()

@property (nonatomic,strong) UIImageView *bgImageView;

@property (nonatomic,strong) UIActivityIndicatorView *loadingView;


@property (nonatomic,strong) UIButton *confirmBtn;

@end

@implementation LoginBoxView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.frame = frame;
        
        [self setupView];
    }
    
    return self;
}

- (UIImageView *)bgImageView
{
    if (!_bgImageView) {
        
        _bgImageView = [[UIImageView alloc]initWithFrame:self.bounds];
        
        _bgImageView.image = [UIImage imageNamed:@"loginBox"];
        
        _bgImageView.userInteractionEnabled = YES;
        
    }
    
    return _bgImageView;
}

- (UIActivityIndicatorView *)loadingView
{
    if (!_loadingView) {
        
        _loadingView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
        
        _loadingView.frame = self.bounds;
        
        _loadingView.center = self.bgImageView.center;
        
    }
    
    return _loadingView;
}

- (UIButton *)confirmBtn
{
    if (!_confirmBtn) {
        
        
        _confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_confirmBtn setBackgroundImage:[UIImage imageNamed:@"confirmBtn"] forState:UIControlStateNormal];
        
        [_confirmBtn addTarget:self action:@selector(confirmClick) forControlEvents:UIControlEventTouchUpInside];
        
        _confirmBtn.frame = CGRectMake(20, self.height - 40-20, self.width/2, 40);
        
        [_confirmBtn setTitleColor:[UIColor colorWithHexString:@"#A7C5CF"] forState:UIControlStateNormal];
        
        [_confirmBtn setTitle:@"confirm" forState:UIControlStateNormal];
        
        _confirmBtn.titleLabel.font = [UIFont systemFontOfSize:15];
        
    }
    
    return _confirmBtn;
}

- (void)setupView
{
    [self addSubview:self.bgImageView];
    
    [self.bgImageView addSubview:self.confirmBtn];
    
    [self insertSubview:self.loadingView aboveSubview:self.bgImageView];
    
    LoginTextField *accountfile = [[LoginTextField alloc]initWithFrame:CGRectMake(20, 30, self.width-40, 44)];
    
    accountfile.placeholder = @"account";
    [self.bgImageView addSubview:accountfile];
    
    LoginTextField *pwdfile = [[LoginTextField alloc]initWithFrame:CGRectMake(20, accountfile.bottom + 20, self.width-40, 44)];
    pwdfile.placeholder = @"password";
    [self.bgImageView addSubview:pwdfile];
}

- (void)hideAndLoading
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.bgImageView.transform =  CGAffineTransformMakeScale(0.001f, 0.001f);
        
    } completion:^(BOOL finished) {
        
        [self.loadingView startAnimating];
    }];
}

- (void)endLoading
{
    [self.loadingView stopAnimating];
    
    [self removeFromSuperview];
}

- (void)show
{
    [_loadingView stopAnimating];

    [UIView animateWithDuration:0.5 animations:^{
        
        self.bgImageView.transform =  CGAffineTransformMakeScale(1.00f, 1.00f);
        
    } completion:^(BOOL finished) {
        
        
    }];

}

#pragma mark - confirmButtonAction

- (void)confirmClick
{
    
}

@end
