//
//  ContainViewController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/5.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "ContainViewController.h"
#import "ScrollDisplayViewController.h"
#import "VideoViewController.h"

@interface ContainViewController ()<ScrollDisplayViewControllerDelegate>

//加在容器里，左右分页的
@property(nonatomic,strong)ScrollDisplayViewController *sdVC;
@property(nonatomic,strong)UIScrollView *scrollView;
//可变数组，存放头部按钮
@property(nonatomic,strong)NSMutableArray *btns;

//用于保存当前选中的按钮
@property(nonatomic,strong)UIButton *currentBtn;


@end

@implementation ContainViewController

-(VideoViewController *)videoVCWithType:(videoList)type{
    VideoViewController *vc = [kStoryboard(@"Main") instantiateViewControllerWithIdentifier:@"VideoViewController"];
    vc.type = type;
    return vc;
}

-(ScrollDisplayViewController *)sdVC{
    if (!_sdVC) {
        NSArray *vcs = @[[self videoVCWithType:videoListJieShuo],
                         [self videoVCWithType:videoListYuLe],
                         [self videoVCWithType:videoListSaiShi]];
        
        _sdVC = [[ScrollDisplayViewController alloc]initWithControllers:vcs];
        _sdVC.canCycle = NO;
        _sdVC.autoCycle = NO;
        _sdVC.showPageControl = NO;
        _sdVC.delegate = self;
        
    }
    return _sdVC;
}


static NSString * const reuseIdentifier = @"Cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addChildViewController:self.sdVC];
    [self.view addSubview:self.sdVC.view];
    [self.sdVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    [self.navigationController.navigationBar addSubview:self.scrollView];
    [self.scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.left.right.mas_equalTo(0);
        make.height.mas_equalTo(44);
    }];
    
}



#pragma mark - 头部滚动视图属性的懒加载
-(UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [UIScrollView new];
        NSArray *arr = @[@"解说",@"娱乐",@"赛事"];
        UIView *lastView = nil;//永远指向最新添加的按钮
        for (int i=0; i<arr.count; i++) {
            UIButton *btn = [UIButton buttonWithType:0];
            //将按钮的文字对应数组的项
            [btn setTitle:arr[i] forState:0];
            //设置按钮未点击时的背景色
            [btn setBackgroundColor:kRGBColor(43, 49, 56)];
            //按钮未被点击时文字的颜色
            [btn setTitleColor:kRGBColor(187, 200, 221) forState:0];
            //按钮被点击时文字的颜色
            [btn setTitleColor:kRGBColor(74, 136, 240) forState:UIControlStateSelected];
            if (i==0) {
                _currentBtn = btn;
                btn.selected = YES;
            }
            [btn bk_addEventHandler:^(UIButton *sender) {
                //如果当前按钮是点击状态，则什么都不做，否则取消掉之前按钮的点击状态，并把当前按钮设置为点击状态
                if (_currentBtn != sender) {
                    _currentBtn.selected = NO;
                    sender.selected = YES;
                    _currentBtn = sender;
                    _sdVC.currentPage = [_btns indexOfObject:sender];
                }
                
            } forControlEvents:UIControlEventTouchUpInside];
            [_scrollView addSubview:btn];
            
            [btn mas_makeConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(CGSizeMake(self.view.bounds.size.width/3, 44));
                make.centerY.mas_equalTo(_scrollView);
                if (lastView) {//表示已经添加过按钮
                    make.left.mas_equalTo(lastView.mas_right).mas_equalTo(0);
                }else{
                    make.left.mas_equalTo(0);
                }
            }];
            [btn setBackgroundColor:kRGBColor(31, 36, 42)];
            lastView = btn;
            [self.btns addObject:btn];
        }
        //lastView肯定是最后一个按钮，最后一个按钮的x轴，肯定是固定的，当我们设置按钮的右边缘距离父视图contentView的右边缘距离10像素，那么滚动视图的内容就会被锁定了
        [lastView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(_scrollView.mas_right).mas_equalTo(0);
        }];
        //隐藏滚动视图中的滚动条
        _scrollView.showsHorizontalScrollIndicator = NO;
        //如果有线 就添加线的约束
    }
    return _scrollView;
}





-(NSMutableArray *)btns{
    if (!_btns) {
        _btns = [NSMutableArray new];
        
    }
    return _btns;
}


#pragma mark - 切到下一页或是切回来影藏掉按钮
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.scrollView.hidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.scrollView.hidden = YES;
}


-(void)scrollDisplayViewController:(ScrollDisplayViewController *)scrollDisplayViewController currentIndex:(NSInteger)index{
    _currentBtn.selected = NO;
    _currentBtn = _btns[index];
    _currentBtn.selected = YES;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
