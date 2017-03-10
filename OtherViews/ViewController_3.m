//
//  ViewController_3.m
//  OtherViews
//
//  Created by WangQiao on 17/2/27.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import "ViewController_3.h"

typedef enum : NSUInteger {
    
    kButtonStyleOne,
    kButtonStyleTwo,
    kButtonStyleThree,
    
} EViewController_3;
@interface ViewController_3 ()

@property (nonatomic, strong) UIButton *buttonStyle1;
@property (nonatomic, strong) UIButton *buttonStyle2;
@property (nonatomic, strong) UIButton *buttonStyle3;

@property (nonatomic, strong) UIAlertAction *secureTextAlertAction;

@end

@implementation ViewController_3

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.buttonStyle1                 = [[UIButton alloc] initWithFrame:CGRectMake(10, 80, 200, 50)];
    self.buttonStyle1.backgroundColor = [UIColor grayColor];
    self.buttonStyle1.tag             = kButtonStyleOne;
    self.buttonStyle1.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.buttonStyle1 setTitle:@"点击弹出表单ActionSheet" forState:UIControlStateNormal];
    [self.buttonStyle1 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonStyle1 setTintColor:[UIColor redColor]];
    [self.view addSubview:self.buttonStyle1];
    
    self.buttonStyle2                 = [[UIButton alloc] initWithFrame:CGRectMake(10, 150, 200, 50)];
    self.buttonStyle2.backgroundColor = [UIColor grayColor];
    self.buttonStyle2.tag             = kButtonStyleTwo;
    self.buttonStyle2.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.buttonStyle2 setTitle:@"点击弹出提示框 AlertView" forState:UIControlStateNormal];
    [self.buttonStyle2 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonStyle2 setTintColor:[UIColor redColor]];
    [self.view addSubview:self.buttonStyle2];
    
    self.buttonStyle3                 = [[UIButton alloc] initWithFrame:CGRectMake(10, 220, 120, 50)];
    self.buttonStyle3.backgroundColor = [UIColor grayColor];
    self.buttonStyle3.tag             = kButtonStyleThree;
    self.buttonStyle3.titleLabel.font = [UIFont systemFontOfSize:12];
    [self.buttonStyle3 setTitle:@"有输入框的提示框" forState:UIControlStateNormal];
    [self.buttonStyle3 addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.buttonStyle3 setTintColor:[UIColor redColor]];
    [self.view addSubview:self.buttonStyle3];
}

- (void)buttonClick:(UIButton *)button {
    
    // UIAlertView，UIActionSheet已被废弃，使用下面UIAlertController的两种style模式代替
    /*
     preferredStyle有两个形式： UIAlertControllerStyleActionSheet 表单模式  替代了UIActionSheet
                            UIAlertControllerStyleAlert  弹出框模式       替代了UIAlertView
     */
    
    if (button.tag == kButtonStyleOne) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择" message:@"你是男生还是女生" preferredStyle:UIAlertControllerStyleActionSheet];
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"男生" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"男生");
        } ];
        
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"女生" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"女生");
        } ];
        
        [alertController addAction:action1];
        [alertController addAction:action2];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    } else if (button.tag == kButtonStyleTwo) {
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择" message:@"是否确定选择" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"确认");
        } ];
        
        UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
            NSLog(@"取消");
        } ];
        
        [alertController addAction:action1];
        [alertController addAction:action2];
        
        [self presentViewController:alertController animated:YES completion:nil];
        
    } else if (button.tag == kButtonStyleThree) {
    
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"选择" message:@"是否确定选择" preferredStyle:UIAlertControllerStyleAlert];
        
        // 添加输入框
        [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
           
            // 设置textField基本属性
            textField.secureTextEntry = YES;
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(handleTextFieldTextDidChangeNotification:) name:UITextFieldTextDidChangeNotification object:textField];
        }];
        
        UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
            
            NSLog(@"取消");
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertController.textFields.firstObject];
        }];
        
        UIAlertAction *otherAction = [UIAlertAction actionWithTitle:@"其他" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
            
            NSLog(@"其他");
            [[NSNotificationCenter defaultCenter] removeObserver:self name:UITextFieldTextDidChangeNotification object:alertController.textFields.firstObject];
        }];
        
        otherAction.enabled = NO;

        // Hold onto the secure text alert action to toggle the enabled/disabled state when the text changed.
        self.secureTextAlertAction = otherAction;

        [alertController addAction:cancelAction];
        [alertController addAction:otherAction];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

- (void)handleTextFieldTextDidChangeNotification:(NSNotification *)notification {
   
    UITextField *textField = notification.object;
    
    // Enforce a minimum length of >= 5 characters for secure text alerts.
    self.secureTextAlertAction.enabled = textField.text.length >= 5;
}

@end
