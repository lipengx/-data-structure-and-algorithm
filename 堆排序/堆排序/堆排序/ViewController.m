//
//  ViewController.m
//  堆排序
//
//  Created by peng on 2016/10/26.
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
////堆排序time:O(nlgn)
+ (void)heapSort:(NSMutableArray *)list {

    NSInteger size = list.count;
    // 从子树开始整理树
    for (NSInteger i = list.count - 1; i >= 0; i--) {
        [self createBiggestHeap:list withSize:size beIndex:i];
    }
    //拆除树
    while (size > 0) {
        [list exchangeObjectAtIndex:size - 1 withObjectAtIndex:0];//将根（最小）与数组最末交换
        size--;//树大小减小
        [self createBiggestHeap:list withSize:size beIndex:0];//整理树
    }
}


/// 最大堆heap  最大／最小优先级队列 (调整堆结构)
+ (void)createBiggestHeap:(NSMutableArray *)list withSize:(int)size beIndex:(int)element {
    
    int lChild = element * 2 + 1, rChild = element * 2 + 2; //左右子树
    while (rChild < size) {
        //如果比左右子树都小，需要整理
        if (list[element] <= list[lChild] && list[element] <= list[rChild]) {
            return;
        }
        
        if (list[lChild] <= list[rChild]) {
            [list exchangeObjectAtIndex:element withObjectAtIndex:lChild];//把左面的提到上面
            element = lChild;//循环时整理子树
        } else {
        
            [list exchangeObjectAtIndex:element withObjectAtIndex:rChild];
            element = rChild;
            
        }
        lChild = element * 2 + 1;
        rChild = lChild + 1;//重新计算子树位置
    }
    //只有左子树且子树小于自己
    if (lChild < size && list[lChild] < list[element]) {
        [list exchangeObjectAtIndex:lChild withObjectAtIndex:element];
    }
}

@end
