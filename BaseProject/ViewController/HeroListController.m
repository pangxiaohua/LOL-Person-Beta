//
//  HeroListController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroListController.h"
#import "TRImageView.h"
#import "HeroListViewM.h"

/** 创建自定义cell、图片 + 英雄名字 + 英雄出场率 + 英雄胜率 HeroListCell */
@interface HeroListCell : UITableViewCell

@property(nonatomic,strong)TRImageView *iconIV;
@property(nonatomic,strong)UILabel *nameLb;
@property(nonatomic,strong)UILabel *debutLb;
@property(nonatomic,strong)UILabel *winLb;

@end

@implementation HeroListCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.accessoryType = 0;
    }
    return self;
}

-(TRImageView *)iconIV{
    if (!_iconIV) {
        
        _iconIV = [[TRImageView alloc]init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.size.mas_equalTo(CGSizeMake(50, 50));
            make.left.mas_equalTo(10);
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
            make.top.mas_equalTo(5);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _nameLb;
}

-(UILabel *)debutLb{
    if (!_debutLb) {
        _debutLb = [[UILabel alloc]init];
        [self.contentView addSubview:_debutLb];
        _debutLb.font = [UIFont systemFontOfSize:12];
        _debutLb.textColor = [UIColor lightGrayColor];
        [_debutLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.nameLb.mas_bottom).mas_equalTo(4);
            //make.height.mas_equalTo(20);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
            
        }];
    }
    return _debutLb;
}

-(UILabel *)winLb{
    if (!_winLb) {
        _winLb = [[UILabel alloc]init];
        [self.contentView addSubview:_winLb];
        _winLb.font = [UIFont systemFontOfSize:12];
        _winLb.textColor = [UIColor lightGrayColor];
        [_winLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.debutLb.mas_bottom).mas_equalTo(4);
            make.left.mas_equalTo(self.iconIV.mas_right).mas_equalTo(10);
            make.right.mas_equalTo(-10);
        }];
    }
    return _winLb;
}
@end

@interface HeroListController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)HeroListViewM *heroListVM;

@end

@implementation HeroListController

/** 实现 heroListVM懒加载 */
-(HeroListViewM *)heroListVM{
    if (!_heroListVM) {
        _heroListVM = [[HeroListViewM alloc]init];
    }
    return _heroListVM;
}


/** 实现webView懒加载：设置代理、去掉多余cell、头部刷新、注册cell */
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[HeroListCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.rowHeight = 65;
        
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.heroListVM refreshDataCompleteHandle:^(NSError *error) {
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

-(id)init{
    if (self = [super init]) {
        self.title = @"英雄榜";
    }
    return self;
}


#pragma mark - UITableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.heroListVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HeroListCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    [cell.iconIV.imageView setImageWithURL:[self.heroListVM urlForRow:indexPath.row]];
    cell.nameLb.text = [self.heroListVM HeroNameForRow:indexPath.row];
    NSString *show = @"登场率：";
    cell.debutLb.text = [show stringByAppendingString:[self.heroListVM debutForRow:indexPath.row]];
    NSString *win = @"胜  率：";
    cell.winLb.text = [win stringByAppendingString:[self.heroListVM winForRow:indexPath.row]];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.backgroundColor = kRGBColor(31, 36, 42);
    return cell;
}

/** 松手后去掉高亮状态 */
kRemoveCellSeparator
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
