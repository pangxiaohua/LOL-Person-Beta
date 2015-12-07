//
//  WonderfulNetManager.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "Wonderful.h"

@interface WonderfulNetManager : BaseNetManager

+(id)getWondelfulModelWithPage:(NSInteger)page ComplettionHandle:(void(^)(Wonderful *model,NSError *error))completionHandle;

@end
