//
//  ZXTabBarVC.m
//  致学干部课堂
//
//  Created by zhixue on 15/5/19.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXTabBarVC.h"
#import "YJHouseViewController.h"
#import "SeekHouseViewController.h"
#import "YJPayViewController.h"
#import "YJLiveViewController.h"
#import "ZXCustomNavigation.h"
#import "ZXLoginVC.h"
#import "SeekHouseOrderVC.h"
#define color(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
@interface ZXTabBarVC ()

@end

@implementation ZXTabBarVC
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tabBar.tintColor = color(235, 67, 67);
    
    YJHouseViewController *home = [[YJHouseViewController alloc] init];
    [self addSubViewControl:home title:@"看房" image:@"tabbar_home" selectedImage:@"tabbar_home_highlighted"];
    
    YJPayViewController *message = [[YJPayViewController alloc] init];
    [self addSubViewControl:message title:@"友聊" image:@"tabbar_course" selectedImage:@"tabbar_course_highlighted"];
    
    SeekHouseOrderVC *discover = [[SeekHouseOrderVC alloc] init];
    
    [discover initWithButtonCount:kKYCCircleMenuButtonsCount
                                         menuSize:kKYCircleMenuSize
                                       buttonSize:kKYCircleMenuButtonSize
                            buttonImageNameFormat:kKYICircleMenuButtonImageNameFormat
                                 centerButtonSize:kKYCircleMenuCenterButtonSize
                            centerButtonImageName:kKYICircleMenuCenterButton
  centerButtonBackgroundImageName:kKYICircleMenuCenterButtonBackground];
    [self addSubViewControl:discover title:@"搜房令" image:@"tabbar_question" selectedImage:@"tabbar_question_highlighted"];
   
    ZXLoginVC *me = [[ZXLoginVC alloc] init];
    [self addSubViewControl:me title:@"我" image:@"tabbar_profile" selectedImage:@"tabbar_profile_highligted"];
}

- (void)addSubViewControl:(UIViewController *)subVC title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage
{
    subVC.tabBarItem.title = title;
    subVC.tabBarItem.image = [UIImage imageNamed:image];
    subVC.tabBarItem.selectedImage = [[UIImage imageNamed:selectedImage]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    ZXCustomNavigation *nav = [[ZXCustomNavigation alloc] initWithRootViewController:subVC];
    [self addChildViewController:nav];
   
}

@end
