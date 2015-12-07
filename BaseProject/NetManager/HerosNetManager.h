//
//  HerosNetManager.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "FreeAndAllHerosModel.h"


@interface HerosNetManager : BaseNetManager

+(id)getAllHerosCompletionHandle:(void(^)(FreeAndAllHerosModel *model,NSError *error))completionHandle;

@end
