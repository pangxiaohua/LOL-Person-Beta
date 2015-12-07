//
//  HerosViewModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HerosViewModel.h"

@implementation HerosViewModel

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

-(NSInteger)rowNum{
    return self.dataArr.count;
}

-(FreeDataCurrentperiod *)dataModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSString *)IDForRow:(NSInteger)row{
    return [self dataModelForRow:row].ID;
}

-(void)getDataFromNetCompletionHandle:(void(^)(NSError *error))completionHandle{
    [HerosNetManager getAllHerosCompletionHandle:^(FreeAndAllHerosModel *model, NSError *error) {
        if (_page==1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data.currentperiod];
        completionHandle(error);
    }];
}

-(void)refreshDataCompletionHandle:(void (^)(NSError *))complete{
    _page = 1;
    [self getDataFromNetCompletionHandle:complete];
}


@end
