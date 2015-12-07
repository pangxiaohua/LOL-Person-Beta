//
//  FreeAndAllHerosModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class FreeData,FreeDataCurrentperiod;
@interface FreeAndAllHerosModel : BaseModel


@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) FreeData *data;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger api;

@end

@interface FreeData : NSObject

@property (nonatomic, copy) NSString *currentdate;

@property (nonatomic, strong) NSArray<FreeDataCurrentperiod *> *currentperiod;

@property (nonatomic, copy) NSString *currenttitle;

@end

@interface FreeDataCurrentperiod : NSObject

@property (nonatomic, copy) NSString *ID;

@end

