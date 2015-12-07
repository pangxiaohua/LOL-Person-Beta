//
//  HerosNetManager.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HerosNetManager.h"

@implementation HerosNetManager

+(id)getAllHerosCompletionHandle:(void(^)(FreeAndAllHerosModel *model,NSError *error))completionHandle{
    NSString *path = @"http://lol.zhangyoubao.com/apis/rest/RolesService/freeV1?i_=866002024907023&t_=1445515988796&p_=28733&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([FreeAndAllHerosModel objectWithKeyValues:responseObj],error);
    }];
}

@end
