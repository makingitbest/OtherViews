//
//  ViewController_4.m
//  OtherViews
//
//  Created by WangQiao on 17/2/27.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import "ViewController_4.h"

@interface ViewController_4 ()

@end

@implementation ViewController_4

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // init 无法控制菊花的大小
    UIActivityIndicatorView * indicatorView = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    indicatorView.color                     = [UIColor orangeColor];
    [self.view addSubview:indicatorView];
    
    indicatorView.layer.borderWidth = 1;
    indicatorView.transform         = CGAffineTransformMakeScale(2, 2); // 将菊花放大了2倍
    [indicatorView startAnimating];
    [indicatorView stopAnimating];
    
    indicatorView.hidesWhenStopped = NO;// 停止后不隐藏
}

@end
