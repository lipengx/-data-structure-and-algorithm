//
//  ViewController.m
//  二叉树
//
//  Created by peng on 2016/10/24.
//  Copyright © 2016年 Li Peng. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//       
//        NSLog(@"优先级为 中！！=%@",[NSThread currentThread]);
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0), ^{
//        NSLog(@"优先级为 低！！=%@",[NSThread currentThread]);
//
//    });
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
//        NSLog(@"优先级为 高！！=%@",[NSThread currentThread]);
//
//    });
//    NSLog(@"无序de ");
    
    
    NSThread *thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
    thread1.name = @"low";
    thread1.threadPriority = 0;
    NSThread *thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
    thread2.name = @"hight";
    thread2.threadPriority = 1;

    NSThread *thread3 = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
    thread3.name = @"middle";
    thread3.threadPriority = 0.5;
    [thread1 start];
    [thread2 start];
    [thread3 start];

    
}

- (void)run {

    NSLog(@"sssss== %@",[NSThread currentThread].name);
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
