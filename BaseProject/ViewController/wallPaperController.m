//
//  wallPaperController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "wallPaperController.h"
#import "TRImageView.h"
#import "wallPaperViewModel.h"
#import "wallPaperDetailController.h"

@interface wallPaperCell : UICollectionViewCell

@property(nonatomic,strong)TRImageView *imageIV;

@end

@implementation wallPaperCell

-(TRImageView *)imageIV{
    if (!_imageIV) {
        _imageIV = [[TRImageView alloc]init];
        [self.contentView addSubview:_imageIV];
        [_imageIV mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    return _imageIV;
}
@end

@interface wallPaperController ()<UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource>
@property(nonatomic,strong)UICollectionView *collectionVM;
@property(nonatomic,strong)wallPaperViewModel *wallPaperVM;
@end

@implementation wallPaperController

-(UICollectionView *)collectionVM{
    if (!_collectionVM) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        _collectionVM = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionVM.backgroundColor = [UIColor whiteColor];
       
        [_collectionVM registerClass:[wallPaperCell class] forCellWithReuseIdentifier:@"Cell"];
        _collectionVM.delegate = self;
        _collectionVM.dataSource = self;
    }
    return _collectionVM;
}

-(wallPaperViewModel *)wallPaperVM{
    if (!_wallPaperVM) {
        _wallPaperVM = [[wallPaperViewModel alloc]init];
    }
    return _wallPaperVM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"壁纸";
    [self.view addSubview:self.collectionVM];
    
    [self.collectionVM mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
    self.collectionVM.header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.wallPaperVM refreshDataCompleteHandle:^(NSError *error) {
            if (error) {
                [self showErrorMsg:error.localizedDescription];
            }else{
                [self.collectionVM reloadData];
            }
            [self.collectionVM.header endRefreshing];
        }];
    }];
    
    
    self.collectionVM.footer = [MJRefreshBackFooter footerWithRefreshingBlock:^{
       [self.wallPaperVM getMoreDataCompleteHandle:^(NSError *error) {
           if (error) {
               [self showErrorMsg:error.localizedDescription];
           }else{
               [_collectionVM reloadData];
           }
           [_collectionVM.footer endRefreshing];
       }];
    }];
    
    
    [self.collectionVM.header beginRefreshing];
    
}

#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.wallPaperVM.rowNumber;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    wallPaperCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    
    [cell.imageIV.imageView setImageWithURL:[self.wallPaperVM urlForRow:indexPath.row]];
    return cell;
}

/** 四周边距，分别是上、左、下、右。皆正数即代表距离 */
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 0, 10);
}

/** 每个cell的大小 */
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (self.view.bounds.size.width-30)/2;
    CGFloat height = 115;
    return CGSizeMake(width, height);
}

/** 点击方法，松后去掉高亮状态，并推出下一个界面，将大图片的地址传递给下一个界面 */
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    wallPaperDetailController *vc = [[wallPaperDetailController alloc]init];
    vc.pic_url = [self.wallPaperVM picForRow:indexPath.row];
    [self.navigationController pushViewController:vc animated:YES];
}


/** 统计用户进入此界面的时长、频率等，看当前界面是否受欢迎 */
-(void)viewWillAppear:(BOOL)animated{
    
    [MobClick beginLogPageView:@"ViewController"];
}

-(void)viewWillDisappear:(BOOL)animated{
    [MobClick endLogPageView:@"ViewController"];
}

@end
