//
//  ViewController.m
//  LDD-5
//
//  Created by 李洞洞 on 21/7/17.
//  Copyright © 2017年 Minte. All rights reserved.
//

#import "ViewController.h"
#import "SecondController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
}
- (IBAction)push:(UIButton *)sender {
    SecondController * secVC = [[SecondController alloc]init];
    self.navigationController.delegate = secVC;
    [self.navigationController pushViewController:secVC animated:YES];
}


@end
