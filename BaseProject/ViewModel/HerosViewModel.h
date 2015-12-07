//
//  HerosViewModel.h
//  BaseProject
//
//  Created by apple-jd17 on 15/11/20.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "BaseViewModel.h"
#import "HerosNetManager.h"

@interface HerosViewModel : BaseViewModel

@property(nonatomic,strong)NSMutableArray *dataArr;
@property(nonatomic)NSInteger rowNum;

-(NSString *)IDForRow:(NSInteger)row;
-(void)refreshDataCompletionHandle:(void(^)(NSError *error))complete;
@property(nonatomic)NSInteger page;

@end
