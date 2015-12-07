//
//  FindCompanyViewModel.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "FindCompanyViewModel.h"

@implementation FindCompanyViewModel


-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

-(NSInteger)rowNumber{
    return self.dataArr.count;
}


-(FindCompanyDataModel *)dataModelForRow:(NSInteger)row{
    return self.dataArr[row];
}

/** 掌游宝账号 nickName LB*/
-(NSString *)nickNameLbForRow:(NSInteger)row{
    return [self dataModelForRow:row].nickname;
}
/** 性别 1代表这男生，2代表这女生 */
-(NSString *)sexForRow:(NSInteger)row{
    return [self dataModelForRow:row].sex;
}
/** 发表时间 */
-(NSString *)createdForRow:(NSInteger)row{
    return [self dataModelForRow:row].created;
}
/** 大区 */
-(NSString *)areaForRow:(NSInteger)row{
    return [self dataModelForRow:row].area;
}
/** 召唤师名称 */
-(NSString *)summonerForRow:(NSInteger)row{
    return [self dataModelForRow:row].summoner;
}
/** 战斗力 */
-(NSString *)zdlForRow:(NSInteger)row{
    return [self dataModelForRow:row].zdl;
}
/** 排位段位 无法做 */

/** 开黑语言 0代表着不确定，1代表着普通话，2代表不愿意*/
-(NSString *)enable_voiceForRow:(NSInteger)row{
    return [self dataModelForRow:row].enable_voice;
}
/** 所在城市 null为未知 */
-(NSString *)cityForRow:(NSInteger)row{
    return [self dataModelForRow:row].city;
}
/** 约战宣言 */
-(NSString *)sloganForRow:(NSInteger)row{
    return [self dataModelForRow:row].slogan;
}
/** 被赞次数 */
-(NSString *)goodForRow:(NSInteger)row{
    return [self dataModelForRow:row].good;
}
/** 评论次数 */
-(NSString *)commentForRow:(NSInteger)row{
    return [self dataModelForRow:row].comment;
}
/** 头像 */
-(NSURL *)avatarForRow:(NSInteger)row{
    return [NSURL URLWithString:[self dataModelForRow:row].avatar];
}

/** 网络请求 */
-(void)getDataFromNetCompletionHandle:(void(^)(NSError *error))completionHandle{
    [ReallyPerNetManager getFindCompanyCompletionHandle:^(FindCompanyModel *model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.data];
        completionHandle(error);
    }];
}

/** 刷新,没有加载更多,所以也没有page属性 */
-(void)refreshDataCompletionHandle:(void(^)(NSError *error))complete{
    [self getDataFromNetCompletionHandle:complete];
}




@end

