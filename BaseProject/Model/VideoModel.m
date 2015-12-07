//
//  VideoModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/2.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoModel.h"

@implementation VideoModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [VideoDataModel class]};
}
@end
@implementation VideoDataModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
+ (NSDictionary *)objectClassInArray{
    return @{@"catword_id" : [VideoDataCatword_IdModel class]};
}

@end


@implementation VideoDataCatword_IdModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


