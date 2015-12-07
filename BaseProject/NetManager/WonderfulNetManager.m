//
//  WonderfulNetManager.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "WonderfulNetManager.h"

@implementation WonderfulNetManager

+(id)getWondelfulModelWithPage:(NSInteger)page ComplettionHandle:(void(^)(Wonderful *model,NSError *error))completionHandle{
    NSString *path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/TopicsService/all?page=%@&i_=866002024907023&t_=1447330596753&p_=22604&v_=400607&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=baiduMartket&u_=&",@(page)];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([Wonderful objectWithKeyValues:responseObj],error);
    }];
}

@end
