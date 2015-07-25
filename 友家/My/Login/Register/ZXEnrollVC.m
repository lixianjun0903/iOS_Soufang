//
//  ZXEnrollVC.m
//  致学在线
//
//  Created by zhixue on 15/5/4.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXEnrollVC.h"
#import "ZXCustomNavigation.h"
#import "ZXScanProtocol.h"
#import "ZXLabel.h"

@interface ZXEnrollVC ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkTextField;
@property (weak, nonatomic) IBOutlet UIButton *registerBtn;

@property (nonatomic,strong)UIButton *checkBtn;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,assign)NSInteger time;
@end

@implementation ZXEnrollVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavStatus];
    [self setcontent];
}
- (void)setNavStatus
{
    ZXLabel *titleLabel = [[ZXLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"注册新用户";
    self.navigationItem.titleView = titleLabel;
}
- (void)setcontent
{
    self.time = 30;
    
    self.phoneTextField.leftViewMode = UITextFieldViewModeAlways;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 10, 40, 20)];
    label.text = @"+86";
    label.textAlignment = NSTextAlignmentRight;
    label.textColor = color(153, 153, 153);
    self.phoneTextField.leftView = label;
    
    self.checkTextField.rightViewMode = UITextFieldViewModeAlways;
    UIButton *checkBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
    [checkBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    [checkBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [checkBtn setBackgroundColor:color(153, 153, 153)];
    checkBtn.layer.masksToBounds = YES;
    checkBtn.layer.cornerRadius = 5;
    checkBtn.titleLabel.font = [UIFont systemFontOfSize:15];
    [checkBtn addTarget:self action:@selector(getCheckNumber) forControlEvents:UIControlEventTouchUpInside];
    self.checkBtn = checkBtn;
    self.checkTextField.rightView = checkBtn;
    
    self.passwordTextField.rightViewMode = UITextFieldViewModeAlways;
    UIButton *passWordRightView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    passWordRightView.contentMode = UIViewContentModeCenter;
    [passWordRightView setImage:[UIImage imageNamed:@"login_password_hiden"] forState:UIControlStateNormal];
    [passWordRightView setImage:[UIImage imageNamed:@"login_password_show"] forState:UIControlStateSelected];
    [passWordRightView addTarget:self action:@selector(exchangePasswordStatus:) forControlEvents:UIControlEventTouchUpInside];
    self.passwordTextField.rightView = passWordRightView;
    
    self.registerBtn.layer.masksToBounds = YES;
    self.registerBtn.layer.cornerRadius = 5;
    self.phoneTextField.returnKeyType = UIReturnKeySend;
    self.passwordTextField.returnKeyType = UIReturnKeySend;
    self.checkTextField.returnKeyType = UIReturnKeySend;
}
- (void)getCheckNumber
{
    [self.checkBtn setTitle:[NSString stringWithFormat:@"%ld'后可重发",(long)self.time] forState:UIControlStateNormal];
    [self.checkBtn setBackgroundColor:color(235, 67, 67)];
    self.checkBtn.userInteractionEnabled = NO;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(reduceTime) userInfo:nil repeats:YES];
}
- (void)reduceTime
{
    self.time--;
    [self.checkBtn setTitle:[NSString stringWithFormat:@"%ld'后可重发",(long)self.time] forState:UIControlStateNormal];
    if (self.time == 0)
    {
        [self.timer invalidate];
        self.timer = nil;
        [self.checkBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
        [self.checkBtn setBackgroundColor:color(153, 153, 153)];
        self.checkBtn.userInteractionEnabled = YES;
        self.time = 30;
    }
}
#pragma mark -密码可见不可见
- (void)exchangePasswordStatus:(UIButton *)btn
{
    btn.selected = !btn.selected;
    self.passwordTextField.secureTextEntry = !self.passwordTextField.secureTextEntry;
}
- (IBAction)acceptProtol:(UIButton *)sender
{
    sender.selected = !sender.selected;
}
- (IBAction)readProtol:(UIButton *)sender
{
    ZXScanProtocol *scanVC = [[ZXScanProtocol alloc] init];
    scanVC.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:[[ZXCustomNavigation alloc] initWithRootViewController:scanVC] animated:YES completion:nil];
}
- (IBAction)register:(UIButton *)sender
{
    NSLog(@"注册");
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
@end
