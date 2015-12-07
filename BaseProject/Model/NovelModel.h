//
//  NovelModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class NovelData,NovelDataCatword_IdModel;
@interface NovelModel : BaseModel

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) NSArray<NovelData *> *data;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger api;

@end
@interface NovelData : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray<NovelDataCatword_IdModel *> *catword_id;

@end

@interface NovelDataCatword_IdModel : NSObject

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *desc;

@end

