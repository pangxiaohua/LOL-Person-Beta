//
//  NovelNetManager.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NovelNetManager.h"

@implementation NovelNetManager

+(id)getNovelModelCompletionHandle:(void(^)(NovelModel *model,NSError *error))completionHandle{
    NSString *path = @"http://lol.zhangyoubao.com/apis/rest/CatalogsService/all?cattype=novel&i_=866002024907023&t_=1447331519706&p_=31463&v_=400607&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=baiduMartket&u_=&";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([NovelModel objectWithKeyValues:responseObj],error);
    }];
}

@end
