//
//  ViewController.m
//  hino
//
//  Created by peng on 2016/10/21.
//  Copyright © 2016年 Li Peng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark === 汉诺塔递归
/*********************************************
 问题描述：
 
 　　有一个梵塔，塔内有三个座A、B、C，A座上有诺干个盘子，盘子大小不等，大的在下，小的在上。
 
 把这些个盘子从A座移到C座，中间可以借用B座但每次只能允许移动一个盘子，并且在移动过程中，3个座上的盘
 
 子始终保持大盘在下，小盘在上。
 
 
 描述简化：
 
 把A柱上的n个盘子移动到C柱，其中可以借用B柱。
 
 |                |               |
 -|-               |               |
 --|--              |               |
 ----|-----           |               |
 -------|-------       __|__           __|__
 A                B               C
 
 **************************************************/

+ (void)move:(NSInteger)N withA:(NSString *)A withB:(NSString *)B withC:(NSString *)C{
    if ( N == 1 ) {
        NSLog(@"Move disk %ld from %@ to %@\n",N,A,C);
    }else{
        [self move:(N - 1) withA:A withB:C withC:B];
        NSLog(@"Move disk %ld from %@ to %@\n",N,A,C);
        [self move:(N - 1) withA:B withB:A withC:C];
    }
}
@end
