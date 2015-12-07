//
//  LolModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/10/29.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "LolModel.h"

@implementation LolModel

+(NSDictionary *)objectClassInArray{
    return @{@"data":[LolDataModel class]};
}

@end

@implementation LolDataModel
//dataIdentifier
//picUrl
//videoUrl
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"dataIdentifier":@"id",@"picUrl":@"pic_url",@"videoUrl":@"video_url"};
}


@end