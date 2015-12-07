//
//  NovelModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "NovelModel.h"

@implementation NovelModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [NovelData class]};
}
@end
@implementation NovelData

+ (NSDictionary *)objectClassInArray{
    return @{@"catword_id" : [NovelDataCatword_IdModel class]};
}

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


@implementation NovelDataCatword_IdModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


