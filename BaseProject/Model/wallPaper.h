//
//  wallPaper.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseModel.h"

@class wallPaperDataModel;
@interface wallPaper : BaseModel

@property (nonatomic, assign) NSInteger code;

@property (nonatomic, strong) NSArray<wallPaperDataModel *> *data;

@property (nonatomic, copy) NSString *message;

@property (nonatomic, assign) NSInteger api;

@end
@interface wallPaperDataModel : NSObject

@property (nonatomic, copy) NSString *pic_thumb_url;

@property (nonatomic, copy) NSString *ID;

@property (nonatomic, copy) NSString *pic_url;

@property (nonatomic, copy) NSString *role_id;

@end

