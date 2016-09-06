//
//  MainViewController.m
//  PasswordBook
//
//  Created by Rany on 16/9/2.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "MainViewController.h"
#import "UIHelpers.h"
#import "MainViewCell.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithHexString:@"#2D3154"];
    
    UIView *bgView = [[UIView alloc]initWithFrame:self.tableView.bounds];
    
    bgView.backgroundColor = [UIColor colorWithHexString:@"#2D3154"];
    
    self.tableView.backgroundView = bgView;
    
    self.tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);
    
    [self initUI];
    

    
}

- (void)initUI {

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

#pragma mark - tabelView delegate & dataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"MainViewCellID";
    
    MainViewCell *cell = (MainViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
  
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 60;
}
//
//-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
//    
//}
//
//-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    
//}

@end
