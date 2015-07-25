//
//  YJPayViewController.m
//  友家
//
//  Created by 111111 on 15-5-30.
//  Copyright (c) 2015年 lixinjun. All rights reserved.
//

#import "YJPayViewController.h"
#import "YJChatTableViewCell.h"
#define WIDETH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
@interface YJPayViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong)UITableView * tableView;

@end

@implementation YJPayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
  self.title = @"友聊";
    [self createTableView];
    // Do any additional setup after loading the view.
}
-(void)createTableView
{
    UITableView  *tableView  =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDETH, HEIGHT-64)];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [self.view addSubview:tableView];

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    YJChatTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (!cell) {
        cell = [YJChatTableViewCell mychatCell];
    }
    [cell setContentWithTitle:nil andImage:nil];
    return cell;

}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 80;
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
