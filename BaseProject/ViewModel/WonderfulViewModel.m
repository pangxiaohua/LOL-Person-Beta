//
//  WonderfulViewModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WonderfulViewModel.h"

@implementation WonderfulViewModel

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}


-(WonderfulDataModel *)dataModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self dataModelForRow:row].name;
}

-(NSURL *)urlForRow:(NSInteger)row{
    return [NSURL URLWithString:[self dataModelForRow:row].pic_url];
}


-(void)getDataFromNetCompletionHandle:(void(^)(NSError *error))completionHandle{
    [WonderfulNetManager getWondelfulModelWithPage:_page ComplettionHandle:^(Wonderful *model, NSError *error) {
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data];
        completionHandle(error);
    }];
}

-(void)refreshDataCompleteHandle:(void (^)(NSError *))complete{
    _page = 1;
    [self getDataFromNetCompletionHandle:complete];
}


-(void)getMoreDataCompleteHandle:(void(^)(NSError *error))complete{
    _page += 1;
    [self getDataFromNetCompletionHandle:complete];
}

@end
