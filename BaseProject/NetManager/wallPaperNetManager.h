//
//  wallPaperNetManager.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseNetManager.h"
#import "wallPaper.h"

@interface wallPaperNetManager : BaseNetManager

+(id)getwallPaperWithPage:(NSInteger)page CompletionHandle:(void(^)(wallPaper *model,NSError *error))completionHandle;

@end
