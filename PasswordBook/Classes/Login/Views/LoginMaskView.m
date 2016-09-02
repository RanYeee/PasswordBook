//
//  LoginMaskView.m
//  PasswordBook
//
//  Created by Rany on 16/9/2.
//  Copyright © 2016年 Rany. All rights reserved.
//



#import "LoginMaskView.h"

@implementation LoginMaskView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor clearColor];
        
        [self drawLine];
        
        //        [self timer];
    }
    return self;
}



- (void)drawLine
{
    
    int spacing = (int)kLineSpacing;
    
    CGFloat horizontalCount = SCREEN_HEIGHT / spacing;
    
    for (int i = 0; i<kVerticalLineCount; i++) {
        UIBezierPath* aPath = [UIBezierPath bezierPath];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        aPath.lineWidth = 0.5f;
        [aPath moveToPoint:CGPointMake(kLineSpacing+i*kLineSpacing, 0)];
        [aPath addLineToPoint:CGPointMake(kLineSpacing+i*kLineSpacing, SCREEN_HEIGHT)];
        shapeLayer.strokeColor = [[UIColor colorWithHexString:@"#000C24"]CGColor];
        [shapeLayer setPath:aPath.CGPath];
        [self.layer addSublayer:shapeLayer];
        
    }
    
    
    for (int i = 0; i<horizontalCount; i++) {
        
        UIBezierPath* aPath = [UIBezierPath bezierPath];
        CAShapeLayer *shapeLayer = [CAShapeLayer layer];
        aPath.lineWidth = 0.5f;
        [aPath moveToPoint:CGPointMake(0, kLineSpacing+i*kLineSpacing)];
        [aPath addLineToPoint:CGPointMake(SCREEN_WIDTH, kLineSpacing+i*kLineSpacing)];
        shapeLayer.strokeColor = [[UIColor colorWithHexString:@"#000C24"]CGColor];
        [shapeLayer setPath:aPath.CGPath];
        [self.layer addSublayer:shapeLayer];
    }
    
}



@end
