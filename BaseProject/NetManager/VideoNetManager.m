//
//  VideoNetManager.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoNetManager.h"


@implementation VideoNetManager

+(id)getVideosListcomplettionHandle:(void (^)(VideoModel *, NSError *))completionHandle{
    
    NSString *path = @"http://lol.zhangyoubao.com/apis/rest/CatalogsService/all?cattype=video&i_=866002024907023&t_=1445515447757&p_=25616&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&";
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        
        //解析请求下来的数据
        completionHandle([VideoModel objectWithKeyValues:responseObj],error);
    }];
}

+(id)getRoomListWithCatId:(NSString *)catId Page:(NSInteger)page CatwordId:(NSString *)catwordDid CompletionHandle:(void(^)(VideoListModel *roomListModel, NSError *error))completionHandle{
    NSString *path = [NSString stringWithFormat:@"http://lol.zhangyoubao.com/apis/rest/ItemsService/videos?catid=%@&page=%@&catwordid=%@&i_=866002024907023&t_=1445515496947&p_=23186&v_=400603&a_=lol&pkg_=com.anzogame.lol&d_=android&osv_=19&cha=baiduMartket&u_=&",catId,@(page),catwordDid];
    return [self GET:path parameters:nil completionHandler:^(id responseObj, NSError *error) {
        completionHandle([VideoListModel objectWithKeyValues:responseObj],error);
    }];
}

@end
