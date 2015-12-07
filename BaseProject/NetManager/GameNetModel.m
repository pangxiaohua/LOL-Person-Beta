//
//  GameNetModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GameNetModel.h"

@implementation GameNetModel

+(id)getGameWithMaxid:(NSString *)maxid CompletionHandle:(void(^)(GameModel *model,NSError *error))completionHandle{
    
    NSString *path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/competitions/items?maxid=%@&cid=&i_=866002024907023&t_=1447330138797&p_=28736&v_=400607&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=21&cha=baiduMartket&u_=&",maxid];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([GameModel objectWithKeyValues:responseObj],error);
    }];   
}

@end
