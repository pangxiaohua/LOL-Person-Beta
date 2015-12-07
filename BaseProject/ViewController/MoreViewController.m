//
//  MoreViewController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "MoreViewController.h"
#import "MoreCell.h"
#import "GameController.h"
#import "HeKaController.h"
#import "ZhanBuController.h"
#import "GuanFangChaXunController.h"
#import "JingPinShouYouController.h"
#import "ShangChengController.h"
#import "HeroListController.h"
#import "ManitoListController.h"
#import "WonderfulController.h"
#import "CallSkillController.h"
#import "wallPaperController.h"
#import "NovelController.h"
#import "ShowSkinController.h"
#import "LatestViewController.h"

@interface MoreViewController ()<UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)LatestViewController *vc;
@end

@implementation MoreViewController

-(LatestViewController *)vc{
    if (!_vc) {
        _vc = [LatestViewController new];
    }
    return _vc;
}


-(instancetype)initWithInteger:(NSInteger)interger{
    if (self = [super init]) {
        self.dayAndNight = interger;
    }
    return self;
}


-(NSArray *)arr{
    if (!_arr) {
        _arr = [NSArray new];
      
        _arr = @[@"战绩查询",@"赛事",@"英雄榜",@"大神榜",@"精彩专栏",@"小游戏",@"贺卡",@"占卜",@"官方查询",@"天赋模拟",@"符文模拟",@"召唤师技能",@"装备查询",@"壁纸",@"小说",@"精品手游",@"商城",@"皮肤展示",@"护眼模式"];
    }
    return _arr;
}

-(NSArray *)arr2{
    if (!_arr2) {
        _arr2 = @[@"tab1",@"tab2",@"tab3",@"tab4",@"tab5",@"tab6",@"tab7",@"tab8",@"tab9",@"tab10",@"tab11",@"tab12",@"tab14",@"tab15",@"tab16",@"tab17",@"tab18",@"tab19",@"tab13"];
    }
    return _arr2;
}

- (void)viewDidLoad {
    [super viewDidLoad];
   // self.dayAndNight = 0;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.arr.count;
}

-(NSString *)tabWithIndex:(NSInteger)index{
    return self.arr2[index];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    MoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    [cell.imageIV setImage:[UIImage imageNamed:[self tabWithIndex:indexPath.row]]];
    cell.titleLB.text = self.arr[indexPath.row];
    
    return cell;
}

//四周边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}


-(UIViewController *)controllerForIndex:(NSIndexPath *)index{
    UIViewController *vc = nil;
    
    switch (index.row) {
        case 0:
            vc = [GameController new];
            DDLogVerbose(@"%@",vc);
            break;
        case 2:
            vc = [[HeroListController alloc]init];
            break;
        case 3:
            vc = [ManitoListController new];
            break;
        case 4:
            vc = [WonderfulController new];
            break;
        case 6:
            vc = [HeKaController new];
            break;
        case 7:
            vc = [ZhanBuController new];
            break;
        case 8:
            vc = [GuanFangChaXunController new];
            break;
        case 11:
            vc = [[CallSkillController alloc]init];
            break;
        case 13:
            vc = [wallPaperController new];
            break;
        case 14:
            vc = [NovelController new];
            break;
        case 15:
            vc = [JingPinShouYouController new];
            break;
        case 16:
            vc = [ShangChengController new];
            break;
        case 17:
            vc = [ShowSkinController new];
            break;
        default:
            break;
    }
    return vc;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if (indexPath.row==18) {
        
        LatestViewController *vc =[LatestViewController new];
        if ([[vc.userDefaults valueForKey:@"dayAndNight"] isEqualToString:@"day"]) {
            [vc.userDefaults setValue:@"night" forKey:@"dayAndNight"];
        }else{
        [vc.userDefaults setValue:@"day" forKey:@"dayAndNight"];
        }
        return;
    }
    [self.navigationController pushViewController:[self controllerForIndex:indexPath] animated:YES];
    
}

//每个cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = self.view.bounds.size.width/4;
    CGFloat height = width;
    return CGSizeMake(width, height);
}



@end
