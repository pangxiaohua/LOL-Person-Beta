//
//  HeroList.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class HeroListData;
@interface HeroList : BaseModel

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) NSArray<HeroListData *> *data;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger api;


@end

@interface HeroListData : NSObject

@property (nonatomic, copy) NSString *debut;

@property (nonatomic, copy) NSString *win;

@property (nonatomic, copy) NSString *role_id;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *url;

@end

