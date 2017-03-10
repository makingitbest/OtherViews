//
//  ViewController_7.m
//  OtherViews
//
//  Created by WangQiao on 17/2/27.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import "ViewController_7.h"

@interface ViewController_7 ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation ViewController_7

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    UIStepper *stepper   = [[UIStepper alloc] initWithFrame:CGRectMake(10, 100, 100, 50)];
    stepper.minimumValue = 0.0f;
    stepper.maximumValue = 20.0f;
    stepper.stepValue    = 2;
    stepper.tintColor    = [UIColor orangeColor];
    [stepper addTarget:self action:@selector(stepChaged:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:stepper];
    
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 180, 100, 40)];
    self.label.textAlignment = NSTextAlignmentCenter;
    self.label.layer.borderWidth = 1.0f;
    self.label.text  = @"开始";
    [self.view addSubview:self.label];
    
    //设置循环
    stepper.wraps = YES;
    
    //设置自动加减
    stepper.autorepeat = YES;
}

- (void)stepChaged:(UIStepper *)stepper {

    self.label.text = [NSString stringWithFormat:@"%f", stepper.value];
}

@end
