//
//  EditViewController.m
//  PasswordBook
//
//  Created by Rany on 16/9/12.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "EditViewController.h"
#import "customField.h"

@interface EditViewController ()
@property (strong, nonatomic) IBOutlet customField *titleField;
@property (strong, nonatomic) IBOutlet UITextField *accountField;
@property (strong, nonatomic) IBOutlet UITextField *pwdField;
@property (strong, nonatomic) IBOutlet UIView *selectionView;
@property (strong, nonatomic) IBOutlet UIButton *uploadButton;

@end

@implementation EditViewController

+(instancetype)loadStroyBoardVC
{
    UIStoryboard *sb = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
    
    return  [sb instantiateViewControllerWithIdentifier:@"EditViewController"];

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([_titleField canBecomeFirstResponder]) {

        [_titleField becomeFirstResponder];

    }
    
    self.selectionView.hidden = YES;
    
    UIView *maskView = [[UIView alloc]initWithFrame:self.uploadButton.bounds];
    
    maskView.backgroundColor = [UIColor whiteColor];
    
    self.uploadButton.maskView = maskView;
    
    UIView *bgView = [[UIView alloc]initWithFrame:self.uploadButton.frame];
    
    bgView.backgroundColor = [UIColor redColor];
    
    [self.selectionView insertSubview:bgView belowSubview:self.uploadButton];
    
    
}


- (IBAction)cancleClick:(id)sender {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)confirmClick:(id)sender {
    
    self.selectionView.hidden = ![self.selectionView isHidden];
}
- (IBAction)uploadClick:(id)sender {
}
- (IBAction)localClick:(id)sender {
}

- (void)loadingWithButton:(id)sender
{
    UIButton *button = (UIButton *)sender;
    
  
    
    
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if ([_titleField resignFirstResponder]) {
        
        [_titleField resignFirstResponder];
        
    }else if ([_accountField resignFirstResponder]){
        
        [_accountField resignFirstResponder];
        
    }else if([_pwdField resignFirstResponder]){
        
        [_pwdField resignFirstResponder];
        
    }else{
        
        if (![self.selectionView isHidden]) {
            
            self.selectionView.hidden = YES;
        }
    }
}

@end
