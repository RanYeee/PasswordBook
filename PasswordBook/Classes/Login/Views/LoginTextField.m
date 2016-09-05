//
//  LoginTextField.m
//  PasswordBook
//
//  Created by Rany on 16/9/5.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "LoginTextField.h"

@implementation LoginTextField

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.tintColor = [UIColor colorWithHexString:@"#A7C5CF"];
        
        self.textColor = [UIColor colorWithHexString:@"#A7C5CF"];
        
    }
    
    return self;
}


- (void)drawRect:(CGRect)rect {
    //// Color Declarations
    UIColor* strokeColor = [UIColor colorWithHexString:@"#7DD6E1"];
    UIColor* color2 = [UIColor colorWithHexString:@"#0A3341"];

    //// Bezier 3 Drawing
    UIBezierPath* bezier3Path = UIBezierPath.bezierPath;
    [bezier3Path moveToPoint: CGPointMake(0.5, 6.12)];
    [bezier3Path addLineToPoint: CGPointMake(0.5, 37.5)];
    [bezier3Path addLineToPoint: CGPointMake(rect.size.width, 37.5)];
    [bezier3Path addLineToPoint: CGPointMake(rect.size.width, 33.81)];
    [bezier3Path addLineToPoint: CGPointMake(rect.size.width, 1.5)];
    [bezier3Path addLineToPoint: CGPointMake(5.5, 1.5)];
    [bezier3Path addLineToPoint: CGPointMake(0.5, 6.12)];
    [bezier3Path addLineToPoint: CGPointMake(0.5, 6.12)];
    [bezier3Path closePath];
    [color2 setFill];
    [bezier3Path fill];
    
    //// Bezier Drawing
    UIBezierPath* bezierPath = UIBezierPath.bezierPath;
    [bezierPath moveToPoint: CGPointMake(0.19, 5.05)];
    [bezierPath addLineToPoint: CGPointMake(4.38, 0.54)];
    [bezierPath addLineToPoint: CGPointMake(rect.size.width, 0.54)];
    [strokeColor setStroke];
    bezierPath.lineWidth = 1.5;
    [bezierPath stroke];
    
    
    //// Bezier 2 Drawing
    UIBezierPath* bezier2Path = UIBezierPath.bezierPath;
    [bezier2Path moveToPoint: CGPointMake(rect.size.width, 34.49)];
    [bezier2Path addLineToPoint: CGPointMake(rect.size.width-4, 39)];
    [bezier2Path addLineToPoint: CGPointMake(0.19, 39)];
    [strokeColor setStroke];
    bezier2Path.lineWidth = 1.5;
    [bezier2Path stroke];
    


}

//控制placeHolder的颜色、字体
- (void)drawPlaceholderInRect:(CGRect)rect
{
    
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#A7C5CF"];
    [self.placeholder drawInRect:rect withAttributes:dict];
}
@end
