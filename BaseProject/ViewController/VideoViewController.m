    //
//  VideoViewController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/3.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoViewController.h"
#import "VideoViewModel.h"
#import "VideoCollectionViewCell.h"
#import "VideoListViewController.h"
@interface VideoViewController ()<UICollectionViewDelegateFlowLayout>

@property(nonatomic,strong)VideoViewModel *videoviewModel;


@property (strong, nonatomic) IBOutlet UICollectionView *collVC;

@end

@implementation VideoViewController

-(VideoViewModel *)videoviewModel{
    if (!_videoviewModel) {
        _videoviewModel = [[VideoViewModel alloc]initWithType:_type];
    }
    return _videoviewModel;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.videoviewModel refreshDataCompleteHandle:^(NSError *error) {
        
        [_collVC reloadData];
        [_collVC.header endRefreshing];
        if (error) {
            [self showErrorMsg:error.localizedDescription];
        }
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <UICollectionViewDataSource>

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.videoviewModel.rowNumber;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    VideoCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"Cell" forIndexPath:indexPath];
    [cell.iconIV setImageWithURL:[self.videoviewModel iconURLWithrow:indexPath]];
    cell.nameLabel.text = [self.videoviewModel nameWithrow:indexPath];
    cell.iconIV.layer.cornerRadius = 5;
    cell.iconIV.clipsToBounds = YES;
    return cell;
}

//四周边距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(10, 10, 10, 10);
}

//列间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
//行间距
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}

//每个cell的大小
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGFloat width = (self.view.bounds.size.width - 40)/3;
    CGFloat height = width;
    return CGSizeMake(width, height);
}

//-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//    VideoListViewController *vc = segue.destinationViewController;
//    NSIndexPath *indexPath = [self.collVC indexPathForCell:sender];
//    vc.videoData = [self.videoviewModel videosListWithIndexPath:indexPath];
//    //vc.catId = self.videoviewModel.GameId;
//}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    VideoListViewController *vc = segue.destinationViewController;
    NSIndexPath *indexpath = [self.collectionView indexPathForCell:sender];
    vc.videoData = [self.videoviewModel videosListWithIndexPath:indexpath];
}

@end
