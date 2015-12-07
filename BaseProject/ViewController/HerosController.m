//
//  HerosController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HerosController.h"
#import "HerosViewModel.h"
#import "HeroDetailController.h"
#import "HeroTableViewCell.h"



@interface HerosController ()<UITableViewDataSource,UITableViewDelegate>

@property(nonatomic,strong)UITableView *tableVM;
@property(nonatomic,strong)HerosViewModel *heroVM;
@end

@implementation HerosController



-(UITableView *)tableVM{
    if (!_tableVM) {
        _tableVM = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableVM.rowHeight = 60;
        _tableVM.delegate = self;
        _tableVM.dataSource = self;

    }
    
    return _tableVM;
}

-(HerosViewModel *)heroVM{
    if (!_heroVM) {
        _heroVM = [HerosViewModel new];
    }
    return _heroVM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tableVM];
    [self.tableVM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    
    self.tableVM.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.heroVM refreshDataCompletionHandle:^(NSError *error) {
           if (error) {
               [self showErrorMsg:error.localizedDescription];
           }
           [self.tableVM reloadData];
           
       }];
        [self.tableVM.header endRefreshing];
    }];
    
    [self.tableVM.header beginRefreshing];
    
    [self.tableVM registerClass:[HeroTableViewCell class] forCellReuseIdentifier:@"Cell"];
    self.title = @"周免英雄";
    
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.heroVM.rowNum;
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



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HeroTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    NSString *Id = [self.heroVM IDForRow:indexPath.row];
    
    NSDictionary *dic = [self dicWithID:Id];
    
    /** 先从返回的字典中取到英雄的英文名，然后将它作为图片的名字加载到cell */
    [cell.imageVC.imageView setImage:[UIImage imageNamed:[dic valueForKey:@"duoname"]]];
    /** 取英雄的中文名 */
    cell.nameLb.text = [dic valueForKey:@"nickname"];
    /** 英雄点卷 */
    cell.costLb.text = [dic valueForKey:@"point"];
    /** 英雄点卷图片 */
    [cell.costImg.imageView setImage:[UIImage imageNamed:@"cell_point"]];
    /** 英雄金币 */
    cell.moneyLb.text = [dic valueForKey:@"money"];
    /** 英雄金币图片 */
    [cell.moneyImg.imageView setImage:[UIImage imageNamed:@"cell_money"]];
    
    return cell;
}

kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *Id = [self.heroVM IDForRow:indexPath.row];
    NSDictionary *dic = [self dicWithID:Id];
    HeroDetailController *vc = [HeroDetailController new];
    vc.dictionary = dic;
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
