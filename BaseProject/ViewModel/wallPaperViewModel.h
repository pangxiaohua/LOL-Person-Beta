//
//  wallPaperViewModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "wallPaperNetManager.h"

@interface wallPaperViewModel : BaseViewModel

@property(nonatomic,strong)NSMutableArray *dataArr;

@property(nonatomic)NSInteger rowNumber;


/** 壁纸页面只有图片 */
-(NSURL *)urlForRow:(NSInteger)row;

/** 刷新  */
-(void)refreshDataCompleteHandle:(void(^)(NSError *error))complete;

/** 为防止重复刷新,加载更功能,添加一个page做判断 */
@property(nonatomic)NSInteger page;

/** 加载更多 */
-(void)getMoreDataCompleteHandle:(void(^)(NSError *error))complete;

/** 全图，返回一个字符串，作为参数正向传递给下一个界面 */
-(NSString *)picForRow:(NSInteger)row;


@end
