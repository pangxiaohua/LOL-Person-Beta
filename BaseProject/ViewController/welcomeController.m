//
//  welcomeController.m
//  BaseProject
//
//  Created by apple-jd17 on 15/11/22.
//  Copyright © 2015年 Tarena. All rights reserved.
//

#import "welcomeController.h"
#import "APLPositionToBoundsMapping.h"
#import "ViewController.h"

@interface welcomeController ()

@property(nonatomic,readwrite)CGRect button1Bounds;

@property (weak, nonatomic) IBOutlet UIButton *button1;

@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UIImageView *timo1;
@property (weak, nonatomic) IBOutlet UIImageView *timo2;

@property (weak, nonatomic) IBOutlet UIImageView *timo3;

@property(nonatomic,strong)UIDynamicAnimator  *animator;
@end


@implementation welcomeController


- (void)viewDidLoad {
    [super viewDidLoad];
    //1. 创建力学环境
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    self.animator = animator;
    
    // 2.创建重力行为
    UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[self.imageView,self.timo1,self.timo2,self.timo3]];
    
    // 3.将行为添加到力学环境中
    [animator addBehavior:gravity];
    
    // 4.创建碰撞行为
    UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:@[self.imageView,self.timo1,self.timo2,self.timo3]];
    
    // 将力学场景的视图的四周变成碰撞的边缘
    collision.translatesReferenceBoundsIntoBoundary = YES;
    
   // 添加碰撞行为到场景中
    [animator addBehavior:collision];
    [self getStarPoint];
    
    self.button1Bounds = self.button1.bounds;
    
    // Force the button image to scale with its bounds.
    self.button1.contentHorizontalAlignment = UIControlContentHorizontalAlignmentFill;
    self.button1.contentVerticalAlignment = UIControlContentHorizontalAlignmentFill;
}

- (IBAction)buttonAction:(id)sender {
    
    self.button1.bounds = self.button1Bounds;
    UIDynamicAnimator *animator = [[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    APLPositionToBoundsMapping *buttonBoundsDynamicItem = [[APLPositionToBoundsMapping alloc] initWithTarget:sender];
    
    // Create an attachment between the buttonBoundsDynamicItem and the initial
    // value of the button's bounds.
    UIAttachmentBehavior *attachmentBehavior = [[UIAttachmentBehavior alloc] initWithItem:buttonBoundsDynamicItem attachedToAnchor:buttonBoundsDynamicItem.center];
    [attachmentBehavior setFrequency:2.0];
    [attachmentBehavior setDamping:0.3];
    [animator addBehavior:attachmentBehavior];
    
    UIPushBehavior *pushBehavior = [[UIPushBehavior alloc] initWithItems:@[buttonBoundsDynamicItem] mode:UIPushBehaviorModeInstantaneous];
    pushBehavior.angle = M_PI_4;
    pushBehavior.magnitude = 2.0;
    [animator addBehavior:pushBehavior];
    [pushBehavior setActive:TRUE];
    self.animator = animator;
    
    UITabBarController *mainViewC = [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewC"];
    [self presentViewController:mainViewC animated:YES completion:nil];
    
}

-(void)getStarPoint{
    
    [UIView animateWithDuration:2 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        self.imageView.transform = CGAffineTransformMakeRotation(M_PI);
        self.timo1.transform = CGAffineTransformMakeRotation(M_PI);
        self.timo2.transform = CGAffineTransformMakeRotation(M_PI);
        self.timo3.transform = CGAffineTransformMakeRotation(M_PI);
        
    } completion:nil];
}



@end
