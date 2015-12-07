//
//  ReallyViewModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ReallyViewModel.h"

@implementation ReallyViewModel

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}



-(ReallyData *)dataModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

-(NSString *)areaForRow:(NSInteger)row{
    return [self dataModelForRow:row].area;
}

/** 掌游宝账号 */
-(NSString *)nickNameForRow:(NSInteger)row{
    return [self dataModelForRow:row].nickname;
}

-(NSString *)summonerForRow:(NSInteger)row{
    return [self dataModelForRow:row].summoner;
}

-(NSString *)descForRow:(NSInteger)row{
    return [self dataModelForRow:row].desc;
}

-(NSString *)pic_url_smallForRow:(NSInteger)row{
    return [self dataModelForRow:row].pic_url;
}

-(NSString *)createdForRow:(NSInteger)row{
    return [self dataModelForRow:row].created;
}

-(NSString *)sexForRow:(NSInteger)row{
    return [self dataModelForRow:row].sex;
}

-(NSString *)goodForRow:(NSInteger)row{
    return [self dataModelForRow:row].good;
}

-(NSString *)commentForRow:(NSInteger)row{
    return [self dataModelForRow:row].comment;
}

/** 头像 */
-(NSURL *)avatarForRow:(NSInteger)row{
    return [NSURL URLWithString:[self dataModelForRow:row].avatar];
}


-(void)getDataFromNetComoletionHandle:(void(^)(NSError *error))completionHanle{
    
    [ReallyPerNetManager getReallyPersonShowWithPage:_page ComplettionHandle:^(ReallyPerson *model, NSError *error) {
        if (_page==1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data];
        completionHanle(error);
    }];
}

-(void)refreshDataCompleteHandle:(void (^)(NSError *))complete{
    _page = 1;
    [self getDataFromNetComoletionHandle:complete];
}

-(void)getMoreDataCompleteHandle:(void (^)(NSError *))complete{
    _page += 1;
    [self getDataFromNetComoletionHandle:complete];
}


-(NSString *)IDForRow:(NSInteger)row{
    return [self dataModelForRow:row].ID;
}

@end
