//
//  ShowPlayModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShowPlayModel.h"

@implementation ShowPlayModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [ShowPlayDataModel class]};
}
@end
@implementation ShowPlayDataModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


