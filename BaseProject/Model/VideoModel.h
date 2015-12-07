//
//  VideoModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class VideoDataModel,VideoDataCatword_IdModel;
@interface VideoModel : BaseModel

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) NSArray<VideoDataModel *> *data;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger api;

@end
@interface VideoDataModel : BaseModel

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, strong) NSArray<VideoDataCatword_IdModel *> *catword_id;

@end

@interface VideoDataCatword_IdModel : BaseModel

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, copy) NSString *pic;

@property (nonatomic, copy) NSString *name;

@property (nonatomic, copy) NSString *desc;

@end

