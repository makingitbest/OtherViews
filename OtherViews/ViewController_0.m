//
//  ViewController_0.m
//  OtherViews
//
//  Created by WangQiao on 17/2/27.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import "ViewController_0.h"

@interface ViewController_0 ()

@end

@implementation ViewController_0

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // initWithFrame 并不能调整按钮的大小，只能设置它的位置.
    UISwitch *swtch      = [[UISwitch alloc] initWithFrame:CGRectMake(100, 150, 100, 100)];
    swtch.tintColor      = [UIColor redColor];   // 关闭状态下的颜色
    swtch.onTintColor    = [UIColor blueColor];  // 打开状态下的颜色
    swtch.thumbTintColor = [UIColor brownColor]; // 滑块颜色
    [swtch setOn: YES]; //设置打开按钮,显示的是打开状态的颜色；事实上默认是关闭按钮
    [self.view addSubview:swtch];
    
    swtch.onImage = [UIImage imageNamed:@"onimage"]; //在没有设置onTintColor的时候有效，其他事件无效
    swtch.offImage = [UIImage imageNamed:@"onimage"]; //在没有设置tintColor的时候有效，其他事件无效
}

@end
