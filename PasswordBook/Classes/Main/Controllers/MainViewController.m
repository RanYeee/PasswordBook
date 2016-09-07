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

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    CGFloat _tmpOffsetY;
    
    CGFloat _angle;
}
@property (strong, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) IBOutlet UIButton *addButton;
@property (strong, nonatomic) IBOutlet UIStackView *stackView;

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

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    CGFloat offsetY = scrollView.contentOffset.y + 20;
    

        if (offsetY<0) {
            
            self.stackView.spacing = offsetY+150;

            
           if(offsetY <= -60){
                
                self.stackView.spacing = -60+150;
               
               
           }else{
               
               self.stackView.spacing = offsetY+150;

           }
            

    }
//    NSLog(@"%f",offsetY);
    
    _tmpOffsetY = offsetY;
 
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    CGFloat offsetY = scrollView.contentOffset.y+20;
    NSLog(@"%f",offsetY);

    if (offsetY<=-60) {
        
        [UIView animateWithDuration:0.2 animations:^{
        
//            self.stackView.spacing = -100+150;
            _tableView.contentInset = UIEdgeInsetsMake(60, 0, 0, 0);

        }];
        
        [self startAnimation];
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            
            [UIView animateWithDuration:0.5 animations:^{
                self.stackView.spacing = 150;
                _tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
                
                [self.addButton.layer removeAllAnimations];
            }];
        });
    }
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    NSLog(@"end");
}



-(CABasicAnimation *)rotation:(float)dur degree:(float)degree direction:(int)direction repeatCount:(int)repeatCount
{
    CATransform3D rotationTransform = CATransform3DMakeRotation(degree, 0, 0, direction);
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform"];
    animation.toValue = [NSValue valueWithCATransform3D:rotationTransform];
    animation.duration  =  dur;
    animation.autoreverses = NO;
    animation.cumulative = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = repeatCount;
    animation.delegate = self;
    
    return animation;
    
}

//方法2
- (void)startAnimation
{
    CGAffineTransform endAngle = CGAffineTransformMakeRotation(_angle * (M_PI / 180.0f));
    
    [UIView animateWithDuration:0.001 delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        self.addButton.transform = endAngle;
    } completion:^(BOOL finished) {
        _angle += 5;
        [self startAnimation];
    }];
}
@end
