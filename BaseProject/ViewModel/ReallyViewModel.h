//
//  ReallyViewModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/10.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "ReallyPerNetManager.h"


@interface ReallyViewModel : BaseViewModel

@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic)NSInteger rowNumber;


/** 掌游宝账号 */
-(NSString *)nickNameForRow:(NSInteger)row;

/** 大区 */
-(NSString *)areaForRow:(NSInteger)row;
/** 游戏角色名称 */
-(NSString *)summonerForRow:(NSInteger)row;
/** 说说 */
-(NSString *)descForRow:(NSInteger)row;
/** 爆照图片URL */
-(NSString *)pic_url_smallForRow:(NSInteger)row;
/** 更新时间 */
-(NSString *)createdForRow:(NSInteger)row;
/** 是否是男生 */
-(NSString *)sexForRow:(NSInteger)row;
/** 点赞数 */
-(NSString *)goodForRow:(NSInteger)row;
/** 评论数 */
-(NSString *)commentForRow:(NSInteger)row;

/** 头像 */
-(NSURL *)avatarForRow:(NSInteger)row;

@property(nonatomic)NSInteger page;

-(void)refreshDataCompleteHandle:(void(^)(NSError *error))complete;
-(void)getMoreDataCompleteHandle:(void(^)(NSError *error))complete;

-(NSString *)IDForRow:(NSInteger)row;


@end
