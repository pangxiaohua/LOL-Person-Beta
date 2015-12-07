//
//  VideoListViewController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoListViewController.h"
#import "VideoListViewModel.h"
#import "videosListCell.h"
#import "PlayController.h"

@interface VideoListViewController ()

@property(nonatomic,strong)VideoListViewModel *roomListVM;
@property(nonatomic,strong)PlayController *playVM;

@end

@implementation VideoListViewController


-(VideoListViewModel *)roomListVM{
    if (!_roomListVM) {
        _roomListVM = [[VideoListViewModel alloc]initWithCatId:self.catId.ID CatworDid:self.videoData.ID];
    }
    return _roomListVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.roomListVM refreshDataCompletionHandle:^(NSError *error) {
            [self.tableView.header endRefreshing];
            [self.tableView reloadData];
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }
        }];
    }];
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.roomListVM getMoreDataCompletionHandle:^(NSError *error) {
            [self.tableView.footer endRefreshing];
            [self.tableView reloadData];
        }];
    }];
    [self.tableView.header beginRefreshing];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.roomListVM.rowNumber;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    videosListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    
    
    
    [cell.iconIV setImageWithURL:[self.roomListVM roomIconURLWithRow:indexPath.row]];
    cell.titleLb.text = [self.roomListVM roomTitleWithRow:indexPath.row];
    cell.descLb.text = [self.roomListVM roomDescWithRow:indexPath.row];
  //  self.videoaDress = [self.roomListVM videoForWithRow:indexPath.row];
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    PlayController *vc = [[PlayController alloc]initWithplayStr:[self.roomListVM videoForWithRow:indexPath.row]];
    //vc.playStr = [self.roomListVM videoForWithIndexPath:indexPath];
    [self.navigationController pushViewController:vc animated:YES];
}

/* 统计用户进入此界面的时长、频率等，看当前界面是否受欢迎 */
-(void)viewWillAppear:(BOOL)animated{
    
    [MobClick beginLogPageView:@"ViewController"];
}

-(void)viewWillDisappear:(BOOL)animated{
    [MobClick endLogPageView:@"ViewController"];
}

@end
