//
//  ShowPlayViewModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/11.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ReallyPerNetManager.h"


@interface ShowPlayViewModel : BaseViewModel

@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic)NSInteger rowNumber;


/** 发布者Lb */
-(NSString *)nickNameForRow:(NSInteger)row;
/** 时间Lb */
-(NSString *)timeForRow:(NSInteger)row;

/** 题目Lb */
-(NSString *)titleForRow:(NSInteger)row;
/** 地图Lb */
-(NSString *)mapForRow:(NSInteger)row;
/** 祖安Lb */
-(NSString *)areaForRow:(NSInteger)row;
/** 召唤师名称Lb */
-(NSString *)summonerForRow:(NSInteger)row;
/** 战斗力Lb */
-(NSString *)zdlForRow:(NSInteger)row;
/** 出装Arr */
-(NSString *)equipsForRow:(NSInteger)row;
/** 被赞次数Lb */
-(NSString *)goodForRow:(NSInteger)row;
/** 评论次数Lb */
-(NSString *)commentForRow:(NSInteger)row;

/** 返回ID，英雄头像以及出装都是由ID确认 */
-(NSString *)IDForRow:(NSInteger)row;

/** 分页加载，必须要有page */
@property(nonatomic)NSInteger page;
/** 刷新 */
-(void)refreshDataCompletionHandle:(void(^)(NSError *error))complete;
/** 加载更多 */
-(void)getMoreDataCompletionHandle:(void(^)(NSError *error))complete;

@end
