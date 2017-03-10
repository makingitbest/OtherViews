//
//  RootViewController.m
//  OtherViews
//
//  Created by WangQiao on 17/2/27.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@property (nonatomic, strong) NSArray *buttonTitleArray;

@property (nonatomic, strong) NSArray *viewTitleArray;

@end

@implementation RootViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 按钮的标题
    self.buttonTitleArray = @[@"UISwitch", @"UISlider", @"UIProgressView", @"UIAlertController", @"UIActivityIndicatorView", @"UISegmentedControl", @"UITextView", @"UIStepper"];
    
    // 控制器字符串
    self.viewTitleArray = @[@"ViewController_0", @"ViewController_1", @"ViewController_2", @"ViewController_3", @"ViewController_4", @"ViewController_5", @"ViewController_6", @"ViewController_7"];
    
    [self addSubviews];
}

- (void)addSubviews {
    
    for ( int i = 0; i <8; i++) {
        
        UIButton *button          = [[UIButton alloc] initWithFrame:CGRectMake(50, 80 + 50 *i, 200, 40)];
        button.layer.borderWidth  = 1;
        button.layer.cornerRadius = 10;
        button.tag                = 10 + i;
        button.titleLabel.font    = [UIFont systemFontOfSize:13];
        [button setTitle:self.buttonTitleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(buttonEvent:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
    }
}

- (void)buttonEvent:(UIButton *)button {
    
    NSInteger index = button.tag - 10;
    
    Class viewControllerClass = NSClassFromString(self.viewTitleArray[index]);
    UIViewController *vc      = [[viewControllerClass alloc] init];
    vc.title                  = self.viewTitleArray[index];
    vc.view.backgroundColor   = [UIColor whiteColor];
//    vc.view.backgroundColor  = [UIColor colorWithRed:arc4random()%255/255.0 green:arc4random()%255/255.0 blue:arc4random()%255/255.0 alpha:1];
    [self.navigationController pushViewController:vc animated:YES];
    
    NSLog(@"%@",viewControllerClass);
    
}

@end
