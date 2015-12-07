//
//  ReallyShowController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ReallyShowController.h"
#import "ReallyShowCell.h"
#import "ReallyViewModel.h"

@interface ReallyShowController ()

@property (strong, nonatomic) IBOutlet UITableView *tetableView;

@property(nonatomic,strong)ReallyViewModel *reallyVM;

@end

@implementation ReallyShowController

-(ReallyViewModel *)reallyVM{
    if (!_reallyVM) {
        _reallyVM = [[ReallyViewModel alloc]init];
    }
    return _reallyVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tetableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.reallyVM refreshDataCompleteHandle:^(NSError *error) {
            [_tetableView.header endRefreshing];
            [_tetableView reloadData];
            if (error) {
                [_tetableView showErrorMsg:error.localizedDescription];
            }
        }];
    }];
    
    _tetableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.reallyVM getMoreDataCompleteHandle:^(NSError *error) {
            
            if (error) {
                [_tetableView showErrorMsg:error.localizedDescription];
            }
            [_tetableView.footer endRefreshing];
            [_tetableView reloadData];
            
        }];
    }];
    
    //去掉分割线
    _tetableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tetableView.header beginRefreshing];
    
    /** 隐藏导航栏 */
    //[self.navigationController setNavigationBarHidden:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.reallyVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    ReallyShowCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    /** 头像 */
    [cell.imageIV setImageWithURL:[self.reallyVM avatarForRow:indexPath.row]];
    cell.imageIV.layer.cornerRadius = 30;
    /** 掌游宝账号 */
    cell.nameLb.text = [self.reallyVM nickNameForRow:indexPath.row];
    /** 判断男孩女孩 */
    NSString *isBoy = [self.reallyVM sexForRow:indexPath.row];
    if ([isBoy isEqualToString:@"1"]) {
        [cell.sexIV setBackgroundColor:[UIColor blueColor]];
        [cell.sexIV setImage:[UIImage imageNamed:@"boy"]];
    }else if([isBoy isEqualToString:@"2"]){
        [cell.sexIV setBackgroundColor:[UIColor redColor]];
        [cell.sexIV setImage:[UIImage imageNamed:@"girl"]];
    }
    /** 时间 */
    NSString *str = [self.reallyVM createdForRow:indexPath.row];
    NSString *str2 = [str substringWithRange:NSMakeRange(5, 11)];
    cell.timeLb.text = str2;
    /** 大区 */
    NSString *area = [self.reallyVM areaForRow:indexPath.row];
    /** 召唤师名称 */
    NSString *name = [self.reallyVM summonerForRow:indexPath.row];
    /** 输出长长的一串 */
    NSString *area2 = [NSString stringWithFormat:@"召唤师:(%@)%@",area,name];
    cell.nickNameLb.text = area2;
    /** 爆照 */
    [cell.picIV setImageWithURL:[NSURL URLWithString:[self.reallyVM pic_url_smallForRow:indexPath.row]]];
    /** 按比例放大 */
    cell.picIV.contentMode = 2;
    /** 把超出界面的部分剪掉 */
    cell.picIV.clipsToBounds = YES;
    /** 详情 */
    cell.descLb.text = [self.reallyVM descForRow:indexPath.row];
    /** 被赞次数 */
    cell.goodLb.text = [self.reallyVM goodForRow:indexPath.row];
    /** 评论数 */
    cell.commentLb.text = [self.reallyVM commentForRow:indexPath.row];
    return cell;
}


kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/* 统计用户进入此界面的时长、频率等，看当前界面是否受欢迎 */
-(void)viewWillAppear:(BOOL)animated{
    
    [MobClick beginLogPageView:@"ViewController"];
}

-(void)viewWillDisappear:(BOOL)animated{
    [MobClick endLogPageView:@"ViewController"];
}

@end
