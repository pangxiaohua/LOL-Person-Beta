//
//  HeroListNetManager.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "HeroList.h"

@interface HeroListNetManager : BaseNetManager

+(id)getHeroListModelComplettionHandle:(void(^)(HeroList *model,NSError *error))completionHandle;

@end
