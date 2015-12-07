//
//  VideoNetManager.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "VideoModel.h"
#import "VideoListModel.h"

@interface VideoNetManager : BaseNetManager

+(id)getVideosListcomplettionHandle:(void(^)(VideoModel *model,NSError *error))completionHandle;

+(id)getRoomListWithCatId:(NSString *)catId Page:(NSInteger)page CatwordId:(NSString *)catwordDid CompletionHandle:(void(^)(VideoListModel *roomListModel, NSError *error))completionHandle;

@end
