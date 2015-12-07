//
//  FindCompanyController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FindCompanyController.h"
#import "FindCompanyCell.h"
#import "FindCompanyViewModel.h"

@interface FindCompanyController ()
@property(nonatomic,strong)FindCompanyViewModel *comVM;
@property(nonatomic,strong)UIView *viewpage;
@end

@implementation FindCompanyController

-(FindCompanyViewModel *)comVM{
    if (!_comVM) {
        _comVM = [FindCompanyViewModel new];
    }
    return _comVM;
}

-(UIView *)viewpage{
    if (!_viewpage) {
        _viewpage = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kWindowW, 44)];
        UILabel *label = [[UILabel alloc]init];
        label.text = @"已经刷新至最新状态！";
        label.textColor = [UIColor greenColor];
        label.font = [UIFont systemFontOfSize:15];
        [_viewpage addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _viewpage;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
       [self.comVM refreshDataCompletionHandle:^(NSError *error) {
           [self.tableView reloadData];
           if (error) {
               [self.tableView showErrorMsg:error.localizedDescription];
           }
       }];
    [self.tableView.header beginRefreshing];
    [self.tableView.header addSubview:_viewpage];
    //不可点击
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
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

    return self.comVM.rowNumber;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    FindCompanyCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.nickNameLb.text = [self.comVM nickNameLbForRow:indexPath.row];
    NSString *sex = [self.comVM sexForRow:indexPath.row];
    if ([sex isEqualToString:@"1"]) {
        [cell.sexIV setBackgroundColor:[UIColor blueColor]];
        [cell.sexIV setImage:[UIImage imageNamed:@"boy"]];
    }else if ([sex isEqualToString:@"2"]){
        [cell.sexIV setBackgroundColor:[UIColor redColor]];
        [cell.sexIV setImage:[UIImage imageNamed:@"girl"]];
    }
    NSString *area = [self.comVM areaForRow:indexPath.row];
    NSString *summoner = [self.comVM summonerForRow:indexPath.row];
    cell.areaLb.text = [NSString stringWithFormat:@"召唤师:(%@)%@",area,summoner];
    cell.zdlLb.text = [self.comVM zdlForRow:indexPath.row];
    NSString *enable_voice = [self.comVM enable_voiceForRow:indexPath.row];
    if ([enable_voice isEqualToString:@"0"]) {
        cell.kaHeiLb.text = [NSString stringWithFormat:@"开黑语言：不确定"];
    }else if ([enable_voice isEqualToString:@"2"]){
        cell.kaHeiLb.text = [NSString stringWithFormat:@"开黑语言：不愿意"];
    }else{
        cell.kaHeiLb.text = [NSString stringWithFormat:@"开黑语言：普通话"];
    }
    
    NSString *city = [self.comVM cityForRow:indexPath.row];
    if (city==NULL) {
        cell.cityLb.text = @"所在城市：未知";
    }else{
        cell.cityLb.text = [NSString stringWithFormat:@"所在城市：%@",city];
    }
    cell.sloganLb.text = [NSString stringWithFormat:@"约战宣言：%@",[self.comVM sloganForRow:indexPath.row]];
    cell.goodLb.text = [self.comVM goodForRow:indexPath.row];
    cell.commentLb.text = [self.comVM commentForRow:indexPath.row];
    
    //头像
    [cell.iconIV setImageWithURL:[self.comVM avatarForRow:indexPath.row]];
    cell.iconIV.layer.cornerRadius = 25;
    //时间
    NSString *time = [self.comVM createdForRow:indexPath.row];
    NSString *str2 = [time substringWithRange:NSMakeRange(5, 11)];
    cell.timeLb.text = str2;
    
    return cell;
}

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
