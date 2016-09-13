//
//  MainViewController.m
//  PasswordBook
//
//  Created by Rany on 16/9/2.
//  Copyright © 2016年 Rany. All rights reserved.
//
#define kRadianToDegrees(radian) (radian*180.0)/(M_PI)

#import "MainViewController.h"
#import "UIHelpers.h"
#import "MainViewCell.h"
#import "EditViewController.h"
#import "MJExtension.h"
#import "CodeModel.h"

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat _tmpOffsetY;
    
    CGFloat _angle;
    
    NSArray *_dataArray;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic)  UIButton *addButton;
@property (strong, nonatomic)  UIButton *menuButton;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor colorWithHexString:@"#2D3154"];
    
    UIView *bgView = [[UIView alloc]initWithFrame:self.tableView.bounds];
    
    bgView.backgroundColor = [UIColor colorWithHexString:@"#2D3154"];
    
    self.tableView.backgroundView = bgView;
    
//    self.tableView.contentInset = UIEdgeInsetsMake(100, 0, 0, 0);

    [self initUI];
    
    [self initData];
    

}

- (void)initUI {
    
    self.addButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    self.addButton.frame = CGRectMake(0, 0, 15, 14);
    
    [self.addButton setBackgroundImage:[UIImage imageNamed:@"addButton"] forState:UIControlStateNormal];
   
    [self.addButton addTarget:self action:@selector(addNewItem) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:self.addButton];
    
    self.navigationItem.rightBarButtonItem = rightButton;
    
    self.navigationController.navigationBar.barStyle = UIBarStyleBlackTranslucent;
    // Set hidden initiallly
    for (UIView *subview in self.view.subviews) {
        subview.alpha = 0;
    }
}

//加载数据
- (void)initData
{
    __weak typeof(self) weakSelf = self;
    
    BmobQuery *query = [BmobQuery queryWithClassName:@"Code"];
    
    [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
       

        _dataArray = [CodeModel configObjectWithArray:array];
        
        [weakSelf.tableView reloadData];
        
        NSLog(@"%@",array);
        
    }];
    
    Bmob
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
    
    return _dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"MainViewCellID";
    
    MainViewCell *cell = (MainViewCell *)[tableView dequeueReusableCellWithIdentifier:cellId forIndexPath:indexPath];
    
    CodeModel *model = _dataArray[indexPath.row];
    
    cell.title_Label.text = model.title;
    
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

- (void)addNewItem
{
    EditViewController *editController = [EditViewController loadStroyBoardVC];
    
    [self.navigationController pushViewController:editController animated:YES];
}

-(void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"%f",scrollView.contentOffset.y);
    
    if (scrollView.contentOffset.y+64 < -60) {
        
        [UIView animateWithDuration:0.3 animations:^{
            
            _tableView.contentInset = UIEdgeInsetsMake(124, 0, 0, 0);
            
        } completion:^(BOOL finished) {
            
            NSLog(@"发起下拉刷新");
            [self startAnimation];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                
                [UIView animateWithDuration:0.5 animations:^{
                    
                    _tableView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
                    
                    [self stopAnimation];
                    
                }];
                
            });
            
        }];
        
    }

}



- (void)startAnimation
{
    CABasicAnimation *animation =  [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //默认是顺时针效果，若将fromValue和toValue的值互换，则为逆时针效果
    animation.fromValue = [NSNumber numberWithFloat:0.f];
    animation.toValue =  [NSNumber numberWithFloat: M_PI *2];
    animation.duration  = 1.0;
    animation.autoreverses = NO;
    animation.fillMode =kCAFillModeForwards;
    animation.repeatCount = MAXFLOAT;
    [self.addButton.layer addAnimation:animation forKey:nil];
    [self.menuButton.layer addAnimation:animation forKey:nil];
    self.addButton.enabled = NO;
    self.menuButton.enabled = NO;
}

- (void)stopAnimation
{
    [self.addButton.layer removeAllAnimations];
    
    [self.menuButton.layer removeAllAnimations];
    
    self.addButton.enabled = YES;
    
    self.menuButton.enabled = YES;

}
@end
