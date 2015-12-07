//
//  ManitoNetManager.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ManitoListModel.h"

@interface ManitoNetManager : BaseNetManager

+(id)getManitoListModelComplettionHandle:(void(^)(ManitoListModel *model,NSError *error))completionHandle;

@end
