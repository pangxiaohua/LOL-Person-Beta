//
//  wallPaper.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "wallPaper.h"

@implementation wallPaper


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [wallPaperDataModel class]};
}
@end
@implementation wallPaperDataModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


