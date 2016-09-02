//
//  LoginViewController.m
//  PasswordBook
//
//  Created by Rany on 16/9/2.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "LoginViewController.h"
#import "LoginBackgroundView.h"
#import "AppDelegate.h"
#import "MainViewController.h"
#import "UIHelpers.h"

@interface LoginViewController ()
{
    UIView *_view;
    
    UIView *_bottomView ;
}
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    LoginBackgroundView *bgView = [[LoginBackgroundView alloc]initWithFrame:self.view.bounds];
        
    
    [self.view addSubview:bgView];
    
    [bgView starLighting];
    

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        [bgView fadeOutComplete:^{
           
            [self animateVCLeavingWithCompletion:^{
                
                [self launchViewController:[[MainViewController alloc]init]];
                
            }];
            
        }];
  
    });
  
}



-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES];
}

- (void)launchViewController:(UIViewController *)launchVC
{
    
    AppDelegate *appdelegate = (AppDelegate *)[[UIApplication sharedApplication]delegate];
    
    [appdelegate.mainNavigationController setViewControllers:@[launchVC]];
    
}

#pragma mark - Animations

- (void)animateVCLeavingWithCompletion:(void (^)(void))completion {
    [UIView animateWithDuration:0.3 animations:^{
        for (UIView *subview in self.view.subviews) {
            subview.alpha = 0;
        }
    } completion:^(BOOL fin){
        completion();
    }];
}

@end
