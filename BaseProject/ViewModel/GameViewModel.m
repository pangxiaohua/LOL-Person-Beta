//
//  GameViewModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GameViewModel.h"

@implementation GameViewModel

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}


-(GameDataModel *)dataModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self dataModelForRow:row].title;
}

-(NSString *)descForRow:(NSInteger)row{
    return [self dataModelForRow:row].desc;
}

-(NSString *)maxId{
    if (!_maxId) {
        _maxId = nil;
    }
    return _maxId;
}


-(void)getDataFromNetCompletionHandle:(void(^)(NSError *error))completionHandle{
    
    [GameNetModel getGameWithMaxid:_maxId CompletionHandle:^(GameModel *model, NSError *error) {
        
        if ([_maxId isEqualToString:@"0"]) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data];
        completionHandle(error);
    }];
}

/** 刷新 */
-(void)refreshDataCompletionHandle:(void (^)(NSError *))complete{
    _maxId = @"0";
    [self getDataFromNetCompletionHandle:complete];
    
}

/** 加载更多 */
-(void)getMoreDataWithMax_id:(NSString *)max_id CompleteHandle:(void (^)(NSError *))complete{
    [_maxId setKeyValues:max_id];
    [self getDataFromNetCompletionHandle:complete];
}


@end
