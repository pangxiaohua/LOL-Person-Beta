//
//  LolNetManager.h
//  BaseProject
//
//  Created by apple-jd17 on 15/10/29.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "LolModel.h"
typedef NS_ENUM(NSUInteger, LolListType) {
    LolListTypeZuiXin, //最新
    LolListTypeXinWen, //新闻
    LolListTypeSaiShi, //赛事
    LolListTypeYuLe,   //娱乐
};
@interface LolNetManager : BaseNetManager

//通过type来区分 请求的地址
+(id)getLolListType:(LolListType)type page:(NSInteger)page complettionHandle:(void(^)(LolModel *model,NSError *error))completionHandle;

@end
