//
//  ReallyPerson.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ReallyPerson.h"

@implementation ReallyPerson


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [ReallyData class]};
}
@end
@implementation ReallyData

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


