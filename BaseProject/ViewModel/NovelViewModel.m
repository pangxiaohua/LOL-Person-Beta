//
//  NovelViewModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NovelViewModel.h"

@implementation NovelViewModel

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}

-(NovelDataCatword_IdModel *)dataModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSString *)titleForRow:(NSInteger)row{
    return [self dataModelForRow:row].name;
}

-(NSString *)descForRow:(NSInteger)row{
    return [self dataModelForRow:row].desc;
}

-(NSURL *)picUrlForRow:(NSInteger)row{
    return [NSURL URLWithString:[self dataModelForRow:row].pic_url];
}

-(void)getDataFromNetCompletionHandle:(void(^)(NSError *error))completionHandle{
    [NovelNetManager getNovelModelCompletionHandle:^(NovelModel *model, NSError *error) {
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data[0].catword_id];
        completionHandle(error);
    }];
}

-(void)refreshDataCompleteHandle:(void (^)(NSError *))complete{
    _page = 1;
    [self getDataFromNetCompletionHandle:complete];
}


@end
