//
//  FindCompanyViewModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ReallyPerNetManager.h"


@interface FindCompanyViewModel : BaseViewModel

@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic)NSInteger rowNumber;


/** 掌游宝账号 nickName LB*/
-(NSString *)nickNameLbForRow:(NSInteger)row;
/** 性别 1代表这男生，2代表这女生 */
-(NSString *)sexForRow:(NSInteger)row;
/** 发表时间 */
-(NSString *)createdForRow:(NSInteger)row;
/** 大区 */
-(NSString *)areaForRow:(NSInteger)row;
/** 召唤师名称 */
-(NSString *)summonerForRow:(NSInteger)row;
/** 战斗力 */
-(NSString *)zdlForRow:(NSInteger)row;
/** 排位段位 无法做 */

/** 开黑语言 0代表着不确定，1代表着普通话，2代表不愿意*/
-(NSString *)enable_voiceForRow:(NSInteger)row;
/** 所在城市 null为未知 */
-(NSString *)cityForRow:(NSInteger)row;
/** 约战宣言 */
-(NSString *)sloganForRow:(NSInteger)row;
/** 被赞次数 */
-(NSString *)goodForRow:(NSInteger)row;
/** 评论次数 */
-(NSString *)commentForRow:(NSInteger)row;

/** 头像 */
-(NSURL *)avatarForRow:(NSInteger)row;

/** 刷新,没有加载更多,所以也没有page属性 */
-(void)refreshDataCompletionHandle:(void(^)(NSError *error))complete;

@end
