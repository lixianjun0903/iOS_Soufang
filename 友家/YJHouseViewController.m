//
//  YJHouseViewController.m
//  友家
//
//  Created by 111111 on 15-5-30.
//  Copyright (c) 2015年 lixinjun. All rights reserved.
//

#import "YJHouseViewController.h"
#import "SeecHouseCell.h"
#import "HouseDetailVC.h"
@interface YJHouseViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView * tableView;
}

@end

@implementation YJHouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"搜房";
    [self createView];
    // Do any additional setup after loading the view.
}
-(void)createView
{
    tableView  =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    tableView.dataSource =self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 20;
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SeecHouseCell * cells =[tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (!cells) {
        cells = [[[NSBundle mainBundle] loadNibNamed:@"SeecHouseCell" owner:self options:nil
                 ] lastObject];
    }
    return cells;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    HouseDetailVC * house = [[HouseDetailVC alloc] init];
    [self.navigationController pushViewController:house animated:YES];
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
