//
//  VideoListViewModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/9.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoListViewModel.h"

@implementation VideoListViewModel


-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}



/** 对应的信息*/
-(VideoListDataModel *)modelWitRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSURL *)roomIconURLWithRow:(NSInteger)row{
    return [NSURL URLWithString:[self modelWitRow:row].pic_url];
}

-(NSString *)roomTitleWithRow:(NSInteger)row{
    return [self modelWitRow:row].title;
}

-(NSString *)roomDescWithRow:(NSInteger)row{
    return [self modelWitRow:row].desc;
}

-(id)initWithCatId:(NSString *)catId CatworDid:(NSString *)catworDid{
    if (self = [super init]) {
        _catId = catId;
        _catworDid = catworDid;
    }
    return self;
}

/** 预防性编程 ，不允许使用init初始化 */
-(id)init{
    if (self = [super init]) {
        NSAssert1(NO, @"%s 必须要使用initWithCatId CatwordId 初始化", __FUNCTION__);
    }
    return self;
}

-(NSString *)videoForWithRow:(NSInteger)row{
    return [self modelWitRow:row].video_url;
}



-(void)getDataFromNetCompletionHandle:(void(^)(NSError *error))completionHandle{
    [VideoNetManager getRoomListWithCatId:self.catId Page:self.page CatwordId:self.catworDid CompletionHandle:^(VideoListModel *roomListModel, NSError *error) {
        
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:roomListModel.data];
        completionHandle(error);
    }];
}

-(void)refreshDataCompletionHandle:(void (^)(NSError *))completionHandle{
    _page = 1;
    [self getDataFromNetCompletionHandle:completionHandle];
}

-(void)getMoreDataCompletionHandle:(void (^)(NSError *))completionHandle{
    _page += 1;
    [self getDataFromNetCompletionHandle:completionHandle];
}

@end
