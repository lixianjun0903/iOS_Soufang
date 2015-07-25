//
//  ZXScanProtocol.m
//  致学在线
//
//  Created by zhixue on 15/5/5.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXScanProtocol.h"
#import "ZXLabel.h"

@interface ZXScanProtocol ()

@end

@implementation ZXScanProtocol

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setNavStatus];
}
- (void)setNavStatus
{
    ZXLabel *titleLabel = [[ZXLabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = @"《中青致学用户使用协议》";
    self.navigationItem.titleView = titleLabel;
    
    UIButton *backBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [backBtn setTitle:@"取消" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:backBtn];
}
#pragma mark -返回
- (void)back
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


@end
