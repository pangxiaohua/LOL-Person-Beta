//
//  FreeAndAllHerosModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FreeAndAllHerosModel.h"

@implementation FreeAndAllHerosModel

@end


@implementation FreeData

+ (NSDictionary *)objectClassInArray{
    return @{@"currentperiod" : [FreeDataCurrentperiod class]};
}

@end


@implementation FreeDataCurrentperiod


+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


