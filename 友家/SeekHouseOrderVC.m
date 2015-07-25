//
//  SeekHouseOrderVC.m
//  友家
//
//  Created by 111111 on 15-5-30.
//  Copyright (c) 2015年 lixinjun. All rights reserved.
//

#import "SeekHouseOrderVC.h"
#import "SeakHouseCell.h"
#import "SeekHouseViewController.h"
@interface SeekHouseOrderVC ()
@end

@implementation SeekHouseOrderVC

- (void)viewDidLoad {
    [super viewDidLoad];
//    [self createTableView ];
       for (UIButton * button in [self.menu subviews])
        [button setAlpha:.95f];
    
    // Do any additional setup after loading the view.
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)runButtonActions:(id)sender {
    [super runButtonActions:sender];
    
    // Configure new view & push it with custom |pushViewController:| method
    SeekHouseViewController * viewController = [[SeekHouseViewController alloc] init];
//    [viewController.view setBackgroundColor:[UIColor whiteColor]];
//    [viewController setTitle:[NSString stringWithFormat:@"为你搜索到你满意的房"]];
    // Use KYCircleMenu's |-pushViewController:| to push vc
    [self.navigationController pushViewController:viewController animated:YES];
    
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
