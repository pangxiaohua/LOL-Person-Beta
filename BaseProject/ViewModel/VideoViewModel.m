//
//  VideoViewModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoViewModel.h"

@implementation VideoViewModel


-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}


/** 防御性编程，不允许使用init初始化 */
-(id)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须要使用initWithVideoType初始化", __FUNCTION__);
    }
    return self;
}

//网络请求
-(void)getDataWithType:(videoList)type CompleteHandle:(void(^)(NSError *error))complete{
    
   
       [VideoNetManager getVideosListcomplettionHandle:^(VideoModel *model, NSError *error) {
           switch (type) {
               case videoListJieShuo:
                   [self.dataArr addObjectsFromArray:model.data[0].catword_id];
//                   _GameId = @"10172";
                   break;
                case videoListYuLe:
                   [self.dataArr addObjectsFromArray:model.data[1].catword_id];
//                   _GameId = @"10174";
                   break;
                case videoListSaiShi:
                   [self.dataArr addObjectsFromArray:model.data[2].catword_id];
//                   _GameId = @"10173";
                   break;
                   
               default:
                   break;
           }
        complete(error);
    }];
}

-(void)refreshDataCompleteHandle:(void (^)(NSError *))complete{
    
     
     [self getDataWithType:_type CompleteHandle:complete];
}


-(VideoDataCatword_IdModel *)videoListWithrow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSURL *)iconURLWithrow:(NSIndexPath *) indexPath{
    NSString *path =  [self videoListWithrow:indexPath.row].pic_url;
    return [NSURL URLWithString:path];
}

-(NSString *)nameWithrow:(NSIndexPath *)indexPath{
    return [self videoListWithrow:indexPath.row].name;
}


-(id)initWithType:(videoList)type{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}

/** 获取数据*/
-(VideoDataCatword_IdModel *)videosListWithIndexPath:(NSIndexPath *)indexPath{
    return self.dataArr[indexPath.row];
}
- (VideoDataModel *)videosDataModelIndexPath:(NSIndexPath *)indexPath{
    return self.dataArr[indexPath.row];
}

@end
