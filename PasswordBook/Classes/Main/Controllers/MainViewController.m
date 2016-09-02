//
//  MainViewController.m
//  PasswordBook
//
//  Created by Rany on 16/9/2.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "MainViewController.h"
#import "UIHelpers.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
//    [self buildUI];
    

    
    [self buildUI];
}

- (void)buildUI {

    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(100, 100, 100, 100)];
    
    view.backgroundColor = [UIColor blueColor];
    
    [self.view addSubview:view];
    // Set hidden initiallly
    for (UIView *subview in self.view.subviews) {
        subview.alpha = 0;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [self animateVCShowingUp];
}

#pragma mark - Animations
- (void)animateVCShowingUp {
    [UIView animateWithDuration:0.3 animations:^{
        for (UIView *subview in self.view.subviews) {
            subview.alpha = 1;
        }
    }];
}

@end
