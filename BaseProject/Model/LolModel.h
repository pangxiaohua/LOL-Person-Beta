//
//  LolModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/10/29.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@interface LolModel : BaseModel

@property (nonatomic, assign) double code;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, assign) double api;

@end

@interface LolDataModel : BaseModel

@property (nonatomic, assign) double recommend;
@property (nonatomic, strong) NSString *dataIdentifier;
@property (nonatomic, strong) NSString *picUrl;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *videoUrl;
@property (nonatomic, assign) double published;
@property (nonatomic, strong) NSString *platform;
@property (nonatomic, strong) NSString *weightNew;
@property (nonatomic, strong) NSString *desc;

@end
