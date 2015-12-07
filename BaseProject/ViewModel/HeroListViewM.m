//
//  HeroListViewM.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroListViewM.h"

@implementation HeroListViewM

-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}


-(HeroListData *)dataModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

/** 返回英雄名字 */
-(NSString *)HeroNameForRow:(NSInteger)row{
    return [self dataModelForRow:row].name;
}
/** 返回英雄头像 */
-(NSURL *)urlForRow:(NSInteger)row{
    return [NSURL URLWithString:[self dataModelForRow:row].url];
}
/** 返回英雄出场率 */
-(NSString *)debutForRow:(NSInteger)row{
    return [self dataModelForRow:row].debut;
}
/** 返回英雄胜率 */
-(NSString *)winForRow:(NSInteger)row{
    return [self dataModelForRow:row].win;
}

/** 请求数据 */
-(void)getDataFromNetComoletionHandle:(void(^)(NSError *error))completionHanle{
    
    [HeroListNetManager getHeroListModelComplettionHandle:^(HeroList *model, NSError *error) {
        if (_page == 1) {
            [self.dataArr removeAllObjects];
        }
        [self.dataArr addObjectsFromArray:model.data];
        completionHanle(error);
    }];
}

/** 刷新 */
-(void)refreshDataCompleteHandle:(void(^)(NSError *error))complete{
    _page = 1;
    [self getDataFromNetComoletionHandle:complete];
}







@end
