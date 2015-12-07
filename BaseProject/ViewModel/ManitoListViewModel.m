//
//  ManitoListViewModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ManitoListViewModel.h"

@implementation ManitoListViewModel

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}


-(ManitoListData *)dataModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

/** 头像 */
-(NSURL *)urlForRow:(NSInteger)row{
    return [NSURL URLWithString:[self dataModelForRow:row].url];
}
/** 名字 */
-(NSString *)nameForRow:(NSInteger)row{
    return [self dataModelForRow:row].name;
}
/** 段位 */
-(NSString *)positionForRow:(NSInteger)row{
    return [self dataModelForRow:row].position;
}
/** 胜点 */
-(NSString *)pointForRow:(NSInteger)row{
    return [self dataModelForRow:row].point;
}

/** 请求数据 */
-(void)getDataFromNetComoletionHandle:(void(^)(NSError *error))completionHanle{
    
    [ManitoNetManager getManitoListModelComplettionHandle:^(ManitoListModel *model, NSError *error) {
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data];
        completionHanle(error);
        
    }];
}


/** 刷新 ,由于是一次性加载完成，所以没有更多加载方法 */
-(void)refreshDataCompleteHandle:(void(^)(NSError *error))complete{
    _page = 1;
    [self getDataFromNetComoletionHandle:complete];
}



@end
