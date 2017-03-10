//
//  ViewController_2.m
//  OtherViews
//
//  Created by WangQiao on 17/2/27.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import "ViewController_2.h"

@interface ViewController_2 ()

@property (nonatomic, strong) UIProgressView *progressView;
@property (nonatomic, strong) NSTimer        *timer;

@end

@implementation ViewController_2

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 不能设置 progressView 的高度
    self.progressView                   = [[UIProgressView alloc] initWithFrame:CGRectMake(50, 100, 220, 40)];
    self.progressView.trackTintColor    = [UIColor grayColor];
    self.progressView.progressTintColor = [UIColor greenColor];
    [self.view addSubview:self.progressView];
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:3.0 target:self selector:@selector(scheduledTimer:) userInfo:nil repeats:YES];
}

- (void)scheduledTimer:(NSTimer *)timer {

    self.progressView.progress += 0.5;
}

@end
