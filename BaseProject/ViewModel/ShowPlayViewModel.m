//
//  ShowPlayViewModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShowPlayViewModel.h"

@implementation ShowPlayViewModel

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}



-(ShowPlayDataModel *)dataModerForRow:(NSInteger)row{
    return self.dataArr[row];
}

/** 发布者Lb */
-(NSString *)nickNameForRow:(NSInteger)row{
    return [self dataModerForRow:row].nickname;
}

/** 发表时间Lb */
-(NSString *)timeForRow:(NSInteger)row{
    return @([self dataModerForRow:row].created).stringValue;
}

/** 题目Lb */
-(NSString *)titleForRow:(NSInteger)row{
    return [self dataModerForRow:row].title;
}
/** 地图Lb */
-(NSString *)mapForRow:(NSInteger)row{
    return [self dataModerForRow:row].map;
}
/** 祖安Lb */
-(NSString *)areaForRow:(NSInteger)row{
    return [self dataModerForRow:row].area;
}
/** 召唤师名称Lb */
-(NSString *)summonerForRow:(NSInteger)row{
    return [self dataModerForRow:row].summoner;
}
/** 战斗力Lb */
-(NSString *)zdlForRow:(NSInteger)row{
    return [self dataModerForRow:row].zdl;
}
/** 出装Arr */
-(NSString *)equipsForRow:(NSInteger)row{
    return [self dataModerForRow:row].equips;
}
/** 被赞次数Lb */
-(NSString *)goodForRow:(NSInteger)row{
    return [self dataModerForRow:row].good;
}
/** 评论次数Lb */
-(NSString *)commentForRow:(NSInteger)row{
    return [self dataModerForRow:row].comment;
}

/** 返回ID，英雄头像以及出装都是由ID确认 */
-(NSString *)IDForRow:(NSInteger)row{
    return [self dataModerForRow:row].role_id;
}


-(void)getDataFromNetCompletionHandle:(void(^)(NSError *))completionHandle{
    if (_page ==1) {
        [self.dataArr removeAllObjects];
    }
    [ReallyPerNetManager getShowPlayWithPage:_page CompletionHadnle:^(ShowPlayModel *model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.data];
        completionHandle(error);
    }];
}

/** 刷新 */
-(void)refreshDataCompletionHandle:(void (^)(NSError *))complete{
    _page = 1;
    [self getDataFromNetCompletionHandle:complete];
}
/** 加载更多 */
-(void)getMoreDataCompletionHandle:(void(^)(NSError *error))complete{
    _page += 1;
    [self getDataFromNetCompletionHandle:complete];
    
}


@end
