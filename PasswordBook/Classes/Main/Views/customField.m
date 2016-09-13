//
//  customField.m
//  PasswordBook
//
//  Created by Rany on 16/9/12.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "customField.h"

@implementation customField

-(void)setPlaceHolderColor:(UIColor *)placeHolderColor
{
    self.attributedPlaceholder = [[NSAttributedString alloc] initWithString:self.placeholder attributes:@{NSForegroundColorAttributeName: placeHolderColor}];

}

@end
