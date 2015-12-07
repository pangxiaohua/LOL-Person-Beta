//
//  CallSkillController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "CallSkillController.h"
#import "TRImageView.h"


@interface CallSkillCell : UICollectionViewCell

@property(nonatomic,strong)TRImageView *iconIV;
@property(nonatomic,strong)UILabel *nameLB;

@end

@implementation CallSkillCell

-(TRImageView *)iconIV{
    if (!_iconIV) {
        _iconIV = [[TRImageView alloc]init];
        [self.contentView addSubview:_iconIV];
        [_iconIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.height.mas_equalTo(52);
        }];
    }
    return _iconIV;
}

-(UILabel *)nameLB{
    if (!_nameLB) {
        _nameLB = [UILabel new];
        _nameLB.font = [UIFont systemFontOfSize:12];
        _nameLB.textColor = [UIColor whiteColor];
        [self.contentView addSubview:_nameLB];
        [_nameLB mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.iconIV.mas_bottom).mas_equalTo(3);
            make.centerX.mas_equalTo(0);
        }];
    }
    return _nameLB;
}
@end

@interface CallSkillController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic,strong)NSArray *arr1;
@property(nonatomic,strong)NSArray *arr2;
@property(nonatomic,strong)UICollectionView *collectionVM;

@end

@implementation CallSkillController

-(UICollectionView *)collectionVM{
    if (!_collectionVM) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionVM = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionVM.backgroundColor = kRGBColor(31, 36, 42);
        
        [_collectionVM registerClass:[CallSkillCell class] forCellWithReuseIdentifier:@"Cell2"];
    }
    return _collectionVM;
}



-(NSArray *)arr1{
    if (!_arr1) {
        _arr1 = [NSArray new];
        _arr1 = @[@"卫戍部队",@"幽灵疾步",@"治疗术",@"清晰术",@"重生",@"净化",@"惩戒",@"传送",@"屏障",@"引燃",@"虚弱",@"洞察",@"闪现"];
    }
    return _arr1;
}

-(NSArray *)arr2{
    if (!_arr2) {
        //_arr2 = [NSArray new];
        _arr2 = @[@"more1.jpg",@"more2.jpg",@"more3.jpg",@"more4.jpg",@"more5.jpg",@"more6.jpg",@"more7.jpg",@"more8.jpg",@"more9.jpg",@"more10.jpg",@"more11.jpg",@"more12.jpg",@"more13.jpg"];
    }
    return _arr2;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.collectionVM];
    self.collectionVM.delegate = self;
    self.collectionVM.dataSource = self;
    [self.collectionVM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.title = @"召唤师技能";
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return self.arr1.count;
}

-(NSString *)picNameWithIndex:(NSInteger)index{
    return self.arr2[index];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    CallSkillCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell2" forIndexPath:indexPath];
    
    [cell.iconIV.imageView setImage:[UIImage imageNamed:[self picNameWithIndex:indexPath.row]]];
    cell.nameLB.text = self.arr1[indexPath.row];
    
    return cell;
}

//四周边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}

//每个cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (self.view.bounds.size.width-30)/4;
    CGFloat height = width;
    return CGSizeMake(width, height);
}

@end
