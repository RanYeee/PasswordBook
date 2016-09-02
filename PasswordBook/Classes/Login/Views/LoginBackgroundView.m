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

-(UIView *)topContainView
{
    if (!_topContainView) {
        
        _topContainView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height/2)];
        
        _topContainView.backgroundColor = [UIColor colorWithHexString:@"#000C24"];
        
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

- (void)setupView
{
    
    //maskView

    UIView *topView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height/2)];
    
    LoginMaskView *maskView1 = [[LoginMaskView alloc]initWithFrame:topView.bounds];

    topView.backgroundColor = [UIColor colorWithHexString:@"#19346B"];
    
    
    topView.maskView = maskView1;
    
    _topLightView = [[UIView alloc]initWithFrame:topView.bounds];
    
    _topLightView.backgroundColor = [UIColor colorWithHexString:@"#6490E8"];
    
    _topLightView.alpha = 0.0f;

    [topView addSubview:_topLightView];
    
    [self.topContainView addSubview:topView];
    


    UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.width, topView.height)];
    
    bottomView.backgroundColor = [UIColor colorWithHexString:@"#19346B"];
    
    LoginMaskView *maskView2 = [[LoginMaskView alloc]initWithFrame:bottomView.bounds];;
    
    bottomView.maskView = maskView2;
    
    _bottomLightView = [[UIView alloc]initWithFrame:bottomView.bounds];
    
    _bottomLightView.backgroundColor = [UIColor colorWithHexString:@"#6490E8"];
    
    _bottomLightView.alpha = 0.0f;
    
    [bottomView addSubview:_bottomLightView];
    
    [self.bottomContainView addSubview:bottomView];


}

- (void)starLighting
{
    [_topLightView.layer addAnimation:[self AlphaLight:1.5] forKey:@"aAlpha"];
    
    [_bottomLightView.layer addAnimation:[self AlphaLight:1.5] forKey:@"aAlpha"];

}

- (void)stopLighting
{
    
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
    [self runningLineFinish:^{
        
        [self fadeOutAnimationComplete:^{
            
            complete();
            
        }];
        
    }];
}

- (void)runningLineFinish:(void(^)())finish
{
    __block UIView *line1 = [[UIView alloc]initWithFrame:CGRectMake(-SCREEN_WIDTH, self.height/2, SCREEN_WIDTH, 2)];
    
    line1.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:line1];
    
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        line1.frame = CGRectMake(0, self.height/2, SCREEN_WIDTH, 2);

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
