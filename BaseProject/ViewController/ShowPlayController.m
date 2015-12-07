//
//  ShowPlayController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShowPlayController.h"
#import "ShowPlayCell.h"
#import "ShowPlayViewModel.h"


@interface ShowPlayController ()

@property(nonatomic,strong)ShowPlayViewModel *ShowVM;


@end

@implementation ShowPlayController

-(ShowPlayViewModel *)ShowVM{
    if (!_ShowVM) {
        _ShowVM = [ShowPlayViewModel new];
        
    }
    return _ShowVM;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.ShowVM refreshDataCompletionHandle:^(NSError *error) {
           [self.tableView.header endRefreshing];
           [self.tableView reloadData];
           if (error) {
               [self showErrorMsg:error.localizedDescription];
           }
       }];
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.allowsSelection = NO;
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
       [self.ShowVM getMoreDataCompletionHandle:^(NSError *error) {
           [self.tableView.header endRefreshing];
           [self.tableView reloadData];
           if (error) {
               [self showErrorMsg:error.localizedDescription];
           }
       }];
    }];
    
    [self.tableView.header beginRefreshing];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/** 返回每一位英雄的json数据转化为的字典 */
-(NSDictionary *)dicWithID:(NSString *)ID{
    if (ID.integerValue > 127) {
        return nil;
    }
    
    NSString *path = [[NSBundle mainBundle]pathForResource:ID ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSError *error = nil;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&error];
    return dic;
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.ShowVM.rowNumber;
}

//-(NSInteger)timeForString:(NSString *)string{
//    NSInteger time = (string).integerValue;
//    
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ShowPlayCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.autorLb.text = [self.ShowVM nickNameForRow:indexPath.row];
    /** 时间 */
    //NSString *str = [self.ShowVM titleForRow:indexPath.row];
    NSDictionary *dic = [self dicWithID:[self.ShowVM IDForRow:indexPath.row]];
    
    
    /** 英雄图标  */
    [cell.iconIV setImage:[UIImage imageNamed:[dic valueForKey:@"duoname"]]];
    /** 题目 地图 和 战斗力*/
    cell.titleLb.text = [self.ShowVM titleForRow:indexPath.row];
    cell.mapLb.text = [self.ShowVM mapForRow:indexPath.row];
    cell.areaLb.text = [self.ShowVM areaForRow:indexPath.row];
    cell.zdlLb.text = [self.ShowVM zdlForRow:indexPath.row];
    /** 召唤师名字 */
    cell.summonerLb.text = [self.ShowVM summonerForRow:indexPath.row];
    /** 装备 未实现*/
    NSString *equil = [self.ShowVM equipsForRow:indexPath.row];
    NSArray *array = [equil componentsSeparatedByString:@","];
    NSString *e1 = [array[0] stringByAppendingString:@".jpg"];
    NSString *e2 = [array[1] stringByAppendingString:@".jpg"];
    NSString *e3 = [array[2] stringByAppendingString:@".jpg"];
    NSString *e4 = [array[3] stringByAppendingString:@".jpg"];
    NSString *e5 = [array[4] stringByAppendingString:@".jpg"];
    NSString *e6 = [array[5] stringByAppendingString:@".jpg"];
    [cell.equil1IV setImage:[UIImage imageNamed:e1]];
    [cell.equil2IV setImage:[UIImage imageNamed:e2]];
    [cell.equil3IV setImage:[UIImage imageNamed:e3]];
    [cell.equil4IV setImage:[UIImage imageNamed:e4]];
    [cell.equil5IV setImage:[UIImage imageNamed:e5]];
    [cell.equil6IV setImage:[UIImage imageNamed:e6]];
    /** 赞 和 评论 */
    cell.goodLb.text = [self.ShowVM goodForRow:indexPath.row];
    cell.commentLb.text = [self.ShowVM commentForRow:indexPath.row];
    
    
    return cell;
}

/* 统计用户进入此界面的时长、频率等，看当前界面是否受欢迎 */
-(void)viewWillAppear:(BOOL)animated{
    
    [MobClick beginLogPageView:@"ViewController"];
}

-(void)viewWillDisappear:(BOOL)animated{
    [MobClick endLogPageView:@"ViewController"];
}
@end
