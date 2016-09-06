//
//  LoginBackgroundView.m
//  PasswordBook
//
//  Created by Rany on 16/9/2.
//  Copyright © 2016年 Rany. All rights reserved.
//


#import "LoginBackgroundView.h"
#import "LoginMaskView.h"

#define kFadeOutDuration 1.0


@interface LoginBackgroundView ()

{
    UIView *_topLightView;
    UIView *_bottomLightView;
    
}


@property (nonatomic,strong) UIView *topContainView;

@property (nonatomic,strong) UIView *bottomContainView;

@property (nonatomic,strong) UIImageView *logoImageView;




@end

@implementation LoginBackgroundView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.frame = frame;
                
        [self setupView];
    }
    
    return self;
}

#pragma mark - getter

- (LoginBoxView *)boxView
{
    if (!_boxView) {
        
        CGFloat boxW = SCREEN_WIDTH-20;
        
        CGFloat boxH = boxW * 2 / 2.5;
        
        _boxView = [[LoginBoxView alloc]initWithFrame:CGRectMake(20, 0, boxW, boxH)];
        
        _boxView.center = CGPointMake(self.width/2, self.height/2);
        
        
    }
    
    return _boxView;
}

-(UIView *)topContainView
{
    if (!_topContainView) {
        
        _topContainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height/2)];
        
        _topContainView.backgroundColor = [UIColor colorWithHexString:@"#000C24"];
        
//        [_topContainView addSubview:self.logoImageView];
        
        [self addSubview:_topContainView];
        
    }
    
    return _topContainView;
}

-(UIView *)bottomContainView
{
    if (!_bottomContainView) {
        
        _bottomContainView = [[UIView alloc]initWithFrame:CGRectMake(0, self.height/2, self.width, self.height/2)];
        
        _bottomContainView.backgroundColor = [UIColor colorWithHexString:@"#000C24"];
        
        [self addSubview:_bottomContainView];
        
    }
    
    return _bottomContainView;
}

- (UIImageView *)logoImageView
{
    if (!_logoImageView) {
        
        _logoImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"loginText"]];
        
        _logoImageView.frame = CGRectMake(24, 40, 136, 48);
        
        _logoImageView.contentMode = UIViewContentModeScaleAspectFit;
        

        
    }
    
    return _logoImageView;
}

- (void)setupView
{
    [self insertSubview:self.logoImageView aboveSubview:self.topContainView];

    [self insertSubview:self.boxView aboveSubview:self.bottomContainView];
    //maskView

    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height/2)];
    
    LoginMaskView *maskView1 = [[LoginMaskView alloc]initWithFrame:topView.bounds];

    topView.backgroundColor = [UIColor colorWithHexString:@"#000C24"];
    
    
    topView.maskView = maskView1;
    
    _topLightView = [[UIView alloc]initWithFrame:topView.bounds];
    
    _topLightView.backgroundColor = [UIColor colorWithHexString:@"#6490E8"];
    
    _topLightView.alpha = 0.0f;

    [topView addSubview:_topLightView];
    
    [self.topContainView addSubview:topView];
    


    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, topView.height)];
    
    bottomView.backgroundColor = [UIColor colorWithHexString:@"#000C24"];
    
    LoginMaskView *maskView2 = [[LoginMaskView alloc]initWithFrame:bottomView.bounds];;
    
    bottomView.maskView = maskView2;
    
    _bottomLightView = [[UIView alloc]initWithFrame:bottomView.bounds];
    
    _bottomLightView.backgroundColor = [UIColor colorWithHexString:@"#6490E8"];
    
    _bottomLightView.alpha = 0.0f;
    
    [bottomView addSubview:_bottomLightView];
    
    [self.bottomContainView addSubview:bottomView];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        [self.boxView hideAndLoading];
//        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            
//            [self stopLighting];
//            [self warningLight];
//            [self.boxView show];
//            
//        });
//        
//    });


}

#pragma mark - Animation

- (void)starLightingWithDuration:(float)duration
{
    [_topLightView.layer addAnimation:[self AlphaLight:duration] forKey:@"aAlpha"];
    
    [_bottomLightView.layer addAnimation:[self AlphaLight:duration] forKey:@"aAlpha"];

}

- (void)stopLighting
{
    [_topLightView.layer removeAnimationForKey:@"aAlpha"];
    
    [_bottomLightView.layer removeAnimationForKey:@"aAlpha"];
    
    _topLightView.alpha = 1.0f;
    
    _bottomLightView.alpha = 1.0f;

}

- (void)warningLight
{
    _topLightView.backgroundColor = [UIColor redColor];
    
    _bottomLightView.backgroundColor = [UIColor redColor];
    
    _topLightView.alpha = 0.0f;
    
    _bottomLightView.alpha = 0.0f;
    
    [self starLightingWithDuration:0.4];
    
    __weak typeof(self) weakSelf = self;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [weakSelf stopLighting];
        [weakSelf.boxView endLoading];
    });
    
}

- (void)fadeOutAnimationComplete:(void(^)())complete
{
    [UIView animateWithDuration:kFadeOutDuration animations:^{
       
        self.topContainView.top = -self.topContainView.height;
        
        self.bottomContainView.top = self.height;
        
    }completion:^(BOOL finished) {
        
        complete();
        
        [self removeFromSuperview];
        
    }];
}

- (void)fadeOutComplete:(void(^)())complete
{
    _bottomLightView.backgroundColor = [UIColor colorWithHexString:@"#6490E8"];

    _topLightView.backgroundColor = [UIColor colorWithHexString:@"#6490E8"];

    [self runningLineFinish:^{
        
        [self fadeOutAnimationComplete:^{
            
            complete();
            
        }];
        
    }];
}

- (void)runningLineFinish:(void(^)())finish
{
    __block UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(-SCREEN_WIDTH, self.height/2, SCREEN_WIDTH, 2)];
    
    line1.backgroundColor = [UIColor colorWithHexString:@"#86E1EC"];
    
    [self addSubview:line1];
    
    
    
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        line1.frame = CGRectMake(0, self.height/2, SCREEN_WIDTH, 2);
        self.logoImageView.alpha = 0.0f;
    } completion:^(BOOL finished) {
        
        
        finish();

        [line1 removeFromSuperview];
        
    }];
    

}



#pragma mark - 呼吸灯动画
-(CABasicAnimation *) AlphaLight:(float)time
{
    CABasicAnimation *animation =[CABasicAnimation animationWithKeyPath:@"opacity"];
    animation.fromValue = [NSNumber numberWithFloat:0.0f];
    animation.toValue = [NSNumber numberWithFloat:1.0f];//这是透明度。
    animation.autoreverses = YES;
    animation.duration = time;
    animation.repeatCount = MAXFLOAT;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    
    return animation;
}

@end
