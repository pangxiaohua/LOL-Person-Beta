//
//  LolNetManager.m
//  BaseProject
//
//  Created by apple-jd17 on 15/10/29.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LolNetManager.h"

@implementation LolNetManager

+(id)getLolListType:(LolListType)type page:(NSInteger)page complettionHandle:(void (^)(LolModel *, NSError *))completionHandle{
    
//需要根据不同的类型，设置对应的请求地址

    NSString *path = nil;
    switch (type) {
        case LolListTypeZuiXin:
            path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10178&cattype=news&page=%@&i_=866002024907023&t_=1445516521737&p_=7556&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&",@(page)];
            break;
        case LolListTypeXinWen:
            path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10000&cattype=news&page=%@&i_=866002024907023&t_=1445516566355&p_=21410&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&",@(page)];
            break;
        case LolListTypeSaiShi:
            path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10006&cattype=news&page=%@&i_=866002024907023&t_=1445520098311&p_=27278&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&",@(page)];
            break;
        case LolListTypeYuLe:
            path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/ItemsService/lists?catid=10179&cattype=news&page=%@&i_=866002024907023&t_=1445516575968&p_=20249&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&",@(page)];
            break;
            
        default:
            break;
    }
    //只要请求下来的数据公用一个解析类，就可以合写
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
    //解析请求下来的数据
        completionHandle([LolModel objectWithKeyValues:responseObj],error);
    }];
    
}

@end
