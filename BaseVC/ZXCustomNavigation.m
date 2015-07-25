//
//  ZXCustomNavigation.m
//  致学在线
//
//  Created by zhixue on 15/4/29.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXCustomNavigation.h"

@interface ZXCustomNavigation ()

@end

@implementation ZXCustomNavigation
+ (void)initialize
{
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    
    navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
    [navigationBar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    navigationBar.shadowImage = [[UIImage alloc] init];
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 滑动手势
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeAction:)];
    swipe.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipe];
}
- (void)swipeAction:(UISwipeGestureRecognizer *)gesture
{
    if (self.viewControllers.count > 0)
    {
        [self popViewControllerAnimated:YES];
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 0)
    {
//        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem itermWithTarget:self Action:@selector(pop) Image:@"back" ];
        
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    [super pushViewController:viewController animated:animated];
}
#pragma mark -返回
- (void)pop
{
    [self popViewControllerAnimated:YES];
}
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}
@end
