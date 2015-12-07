//
//  LatestViewController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/10/29.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LatestViewController.h"
#import "LatestViewModel.h"
#import "LolCell.h"
#import "ScrollDisplayViewController.h"
#import "DetailViewController.h"
#import "MoreViewController.h"

@interface LatestViewController ()<UITableViewDataSource,UITableViewDelegate,ScrollDisplayViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong)LatestViewModel *latestVM;
@property(nonatomic,strong)LolCell *cell2;
@property(nonatomic,strong)ScrollDisplayViewController *sdVC;

@end

@implementation LatestViewController


-(NSUserDefaults *)userDefaults{
    if (!_userDefaults) {
        _userDefaults = [NSUserDefaults standardUserDefaults];
    }
    return _userDefaults;
}

-(LolCell *)cell2{
    if (!_cell2) {
        _cell2 = [[LolCell alloc]init];
    }
    return _cell2;
}


-(LatestViewModel *)latestVM{
    if (!_latestVM) {
        _latestVM = [[LatestViewModel alloc]initWithLolListType:_type];
    }
    return _latestVM;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        [self.latestVM refreshDataCompleteHandle:^(NSError *error) {
            [_tableView.header endRefreshing];
            [_tableView reloadData];
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }
            [self configTableHeader];
        }];
        
    }];
    
    _tableView.footer=[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self.latestVM getMoreDataCompleteHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.description];
            }
            [_tableView.footer endRefreshing];
            [_tableView reloadData];
        }];
        
    }];
    [_tableView.header beginRefreshing];
    //_tableView.backgroundColor = [UIColor whiteColor];
    
    NSString *path = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES).firstObject;
    NSLog(@"library path %@",path);
    
    NSString *model = [self.userDefaults valueForKey:@"dayAndNight"];
    if ([model isEqualToString:@"night"]) {
        self.tableView.backgroundColor = [UIColor yellowColor];
    }else if ([model isEqualToString:@"day"]){
        self.tableView.backgroundColor = [UIColor whiteColor];
    }

    [self.userDefaults addObserver:self forKeyPath:@"dayAndNight" options:NSKeyValueObservingOptionNew context:nil];
    
}



#pragma mark - UITableViewDelegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.latestVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LolCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
   // NSLog(@">%@", [self.latestVM iconURLForRow:indexPath.row].host);
    
    if (![self.latestVM iconURLForRow:indexPath.row].host) {
        
        [cell.titleLb mas_remakeConstraints:^(MASConstraintMaker *make) {
           
            make.left.top.right.mas_equalTo(10);
            make.height.mas_equalTo(36);
            
        }];
        [cell.descLb mas_remakeConstraints:^(MASConstraintMaker *make) {
           
            make.left.right.mas_equalTo(10);
            make.top.mas_equalTo(cell.titleLb.mas_bottom).mas_equalTo(10);
        }];
    }else{
        [cell.titleLb mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(80);
            make.height.mas_equalTo(36);
        }];
        [cell.descLb mas_remakeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(80);
            make.top.mas_equalTo(cell.titleLb.mas_bottom).mas_equalTo(10);
        }];
    }
    //网络加载用的是
    [cell.iconIV sd_setImageWithURL:[self.latestVM iconURLForRow:indexPath.row]];
    cell.titleLb.text = [self.latestVM titleForRow:indexPath.row];
    cell.descLb.text = [self.latestVM descForRow:indexPath.row];
    [cell.descLb setTintColor:[UIColor grayColor]];
    cell.backgroundColor = [UIColor clearColor];
    return cell;
}

/** 去掉单元格和左边栏的间距 */
kRemoveCellSeparator

#pragma mark - didSelectRowAtIndexPath
/** 松手后去掉高亮状态 */
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    DetailViewController *vc = [[DetailViewController alloc]initWithID:[self.latestVM IDForRow:indexPath.row]];
    vc.vidoURL = [self.latestVM videoURlForRow:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)configTableHeader{

    UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0,0,0,135)];
    //传入头部图片的地址
    NSArray *names = @[@"we1.jpg",@"we2.jpg",@"we3.jpg",@"we4.jpg"];
    //把之前的child移除，再新建
   [_sdVC removeFromParentViewController];
    
    _sdVC = [[ScrollDisplayViewController alloc]initWithImgNames:names];
    _sdVC.delegate =self;
    [self addChildViewController:_sdVC];
    [headerView addSubview:_sdVC.view];
    [_sdVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(headerView);
    }];
    
    _tableView.tableHeaderView = headerView;
}

-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    if ([[self.userDefaults valueForKey:@"dayAndNight"] isEqualToString:@"night"]) {
        self.tableView.backgroundColor = [UIColor yellowColor];
    }else{
        self.tableView.backgroundColor = [UIColor whiteColor];
    }
}

/* 统计用户进入此界面的时长、频率等，看当前界面是否受欢迎 */
-(void)viewWillAppear:(BOOL)animated{
    
    [MobClick beginLogPageView:@"ViewController"];
}

-(void)viewWillDisappear:(BOOL)animated{
    [MobClick endLogPageView:@"ViewController"];
}


@end
