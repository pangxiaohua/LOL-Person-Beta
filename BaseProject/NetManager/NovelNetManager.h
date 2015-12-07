//
//  NovelNetManager.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "NovelModel.h"

@interface NovelNetManager : BaseNetManager

+(id)getNovelModelCompletionHandle:(void(^)(NovelModel *model,NSError *error))completionHandle;

@end
