//
//  HeroDetailController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroDetailController.h"
#import "HeroDetailCell.h"
#import "bgAndTipCell.h"

@interface HeroDetailController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)UITableView *tabVM;

@end

@implementation HeroDetailController

-(UITableView *)tabVM{
    if (!_tabVM) {
        _tabVM = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tabVM.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tabVM.allowsSelection = NO;
        [_tabVM registerClass:[HeroDetailCell class] forCellReuseIdentifier:@"DetailCell"];
        [_tabVM registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
        [_tabVM registerClass:[bgAndTipCell class] forCellReuseIdentifier:@"bgTipCell"];
    }
    return _tabVM;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.tabVM];
    self.tabVM.delegate = self;
    self.tabVM.dataSource = self;
    self.title = @"英雄详情";
    self.view.backgroundColor = kRGBColor(31, 36, 42);
    NSLog(@"backcolor %@",self.view.backgroundColor);
    
    [self.tabVM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary *dic = self.dictionary;
    
    UITableViewCell *cell = nil;
    if (indexPath.row == 0) {
        //    UITableViewCell *cell = nil;
        cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
        HeroDetailCell *Hcell = (HeroDetailCell *)cell;
        
        // HeroDetailCell *HCell = (HeroDetailCell *)cell;
        Hcell.backgroundColor = kRGBColor(31, 36, 42);
        Hcell.blood.text = [NSString stringWithFormat:@"生 命 值 %@",dic[@"blood"]];
        Hcell.blood_recovery.text = [NSString stringWithFormat:@"生命回复 %@",dic[@"blood_recovery"]];
        Hcell.mana.text = [@"法 力 值 " stringByAppendingString:dic[@"mana"]];
        Hcell.magic_recovery.text = [NSString stringWithFormat:@"法力回复 %@",dic[@"magic_recovery"]];
        Hcell.attack.text = [NSString stringWithFormat:@"攻 击 力 %@",dic[@"attack"]];
        Hcell.attack_speed.text = [NSString stringWithFormat:@"攻击速度 %@",dic[@"attack_speed"]];
        Hcell.range.text = [NSString stringWithFormat:@"射      程 %@",dic[@"range"]];
        Hcell.armor.text = [NSString stringWithFormat:@"护 甲 值 %@",dic[@"armor"]];
        Hcell.magic_resistance.text = [NSString stringWithFormat:@"法术抗性 %@",dic[@"magic_resistance"]];
        Hcell.moving_speed.text = [NSString stringWithFormat:@"移动速度 %@",dic[@"moving_speed"]];
        
        //return cell;
    }else{
       cell = [tableView dequeueReusableCellWithIdentifier:@"bgTipCell"];
        bgAndTipCell *Bcell = (bgAndTipCell *)cell;
        //bgAndTipCell *bCell = (bgAndTipCell *)cell;
        Bcell.backgroundColor = kRGBColor(31, 36, 42);
        if (indexPath.row == 1) {
            Bcell.tip.text =@"使用技巧";
            Bcell.contentLb.text = dic[@"usetip"];
        }else if (indexPath.row == 2){
            Bcell.tip.text = @"对抗技巧";
            Bcell.contentLb.text = dic[@"killtip"];
        }else if(indexPath.row==3){
            Bcell.tip.text = @"英雄背景";
            Bcell.contentLb.text = dic[@"bg"];
        }
    }
          return cell;
    
}

/** 自动扩高*/
-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 130;
    }
    return UITableViewAutomaticDimension;
}


/* 统计用户进入此界面的时长、频率等，看当前界面是否受欢迎 */
-(void)viewWillAppear:(BOOL)animated{
    
    [MobClick beginLogPageView:@"ViewController"];
}

-(void)viewWillDisappear:(BOOL)animated{
    [MobClick endLogPageView:@"ViewController"];
}

@end
