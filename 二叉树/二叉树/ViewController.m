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
    
    
//    NSThread *thread1 = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
//    thread1.name = @"low";
//    thread1.threadPriority = 0;
//    NSThread *thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
//    thread2.name = @"hight";
//    thread2.threadPriority = 1;
//
//    NSThread *thread3 = [[NSThread alloc]initWithTarget:self selector:@selector(run) object:nil];
//    thread3.name = @"middle";
//    thread3.threadPriority = 0.5;
//    [thread1 start];
//    [thread2 start];
//    [thread3 start];
    NSOperationQueue *operationQueue = [[NSOperationQueue alloc] init];
    
    // 设置线程的最大并发数
    
    operationQueue.maxConcurrentOperationCount = 3;
    
    // 建立线程对象
    
    NSInvocationOperation *operation1 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run1) object:nil];
    operation1.name = @"def";
    

    NSInvocationOperation *operation3 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run3) object:nil];
    NSInvocationOperation *operation2 = [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(run2) object:nil];
    operation2.name = @"high";
    operation2.queuePriority = NSOperationQueuePriorityHigh;
    // 将线程对象加入线程池
    
    [operationQueue addOperation:operation1];
    
    [operationQueue addOperation:operation2];
    [operationQueue addOperation:operation3];

}

- (void)run {

    NSLog(@"sssss== %@",[NSThread currentThread].name);
    
}
- (void)run1 {
    
    NSLog(@"run 1111111");
    
}

- (void)run2 {
    
    NSLog(@"run 22222222");
    
}
- (void)run3 {
    
    NSLog(@"run 333");
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
