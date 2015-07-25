//
//  YJChatViewController.m
//  友家
//
//  Created by 111111 on 15-5-30.
//  Copyright (c) 2015年 lixinjun. All rights reserved.
//

#import "YJChatViewController.h"
#import "SeekHouseOrderVC.h"
#import "AppDelegate.h"
@interface YJChatViewController ()

@end

@implementation YJChatViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜房令";
    
    [self createTable];
    self.view.backgroundColor =[UIColor greenColor];
    // Do any additional setup after loading the view.
}
-(void)createTable
{
    SeekHouseOrderVC * seekHouse =[SeekHouseOrderVC alloc];
    
    [seekHouse initWithButtonCount:kKYCCircleMenuButtonsCount
                                         menuSize:kKYCircleMenuSize
                                       buttonSize:kKYCircleMenuButtonSize
                            buttonImageNameFormat:kKYICircleMenuButtonImageNameFormat
                                 centerButtonSize:kKYCircleMenuCenterButtonSize
                            centerButtonImageName:kKYICircleMenuCenterButton
                  centerButtonBackgroundImageName:kKYICircleMenuCenterButtonBackground];
    [self.navigationController addChildViewController:seekHouse];
    
   
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
