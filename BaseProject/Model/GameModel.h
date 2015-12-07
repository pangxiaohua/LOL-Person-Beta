//
//  GameModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class GameDataModel;
@interface GameModel : BaseModel

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) NSArray<GameDataModel *> *data;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger api;

@end
@interface GameDataModel : NSObject

@property (nonatomic, copy) NSString *max_id;

@property (nonatomic, assign) NSInteger published;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *live_url;

@property (nonatomic, copy) NSString *desc;

@end

