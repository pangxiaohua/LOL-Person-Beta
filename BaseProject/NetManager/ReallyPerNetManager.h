//
//  ReallyPerNetManager.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "ReallyPerson.h"
#import "ShowPlayModel.h"
#import "FindCompanyModel.h"

@interface ReallyPerNetManager : BaseNetManager

/** 真人秀的网络请求 */
+(id)getReallyPersonShowWithPage:(NSInteger)page ComplettionHandle:(void(^)(ReallyPerson *model,NSError *error))completionHandle;

/** 晒玩法的网络请求 */
+(id)getShowPlayWithPage:(NSInteger)page CompletionHadnle:(void(^)(ShowPlayModel *model,NSError *error))completionHandle;
/** 找战友的网络请求 */
+(id)getFindCompanyCompletionHandle:(void(^)(FindCompanyModel *model,NSError *error))completionHandle;


@end
