//
//  ScrollDisplayViewController.h
//  BaseProject
//
//  Created by apple-jd17 on 15/10/30.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <UIImageView+WebCache.h>
#import <UIButton+WebCache.h>
//使用网络图片，需要引入SDWebImage，请到下面网址下载
//http://github.com/rs/SDWebImage

#pragma mark - 协议
@class ScrollDisplayViewController;

@protocol  ScrollDisplayViewControllerDelegate <NSObject>

@optional
//当用户点击了某一页触发
-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController didSelectedIndex:(NSInteger)index;
//实时回传当前索引值
-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController currentIndex:(NSInteger)index;

@end



@interface ScrollDisplayViewController : UIViewController

{
    NSTimer *_timer;
}

//传入图片地址数组
-(instancetype)initWithImgPaths:(NSArray *)paths;

//传入图片名字数组
-(instancetype)initWithImgNames:(NSArray *)names;

//传入视图控制器
-(instancetype)initWithControllers:(NSArray *)controllers;

@property(nonatomic,weak)id<ScrollDisplayViewControllerDelegate> delegate;


//用于保存传进来的数组
@property(nonatomic,readonly)NSArray *paths;
@property(nonatomic,readonly)NSArray *names;
@property(nonatomic,readonly)NSArray *controllers;

//用于展示的
@property(nonatomic,readonly)UIPageViewController *pageVC;
@property(nonatomic,readonly)UIPageControl *pageControl;

//设置是否循环滚动，默认是YES，表示可以循环
@property(nonatomic)BOOL canCycle;
//设置是否定时滚动，默认是YES，表示定时滚动
@property(nonatomic)BOOL autoCycle;
//滚动的时间间隔，默认是3秒
@property(nonatomic)NSTimeInterval duration;
//是否显示页数提示，默认YES，显示
@property(nonatomic)BOOL showPageControl;
//当前页数
@property(nonatomic)NSInteger currentPage;
//设置页数提示的垂直偏移量，正数表示向下移动
@property(nonatomic)CGFloat pageControlOffset;
//设置页数的远点正常颜色

//设置页数圆点的高亮颜色




@end
