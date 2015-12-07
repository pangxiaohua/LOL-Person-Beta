//
//  wallPaperNetManager.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "wallPaperNetManager.h"

@implementation wallPaperNetManager

+(id)getwallPaperWithPage:(NSInteger)page CompletionHandle:(void(^)(wallPaper *model,NSError *error))completionHandle{
    
    NSString *path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/AroundService/paper?size=1536&page=%@&i_=866002024907023&t_=1447331353278&p_=12179&v_=400607&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=baiduMartket&u_=&",@(page)];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([wallPaper objectWithKeyValues:responseObj],error);
    }];
    
}

@end
