//
//  SecondController.m
//  LDD-5
//
//  Created by 李洞洞 on 21/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "SecondController.h"
#import "LDDAnimation.h"
@interface SecondController ()

@end

@implementation SecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView * imV = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"02"]];
    imV.frame = self.view.frame;
    [self.view addSubview:imV];
    
    UIButton * clickBtn = ({
        UIButton * btn = [[UIButton alloc]initWithFrame:CGRectMake(64, 100, 150, 44)];
        [btn setBackgroundColor:[UIColor cyanColor]];
        [btn setTitle:@"点击或者右滑Pop" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
        btn;
    });
    [self.view addSubview:clickBtn];
}

- (void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
    
}
#pragma mark --- UINavigationControllerDelegate
- (nullable id <UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController animationControllerForOperation:(UINavigationControllerOperation)operation fromViewController:(UIViewController *)fromVC toViewController:(UIViewController *)toVC
{
    if (operation == UINavigationControllerOperationPush) {
        return [LDDAnimation lddAnimation:LDDAnimationTypePush];
    }else{
        return [LDDAnimation lddAnimation:LDDAnimationTypePop];
    }
}
@end
