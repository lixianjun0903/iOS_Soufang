//
//  ZXSeekVC.m
//  致学在线
//
//  Created by zhixue on 15/5/4.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXSeekVC.h"
#import "ZXResetVC.h"
#import "ZXLabel.h"

@interface ZXSeekVC ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;
@property (weak, nonatomic) IBOutlet UITextField *checkTextField;
@property (weak, nonatomic) IBOutlet UIButton *nextStep;

@property (nonatomic,strong)UIButton *checkBtn;
@property (nonatomic,strong)NSTimer *timer;
@property (nonatomic,assign)NSInteger time;
@end

@implementation ZXSeekVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setNavStatus];
    [self setcontent];
}
- (void)setNavStatus
{
    ZXLabel *titleLabel = [[ZXLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"找回密码";
    self.navigationItem.titleView = titleLabel;
}
- (void)setcontent
{
    self.time = 30;
    
    self.phoneTextField.leftViewMode = UITextFieldViewModeAlways;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 35, 40)];
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
    
    self.nextStep.layer.masksToBounds = YES;
    self.nextStep.layer.cornerRadius = 5;
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

- (IBAction)nextStep:(UIButton *)sender
{
    [self.navigationController pushViewController:[[ZXResetVC alloc] init] animated:YES];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
