//
//  ZXResetVC.m
//  致学在线
//
//  Created by zhixue on 15/5/4.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXResetVC.h"
#import "ZXLabel.h"

@interface ZXResetVC () <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkTextField;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

@end

@implementation ZXResetVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavStatus];
    [self setcontent];
}
- (void)setNavStatus
{
    ZXLabel *titleLabel = [[ZXLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"重置密码";
    self.navigationItem.titleView = titleLabel;
    
    self.passwordTextField.rightViewMode = UITextFieldViewModeAlways;
    UIButton *passWordRightView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    passWordRightView                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              .contentMode = UIViewContentModeCenter;
    passWordRightView.tag = 1;
    [passWordRightView setImage:[UIImage imageNamed:@"login_password_hiden"] forState:UIControlStateNormal];
    [passWordRightView setImage:[UIImage imageNamed:@"login_password_show"] forState:UIControlStateSelected];
    [passWordRightView addTarget:self action:@selector(exchangePasswordStatus:) forControlEvents:UIControlEventTouchUpInside];
    self.passwordTextField.rightView = passWordRightView;
    
    self.checkTextField.rightViewMode = UITextFieldViewModeAlways;
    UIButton *checkRightView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    checkRightView.contentMode = UIViewContentModeCenter;
    checkRightView.tag = 2;
    [checkRightView setImage:[UIImage imageNamed:@"login_password_hiden"] forState:UIControlStateNormal];
    [checkRightView setImage:[UIImage imageNamed:@"login_password_show"] forState:UIControlStateSelected];
    [checkRightView addTarget:self action:@selector(exchangePasswordStatus:) forControlEvents:UIControlEventTouchUpInside];
    self.checkTextField.rightView = checkRightView;
}
- (void)setcontent
{
    self.confirmBtn.layer.masksToBounds = YES;
    self.confirmBtn.layer.cornerRadius = 5;
    self.passwordTextField.delegate = self;
    self.checkTextField.delegate = self;
}
#pragma mark -密码可见不可见
- (void)exchangePasswordStatus:(UIButton *)btn
{
    btn.selected = !btn.selected;
    if (btn.tag == 1)
    {
       self.passwordTextField.secureTextEntry = !self.passwordTextField.secureTextEntry;
        return;
    }
    self.checkTextField.secureTextEntry = !self.checkTextField.secureTextEntry;
}
- (IBAction)confirmPassword:(UIButton *)sender
{
 
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
#pragma mark -
#pragma mark -判断发送键
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString*)text
{
    if ([text isEqualToString:@"\n"])
    {
        //        [self.view endEditing:YES];
        NSLog(@"+++");
        return NO;
    }
    return YES;
}
@end
