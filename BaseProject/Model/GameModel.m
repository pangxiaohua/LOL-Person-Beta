//
//  GameModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/12.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "GameModel.h"

@implementation GameModel


+ (NSDictionary *)objectClassInArray{
    return @{@"data" : [GameDataModel class]};
}
@end
@implementation GameDataModel
+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"ID":@"id"};
}
@end


