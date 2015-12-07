//
//  wallPaperViewModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "wallPaperViewModel.h"

@implementation wallPaperViewModel

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}


-(wallPaperDataModel *)dataModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSURL *)urlForRow:(NSInteger)row{
    /** thumb 是小图片*/
    return [NSURL URLWithString:[self dataModelForRow:row].pic_thumb_url];
}

-(void)getDataFromNetCompletionHandle:(void(^)(NSError *error))completionHandle{
    
    [wallPaperNetManager getwallPaperWithPage:_page CompletionHandle:^(wallPaper *model, NSError *error) {
        if (_page==1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data];
        completionHandle(error);
    }];
}

-(void)refreshDataCompleteHandle:(void (^)(NSError *error))complete{
    _page = 1;
    [self getDataFromNetCompletionHandle:complete];
}

-(void)getMoreDataCompleteHandle:(void (^)(NSError *error))complete{
    _page += 1;
    [self getDataFromNetCompletionHandle:complete];
}


/** 全图，返回一个字符串，作为参数正向传递给下一个界面 */
-(NSString *)picForRow:(NSInteger)row{
    return [self dataModelForRow:row].pic_url;
}


@end
