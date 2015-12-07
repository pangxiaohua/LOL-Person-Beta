//
//  FindCompanyModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FindCompanyModel.h"

@implementation FindCompanyModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [FindCompanyDataModel class]};
}
@end
@implementation FindCompanyDataModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end


