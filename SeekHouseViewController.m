//
//  SeekHouseViewController.m
//  友家
//
//  Created by 111111 on 15-5-31.
//  Copyright (c) 2015年 lixinjun. All rights reserved.
//

#import "SeekHouseViewController.h"
#import "SeakHouseCell.h"
@interface SeekHouseViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * tableView;
}

@end

@implementation SeekHouseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
     //    self.view.backgroundColor =[UIColor greenColor];
    [self createTableView];
    
    // Do any additional setup after loading the view.
}
-(void)createTableView
{
    tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width , self.view.frame.size.height)];
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SeakHouseCell  * cell =[tableView dequeueReusableCellWithIdentifier:@"ID"];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"SeakHouseCell" owner:self options:nil] lastObject];
    }
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 90;
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
