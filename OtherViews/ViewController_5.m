//
//  ViewController_5.m
//  OtherViews
//
//  Created by WangQiao on 17/2/27.
//  Copyright © 2017年 WangQiao. All rights reserved.
//

#import "ViewController_5.h"

@interface ViewController_5 ()

@end

@implementation ViewController_5

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    NSArray *itemArray = @[@"添加", @"1", @"删除"];
    
    UISegmentedControl *segmented = [[UISegmentedControl alloc] initWithItems:itemArray];
    segmented.frame               = CGRectMake(10, 100, 300, 50);
    segmented.momentary           = YES; // 点击后回复原样
    [segmented addTarget:self action:@selector(segmentedAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:segmented];

//    segmented.selectedSegmentIndex = 0; // 总是选择第一个
    segmented.tintColor = [UIColor orangeColor];
}


- (void)segmentedAction:(UISegmentedControl *)segmented {
    
    if (segmented.selectedSegmentIndex == 0) {
        
        // 点击index= 0的位置 ==》就在index= 0的后面加一个
        [segmented insertSegmentWithTitle:@"➕" atIndex:1 animated:YES];
        
        NSLog(@"segmented.numberOfSegments ==%ld", segmented.numberOfSegments);

    } else if (segmented.selectedSegmentIndex == segmented.numberOfSegments - 1){
        
        
        if (segmented.numberOfSegments ==  3) {
            
            return;
        }
        
        //点击最后一个的位置==》就删除index = 1的位置
        [segmented removeSegmentAtIndex:1 animated:YES];
        
        // 拿到segment的总数量
        NSLog(@"segmented.numberOfSegments ==%ld", segmented.numberOfSegments);
    }
}

@end
