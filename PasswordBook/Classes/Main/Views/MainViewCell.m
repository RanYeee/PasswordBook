//
//  MainViewCell.m
//  PasswordBook
//
//  Created by Rany on 16/9/6.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "MainViewCell.h"

@implementation MainViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
//    UIView *selectBgView = [[UIView alloc]initWithFrame:self.containerView.bounds];
//    
//    selectBgView.alpha = 0.6f;
//    
//    selectBgView.backgroundColor = [UIColor colorWithHexString:@"#AAACC8"];
//    
//    self.selectedBackgroundView = selectBgView;
    
    self.selectionStyle = UITableViewCellSelectionStyleNone;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


@end
