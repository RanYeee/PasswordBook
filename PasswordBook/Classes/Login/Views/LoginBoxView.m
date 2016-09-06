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

{
    BOOL _isRemember;
    
    ConfirmBlock _confirmBlock;
}
@property (nonatomic,strong) UIImageView *bgImageView;

@property (nonatomic,strong) UIActivityIndicatorView *loadingView;


@property (nonatomic,strong) UIButton *confirmBtn;

@property (nonatomic,strong) LoginTextField *accountfield;


@property (nonatomic,strong) LoginTextField *pwdfield;


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
        
        _confirmBtn.frame = CGRectMake(20, self.height - 40-20, self.width/2-20, 40);
        
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
    
    //textfield
    self.accountfield = [[LoginTextField alloc]initWithFrame:CGRectMake(20, 30, self.width-40, 44)];

    self.accountfield.placeholder = @"account";
    [self.bgImageView addSubview:self.accountfield];
    
    self.pwdfield = [[LoginTextField alloc]initWithFrame:CGRectMake(20, self.accountfield.bottom + 20, self.width-40, 44)];

    self.pwdfield.placeholder = @"password";
    self.pwdfield.secureTextEntry = YES;
    [self.bgImageView addSubview:self.pwdfield];
    
    //checkbox

  
    
    UIButton *checkBox =[UIButton buttonWithType:UIButtonTypeCustom];
    
    checkBox.frame = CGRectMake(self.confirmBtn.right+20, self.confirmBtn.y, 22, 24);
        
    checkBox.centerY = self.confirmBtn.centerY;
    
    [checkBox addTarget:self action:@selector(rememberPasswordClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.bgImageView addSubview:checkBox];
    
    //isRemember
    _isRemember = [[NSUserDefaults standardUserDefaults]boolForKey:kIsRememberPwd];
    
    if (_isRemember) {
        
        [checkBox setBackgroundImage:[UIImage imageNamed:@"checkbox_on"] forState:UIControlStateNormal];
        
        self.accountfield.text = [[NSUserDefaults standardUserDefaults]objectForKey:kLoginAccount];
        
        self.pwdfield.text = [[NSUserDefaults standardUserDefaults]objectForKey:kLoginPassword];

    }else{
        
        [checkBox setBackgroundImage:[UIImage imageNamed:@"checkbox_off"] forState:UIControlStateNormal];

    }
    
    //Remember password Label
    
    UILabel *rememberLabel = [[UILabel alloc]initWithFrame:CGRectMake(checkBox.right+10, checkBox.y, self.frame.size.width-checkBox.right, checkBox.height)];
    
    rememberLabel.font = [UIFont systemFontOfSize:13];
    
    rememberLabel.text = @"Remember me";
    
    rememberLabel.textColor = [UIColor colorWithHexString:@"#A7C5CF"];
    
    [self.bgImageView addSubview:rememberLabel];
}

- (void)successLoginingComplete:(void(^)())complete
{
    [UIView animateWithDuration:0.5 animations:^{
//        [self removeAllSubviews];
        self.bgImageView.alpha = 0.0f;
        self.transform =  CGAffineTransformMakeScale(0.01f, 0.01f);
        self.centerX = 0.0f;
        self.backgroundColor = [UIColor colorWithHexString:@"#86E1EC"];
    } completion:^(BOOL finished) {
        
        [self removeFromSuperview];
        
        complete();
    }];

}

- (void)showLoadingView
{
    [self.loadingView startAnimating];
}

- (void)hideAndLoading
{
    [UIView animateWithDuration:0.5 animations:^{
        
        self.bgImageView.transform =  CGAffineTransformMakeScale(0.01f, 0.01f);

    } completion:^(BOOL finished) {
        
        [self.loadingView startAnimating];
    }];
}

- (void)endLoading
{
    [self.loadingView stopAnimating];
    
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
    
    
        if (isEmptyString(self.accountfield.text ) || isEmptyString(self.pwdfield.text)) {
            
        UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:@"Warning" message:@"Please fill in textField " delegate:self cancelButtonTitle:@"got it" otherButtonTitles:nil, nil];
        
        [alertView show];
            
        }else{
            
            if (_confirmBlock) {
                
                [self showLoadingView];
                
                _confirmBlock(self.accountfield.text,self.pwdfield.text);

            }

        }
    
}

-(void)confirmButtonDidClick:(ConfirmBlock)confirmBlock
{
    _confirmBlock = confirmBlock;
}

- (void)rememberPasswordClick:(UIButton *)button
{
    NSUserDefaults *userDef = [NSUserDefaults standardUserDefaults];
    
    if (_isRemember) {
        
        [button setBackgroundImage:[UIImage imageNamed:@"checkbox_off"] forState:UIControlStateNormal];
        
        [userDef removeObjectForKey:kLoginAccount];
        
        [userDef removeObjectForKey:kLoginPassword];
        
    }else{
        
        [button setBackgroundImage:[UIImage imageNamed:@"checkbox_on"] forState:UIControlStateNormal];
        
        [userDef setObject:self.accountfield.text forKey:kLoginAccount];
        
        [userDef setObject:self.pwdfield.text forKey:kLoginPassword];
    }
    
    _isRemember = !_isRemember;
    
    [userDef setBool:_isRemember forKey:kIsRememberPwd];
    
    [userDef synchronize];
}

@end
