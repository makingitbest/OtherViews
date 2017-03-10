//
//  ViewController_1.m
//  OtherViews
//
//  Created by WangQiao on 17/2/27.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import "ViewController_1.h"

@interface ViewController_1 ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController_1

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 滑动按钮的大小没法改变
    UISlider *slider    = [[UISlider alloc] initWithFrame:CGRectMake(50, 250, 220, 50)];
    slider.minimumValue = 0;
    slider.maximumValue = 10;
    [slider addTarget:self action:@selector(valueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    
    slider.layer.borderWidth = 1;
    
    self.label                 = [[UILabel alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
    self.label.backgroundColor = [UIColor yellowColor];
    self.label.text            = @"监控slider";
    [self.view addSubview:self.label];
}

- (void)valueChanged:(UISlider *)slider {

    self.label.text = [NSString stringWithFormat:@"%.2f",slider.value];
}

@end
