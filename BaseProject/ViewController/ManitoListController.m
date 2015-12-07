//
//  ManitoListController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ManitoListController.h"
#import "TRImageView.h"
#import "ManitoListViewModel.h"

@interface ManitoListCell : UITableViewCell

@property(nonatomic,strong)TRImageView *iconIV;
@property(nonatomic,strong)UILabel *nameLb;
@property(nonatomic,strong)UILabel *positionLb;
@property(nonatomic,strong)UILabel *pointLb;
@property(nonatomic,strong)UILabel *number;

@end

@implementation ManitoListCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = 0;
    }
    return self;
}

-(UILabel *)number{
    if (!_number) {
        _number = [[UILabel alloc]init];
        _number.font = [UIFont systemFontOfSize:18];
        _number.textAlignment = NSTextAlignmentCenter;
        [self.contentView addSubview:_number];
        [_number mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(3);
            make.size.mas_equalTo(CGSizeMake(30, 30));
        }];
    }
    return _number;
}

-(TRImageView *)iconIV{
    if (!_iconIV) {
        
        _iconIV = [[TRImageView alloc]init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.left.mas_equalTo(self.number.mas_right).mas_equalTo(8);
            make.centerY.mas_equalTo(0);
        }];
    }
    return _iconIV;
}

-(UILabel *)nameLb{
    if (!_nameLb) {
        _nameLb = [[UILabel alloc]init];
        _nameLb.font = [UIFont systemFontOfSize:14];
        _nameLb.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_nameLb];
        [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(5);
            make.width.mas_equalTo(110);
        }];
    }
    return _nameLb;
}

-(UILabel *)pointLb{
    if (!_pointLb) {
        _pointLb = [[UILabel alloc]init];
        _pointLb.font = [UIFont systemFontOfSize:14];
        _pointLb.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_pointLb];
        [_pointLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(-5);
            make.width.mas_equalTo(45);
        }];
    }
    return _pointLb;
}

-(UILabel *)positionLb{
    if (!_positionLb) {
        _positionLb = [[UILabel alloc]init];
        _positionLb.font = [UIFont systemFontOfSize:14];
        _positionLb.textColor = [UIColor yellowColor];
        [self.contentView addSubview:_positionLb];
        [_positionLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(0);
            make.right.mas_equalTo(self.pointLb.mas_left).mas_equalTo(-5);
            make.width.mas_equalTo(60);
        }];
    }
    return _positionLb;
}

@end




@interface ManitoListController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)ManitoListViewModel *manitoVM;

@end

@implementation ManitoListController

/** 实现manitoVM懒加载 */
-(ManitoListViewModel *)manitoVM{
    if (!_manitoVM) {
        _manitoVM = [[ManitoListViewModel alloc]init];
    }
    return _manitoVM;
}

/** 实现webView懒加载：设置代理、去掉多余cell、头部刷新、注册cell*/
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[ManitoListCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.rowHeight = 65;
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"大神榜";
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
       [self.manitoVM refreshDataCompleteHandle:^(NSError *error) {
           if (error) {
               [self showErrorMsg:error.localizedDescription];
           }else{
               [_tableView reloadData];
           }
           [_tableView.header endRefreshing];
       }];
    }];
    [self.tableView.header beginRefreshing];
    
}


#pragma mark - UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.manitoVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    ManitoListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.backgroundColor = kRGBColor(31, 36, 42);
    [cell.iconIV.imageView setImageWithURL:[self.manitoVM urlForRow:indexPath.row]];
    cell.nameLb.text = [self.manitoVM nameForRow:indexPath.row];
    cell.pointLb.text = [self.manitoVM pointForRow:indexPath.row];
    cell.positionLb.text = [self.manitoVM positionForRow:indexPath.row];
    cell.number.text = @(indexPath.row + 1).stringValue;
    if (indexPath.row <3) {
        cell.number.textColor = [UIColor orangeColor];
    }else{
        cell.number.textColor = [UIColor lightGrayColor];
    }
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/** 松手后去掉高亮状态 */
kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

/* 统计用户进入此界面的时长、频率等，看当前界面是否受欢迎 */
-(void)viewWillAppear:(BOOL)animated{
    
    [MobClick beginLogPageView:@"ViewController"];
}

-(void)viewWillDisappear:(BOOL)animated{
    [MobClick endLogPageView:@"ViewController"];
}

@end
