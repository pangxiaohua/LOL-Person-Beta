//
//  VideoListModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/6.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "VideoListModel.h"

@implementation VideoListModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [VideoListDataModel class]};
}
@end
@implementation VideoListDataModel

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}

@end


