//
//  VideoViewModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "VideoNetManager.h"


typedef NS_ENUM(NSUInteger, videoList) {
    videoListJieShuo,
    videoListYuLe,
    videoListSaiShi,
};


//希望控制器只接触ViewModel 不直接接触Model
//在界面上，受数据影响的都写在VM层
@interface VideoViewModel : BaseViewModel


@property(nonatomic)NSInteger rowNumber;


@property(nonatomic,strong)NSString *GameId;
//每行显示的图片 的地址
-(NSURL *)iconURLWithrow:(NSIndexPath *)indexPath;
//每行显示的视频作者
-(NSString *)nameWithrow:(NSIndexPath *)indexPath;
//数据类型
@property(nonatomic,strong)VideoModel *videoModelList;
//通过indexPath 获取对应的数据类型
@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic)NSInteger page;

-(void)refreshDataCompleteHandle:(void(^)(NSError *error))complete;

@property(nonatomic)videoList type;

-(id)initWithType:(videoList)type;

-(VideoDataCatword_IdModel *)videosListWithIndexPath:(NSIndexPath *)indexPath;
- (VideoDataModel *)videosDataModelIndexPath:(NSIndexPath *)indexPath;

@end
