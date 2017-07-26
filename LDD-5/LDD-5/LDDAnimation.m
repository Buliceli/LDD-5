//
//  LDDAnimation.m
//  LDD-5
//
//  Created by 李洞洞 on 21/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "LDDAnimation.h"
#import "UIView+anchorPoint.h"
#import "UIView+XMGExtension.h"
@interface LDDAnimation ()
@property(nonatomic,assign)LDDAnimationType type;
@end
@implementation LDDAnimation

+ (instancetype)lddAnimation:(LDDAnimationType)type
{
    return [[self alloc]initWithAnimation:type];
}
- (instancetype)initWithAnimation:(LDDAnimationType)type
{
    if (self = [super init]) {
        _type = type;
    }
    return self;
}
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext
{
    return 0.5;
}
- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    switch (_type) {
        case LDDAnimationTypePush:
            [self doPushAnimation:transitionContext];
            break;
            
        case LDDAnimationTypePop:
            [self doPopAnimation:transitionContext];
            break;
    }
}
/**
 *  执行push过渡动画
 */
- (void)doPushAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{
    UIViewController * fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    UIViewController * toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    //对tempView做动画
    UIView * tempView = [fromVC.view snapshotViewAfterScreenUpdates:NO];
    tempView.frame = fromVC.view.frame;
    
    UIView * containerView = [transitionContext containerView];
    
    [containerView addSubview:toVC.view];
    [containerView addSubview:tempView];
    
    //设置初始化状态
    fromVC.view.hidden = YES;
    [containerView insertSubview:toVC.view atIndex:0];//把toVC.view放在最下面
    
    [tempView setAnchorPointTo:CGPointMake(0, 0.5)];
    CATransform3D transform3d = CATransform3DIdentity;////获取一个标准默认的CATransform3D仿射变换矩阵
    transform3d.m34 = -0.002;//透视效果
    containerView.layer.sublayerTransform = transform3d;

    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        tempView.layer.transform = CATransform3DMakeRotation(-M_PI_2, 0, 1, 0);

    } completion:^(BOOL finished) {
        [transitionContext completeTransition:YES];
    }];
    
    
}
/**
 *  执行pop过渡动画
 */
- (void)doPopAnimation:(id<UIViewControllerContextTransitioning>)transitionContext
{

    UIViewController *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIView *containerView = [transitionContext containerView];
    //拿到push时候的
    UIView *tempView = containerView.subviews.lastObject;
    
    [containerView addSubview:toVC.view];
    
    [UIView animateWithDuration:[self transitionDuration:transitionContext] animations:^{
        
        tempView.layer.transform = CATransform3DIdentity;
   
    } completion:^(BOOL finished) {
        [tempView removeFromSuperview];
        toVC.view.hidden = NO;
        [transitionContext completeTransition:YES];
    }];

}
@end
