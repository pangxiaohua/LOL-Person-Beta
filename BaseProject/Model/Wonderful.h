//
//  Wonderful.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class WonderfulDataModel,WonderfulDataItems;
@interface Wonderful : BaseModel

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) NSArray<WonderfulDataModel *> *data;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger api;

@end
@interface WonderfulDataModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, assign) NSInteger created;

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *desc;

@property (nonatomic, strong) NSArray<WonderfulDataItems *> *items;

@end

@interface WonderfulDataItems : NSObject

@property (nonatomic, copy) NSString *weight;

@property (nonatomic, assign) NSInteger published;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *video_url;

@property (nonatomic, copy) NSString *created;

@property (nonatomic, copy) NSString *desc;

@end

