//
//  HeroListNetManager.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "HeroListNetManager.h"

@implementation HeroListNetManager

+(id)getHeroListModelComplettionHandle:(void (^)(HeroList *model, NSError *))completionHandle{
    NSString *path = @"http://lol.zhangyoubao.com/apis/rest//RolesService/heroRanks?condition=0&page=1&position=0&i_=866002024907023&t_=1447330249990&p_=32315&v_=400607&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=baiduMartket&u_=&";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([HeroList objectWithKeyValues:responseObj],error);
    }];
}

@end
