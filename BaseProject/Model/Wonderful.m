//
//  Wonderful.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "Wonderful.h"

@implementation Wonderful

+(NSDictionary *)objectClassInArray{
    return @{@"data":[WonderfulDataModel class]};
}
@end

@implementation WonderfulDataModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
+(NSDictionary *)objectClassInArray{
    return @{@"items":[WonderfulDataItems class]};
}

@end

@implementation WonderfulDataItems

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end