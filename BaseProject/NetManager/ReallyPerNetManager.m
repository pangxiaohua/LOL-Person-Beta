//
//  ReallyPerNetManager.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ReallyPerNetManager.h"

@implementation ReallyPerNetManager

/** 真人秀的网络请求 */
+(id)getReallyPersonShowWithPage:(NSInteger)page ComplettionHandle:(void(^)(ReallyPerson *model,NSError *error))completionHandle{
    
    NSString *path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/UgcsService/getUserShows?order_kind=0&area=&page=%@&sex=&i_=866002024907023&t_=1445519422874&p_=10967&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&",@(page)];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ReallyPerson objectWithKeyValues:responseObj],error);
    }];
}

/** 晒玩法的网络请求 */
+(id)getShowPlayWithPage:(NSInteger)page CompletionHadnle:(void(^)(ShowPlayModel *model,NSError *error))completionHandle{
    NSString *path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/PlaysService/userPlayList?order_kind=0&role_id=0&page=%@&i_=866002024907023&t_=1445519662927&p_=11126&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&",@(page)];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([ShowPlayModel objectWithKeyValues:responseObj],error);
    }];
}

/** 找战友的网络请求 */
+(id)getFindCompanyCompletionHandle:(void(^)(FindCompanyModel *model,NSError *error))completionHandle{
    NSString *path = @"http://lol.zhangyoubao.com/apis/rest/UgcsService/getCompanions?i_=866002024907023&t_=1445519892288&p_=9209&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([FindCompanyModel objectWithKeyValues:responseObj],error);
    }];
}


@end
