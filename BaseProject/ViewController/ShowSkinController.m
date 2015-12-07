//
//  ShowSkinController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/19.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ShowSkinController.h"
#import "iCarousel.h"

@interface ShowSkinController ()<iCarouselDelegate,iCarouselDataSource>

@property(nonatomic,strong)iCarousel *ic;
/** 存储图片名称 */
@property(nonatomic,strong)NSArray *imageNames;

@end

@implementation ShowSkinController

-(NSArray *)imageNames{
    if (!_imageNames) {
    //读取HeroSkins.bundle文件夹内的所有文件名
        NSString *path = [[NSBundle mainBundle]pathForResource:@"HeroSkins" ofType:@"bundle"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        _imageNames = [fileManager subpathsAtPath:path];
    }
    return _imageNames;
}

-(iCarousel *)ic{
    if (!_ic) {
        _ic = [iCarousel new];
//就是仿写的CollectionView
        _ic.delegate = self;
        _ic.dataSource = self;
//修改3D显示模式。type是枚举类型，数值是0～11
        _ic.type = 3;
//自动展示，0表示不滚动 越大滚动越快
        _ic.autoscroll = 1;
//改变为竖向展示
//        _ic.vertical = NO;
//改变为翻页模式
      //  _ic.pagingEnabled = NO;
//滚动速度
        _ic.scrollSpeed = 2;
    }
    return _ic;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.ic];
    self.view.backgroundColor = kRGBColor(227, 200, 72);
    [self.ic mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(0);
    }];
}

#pragma mark - iCarousel
/** 添加循环滚动 */
-(CGFloat)carousel:(iCarousel *)carousel valueForOption:(iCarouselOption)option withDefault:(CGFloat)value{
    if (option==iCarouselOptionWrap) {
        return YES;//type 0的默认循环滚动模式是NO
    }
//修改缝隙
    if (option == iCarouselOptionSpacing) {
        return value*1.5;
    }
//取消背后的显示
//    if (option==iCarouselOptionShowBackfaces) {
//        return NO;
//    }
    
    return value;
}

//问：有多少个Cell
- (NSInteger)numberOfItemsInCarousel:(iCarousel *)carousel{
    return self.imageNames.count;
}
//问：每个Cell什么样
- (UIView *)carousel:(iCarousel *)carousel viewForItemAtIndex:(NSInteger)index reusingView:(nullable UIView *)view{
    if (!view) {
        //这里x.y 是无作用的, 图片的宽高 300*500
        view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kWindowW/2, kWindowH/2)];
        UIImageView *imageView = [UIImageView new];
        imageView.tag = 100;
        [view addSubview:imageView];
        //        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
    }
    UIImageView *imageView = (UIImageView *)[view viewWithTag:100];
    NSString *name = @"HeroSkins";
    //imageNames数组中存的是图片名，以为图片是jpg形式，只能用路径来读取。
    NSString *path=[[NSBundle mainBundle] pathForResource:name ofType:@"bundle"];
    path=[path stringByAppendingPathComponent:self.imageNames[index]];
    imageView.image = [UIImage imageWithContentsOfFile:path];
    return view;
}

- (void)carousel:(iCarousel *)carousel didSelectItemAtIndex:(NSInteger)index{
    NSLog(@"选择了第%ld张", index);
}


/* 统计用户进入此界面的时长、频率等，看当前界面是否受欢迎 */
-(void)viewWillAppear:(BOOL)animated{
    /** 自定义事件，统计3D立体切换效果的点击次数 */
    [MobClick beginEvent:@"3D"];
    
    [MobClick beginLogPageView:@"ViewController"];
}

-(void)viewWillDisappear:(BOOL)animated{
    /** 每一次自定义事件都必须要有开始和结束才算完成一次 */
    [MobClick endEvent:@"3D"];
    [MobClick endLogPageView:@"ViewController"];
}


@end
