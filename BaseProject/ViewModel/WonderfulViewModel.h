//
//  WonderfulViewModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/18.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "WonderfulNetManager.h"


@interface WonderfulViewModel : BaseViewModel

@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic)NSInteger rowNumber;


/** 标题 */
-(NSString *)titleForRow:(NSInteger)row;
/** 图片 */
-(NSURL *)urlForRow:(NSInteger)row;

/** 刷新  */
-(void)refreshDataCompleteHandle:(void(^)(NSError *error))complete;

/** 为防止重复刷新,加载更功能,添加一个page做判断 */
@property(nonatomic)NSInteger page;

/** 加载更多 */
-(void)getMoreDataCompleteHandle:(void(^)(NSError *error))complete;


@end
