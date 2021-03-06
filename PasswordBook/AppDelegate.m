//
//  AppDelegate.m
//  PasswordBook
//
//  Created by Rany on 16/9/1.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "AppDelegate.h"
#import "LoginViewController.h"
#import "IQKeyboardManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    [Bmob registerWithAppKey:@"9c55ef5e4c877a755290b3b9e27bcc77"];
    
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    
    self.mainNavigationController = [[UINavigationController alloc]initWithRootViewController:loginVC];
    
    self.window.rootViewController = self.mainNavigationController;
    
    [self.mainNavigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navigation_bar_background.png"] forBarMetrics:UIBarMetricsDefault];
    
    [self.mainNavigationController.navigationBar setShadowImage:[UIImage imageNamed:@"navigation_bar_background.png"]];
    
    [self.mainNavigationController.navigationBar setTintColor:[UIColor whiteColor]];
    
//    self.mainNavigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    
    [self.window makeKeyAndVisible];
    
    [[IQKeyboardManager sharedManager]setEnable:YES];
    
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
