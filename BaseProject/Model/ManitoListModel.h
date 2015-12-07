//
//  ManitoListModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class ManitoListData;
@interface ManitoListModel : BaseModel

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) NSArray<ManitoListData *> *data;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger api;

@end
@interface ManitoListData : NSObject

@property (nonatomic, copy) NSString *point;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *url;

@property (nonatomic, copy) NSString *position;

@end

