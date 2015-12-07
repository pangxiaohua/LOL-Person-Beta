//
//  WonderfulController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WonderfulController.h"
#import "WonderfulViewModel.h"
#import "TRImageView.h"


@interface WonderfulCell : UITableViewCell

@property(nonatomic,strong)TRImageView *iconIV;
@property(nonatomic,strong)UILabel *titleLb;
@property(nonatomic,strong)UIView *containView;
@property(nonatomic,strong)UIView *lineView;

@end

@implementation WonderfulCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        /* 0代表没有右边的小箭头，1代表有 */
        self.accessoryType = 0;
    }
    return self;
}

-(UIView *)containView{
    if (!_containView) {
        _containView = [[UIView alloc]init];
        [self.contentView addSubview:_containView];
        _containView.backgroundColor = [UIColor whiteColor];
        [_containView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(5);
            make.right.bottom.mas_equalTo(-5);
        }];
    }
    return _containView;
}

-(UILabel *)titleLb{
    if (!_titleLb) {
        _titleLb = [[UILabel alloc]init];
        [self.containView addSubview:_titleLb];
        [_titleLb mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(5);
            make.top.mas_equalTo(6);
            make.right.mas_equalTo(-5);
        }];
    }
    return _titleLb;
}
-(UIView *)lineView{
    if (!_lineView) {
        _lineView = [UIView new];
        _lineView.backgroundColor = [UIColor lightGrayColor];
        [self.containView addSubview:_lineView];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(self.titleLb.mas_bottom).mas_equalTo(5);
            make.width.mas_equalTo(1);
        }];
    }
    return _lineView;
}

-(TRImageView *)iconIV{
    if (!_iconIV) {
        /** 必须使用这个初始化方法，因为TRImage类中重写了这个方法 */
        _iconIV = [[TRImageView alloc]init];
        [self.containView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.lineView.mas_bottom).mas_equalTo(5);
            make.left.mas_equalTo(5);
            make.right.bottom.mas_equalTo(-5);
        }];
    }
    return _iconIV;
}
@end

@interface WonderfulController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong)UITableView *tableView;
@property(nonatomic,strong)WonderfulViewModel *wonderfulVM;

@end

@implementation WonderfulController

/** 实现wonderfulVM的懒加载 */
-(WonderfulViewModel *)wonderfulVM{
    if (!_wonderfulVM) {
        _wonderfulVM = [WonderfulViewModel new];
    }
    return _wonderfulVM;
}

/** 实现tableView的懒加载 */
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[WonderfulCell class] forCellReuseIdentifier:@"Cell"];
        _tableView.rowHeight = 135;
    }
    return _tableView;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"精彩专栏";
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.tableView.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.wonderfulVM refreshDataCompleteHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                [_tableView reloadData];
            }
            [_tableView.header endRefreshing];
        }];
    }];
    
    self.tableView.footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        [self.wonderfulVM getMoreDataCompleteHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.description];
            }
            [_tableView.footer endRefreshing];
            [_tableView reloadData];
        }];
    }];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.tableView.header beginRefreshing];
}

#pragma mark - UITableView
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.wonderfulVM.rowNumber;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WonderfulCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    cell.backgroundColor = kRGBColor(31, 36, 42);
    cell.titleLb.text = [self.wonderfulVM titleForRow:indexPath.row];
    [cell.iconIV.imageView setImageWithURL:[self.wonderfulVM urlForRow:indexPath.row]];
   // cell.selectionStyle = UITableViewCellSeparatorStyleNone;
    return cell;
}

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
