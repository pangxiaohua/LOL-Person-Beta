//
//  GameNetModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "GameModel.h"

@interface GameNetModel : BaseNetManager

+(id)getGameWithMaxid:(NSString *)maxid CompletionHandle:(void(^)(GameModel *model,NSError *error))completionHandle;

@end
