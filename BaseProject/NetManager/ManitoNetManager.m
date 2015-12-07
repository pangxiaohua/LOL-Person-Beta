//
//  ManitoNetManager.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ManitoNetManager.h"

@implementation ManitoNetManager


+(id)getManitoListModelComplettionHandle:(void(^)(ManitoListModel *model,NSError *error))completionHandle{
    NSString *path = @"http://lol.zhangyoubao.com/apis/rest/RolesService/playerRank?server=%E7%94%B5%E4%BF%A1%E4%B8%80&condition=0&i_=866002024907023&t_=1447330324739&p_=16562&v_=400607&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=baiduMartket&u_=&";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ManitoListModel objectWithKeyValues:responseObj],error);
    }];
}

@end
