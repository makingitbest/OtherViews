//
//  ViewController_6.m
//  OtherViews
//
//  Created by WangQiao on 17/2/27.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import "ViewController_6.h"

@interface ViewController_6 () <UITextViewDelegate>

@end

@implementation ViewController_6

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    UITextView *textView = [[UITextView alloc] init];
    textView.frame       = CGRectMake(10, 100, 300, 200);
    textView.layer.borderWidth = 1;
    textView.font              = [UIFont boldSystemFontOfSize:20];
    textView.delegate          = self;
    [self.view addSubview:textView];
    
}

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView {
    
    //是否允许编辑（获得焦点）
    return YES;
}

- (BOOL)textViewShouldEndEditing:(UITextView *)textView {
    
    //是否允许结束编辑（失去焦点）
    return YES;
}

- (void)textViewDidBeginEditing:(UITextView *)textView {

    //当已经获取焦点时，调用这个方法
}

- (void)textViewDidEndEditing:(UITextView *)textView {
    
    //当结束编辑
}

//返回值YES,表示可以继续编辑，返回NO表示不可编辑

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    
    //第二个参数：
    //第三个参数：表示将要输入的内容
    //返回值表示：已有内容可不可以被改变
    
//     NSLog(@"textView.text-->%@ range(%lu,%lu) text-->%@",textView.text,(unsigned long)range.location,(unsigned long)range.length,text);
//    
//    if (textView.text.length + text.length > 10) {
//        return NO;
//    }
//    
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView {
    
}

@end
