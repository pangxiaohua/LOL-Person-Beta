//
//  NovelController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NovelController.h"
#import "NovelViewModel.h"
#import "TRImageView.h"
#import "NovelTableViewCell.h"

@interface NovelController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tabView;
@property(nonatomic,strong)NovelViewModel *NovelVM;
@end

@implementation NovelController
/** 在view上加的tableView 用懒加载方法初始化*/
-(UITableView *)tabView{
    if (!_tabView) {
        /** tableView的初始化和配置 */
        _tabView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tabView.delegate = self;
        _tabView.dataSource = self;
        [_tabView registerClass:[NovelTableViewCell class] forCellReuseIdentifier:@"Cell"];
        _tabView.rowHeight = 80;
        
        /** 添加tableView的约束 */
        [self.view addSubview:_tabView];
        [_tabView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        
        /** tableView的头部刷新 */
        _tabView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            /** ViewModel，用这个模层来加载数据 */
            [self.NovelVM refreshDataCompleteHandle:^(NSError *error) {
                if (error) {
                    [self showErrorMsg:error.localizedDescription];
                }else{
                    [self.tabView reloadData];
                }
                [self.tabView.header endRefreshing];
            }];
        }];
        [_tabView.header beginRefreshing]; /** 进入刷新状态 */
    }
    return _tabView;
}

/** ViewModel，用这个模层来加载数据 */
-(NovelViewModel *)NovelVM{
    if (!_NovelVM) {
        _NovelVM = [[NovelViewModel alloc]init];
    }
    return _NovelVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /** 设置tableView不可点击，用来触发tableView的懒加载 */
    self.tabView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.title = @"小说专辑";
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.NovelVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NovelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [cell.imageIV.imageView setImageWithURL:[self.NovelVM picUrlForRow:indexPath.row]];
    cell.nameLb.text = [self.NovelVM titleForRow:indexPath.row];
    cell.descLb.text = [self.NovelVM descForRow:indexPath.row];
    cell.backgroundColor = kRGBColor(234, 239, 239);
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
