//
//  ViewController.m
//  BinarySearch
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

//递归和非递归

#pragma mark --- 非递归实现

+ (NSInteger)binarySeachWithNORecursion:(NSArray *)srcArray withDes:(NSNumber *)des {
    
    if (srcArray.count > 0) {
        
        NSInteger low = 0;
        NSInteger hight = srcArray.count - 1;
        
        while (low <= hight) {
            
            NSInteger middle = low + ((hight + low)>>1);//中间位置计算,low+ 最高位置减去最低位置,右移一位,相当于除2.也可以用(high+low)/2
            if ([des integerValue] == [srcArray[middle] integerValue]) return middle;
            else if ([des integerValue] < [srcArray[middle] integerValue]) { hight = middle - 1; }
            else {
                low = middle + 1;
            };
        }
    }
    

    return -1;
}
#pragma mark --- 递归实现
+ (NSInteger)binarySeachWithRecursion:(NSArray *)srcArray withDes:(NSNumber *)des {

    if (srcArray.count > 0) {
     
        NSInteger low = 0;
        NSInteger hight = srcArray.count - 1;
        return [self binSearch:srcArray withLow:low withHigh:hight withKey:des];
    }
    
    return -1;
}

+ (NSInteger)binSearch:(NSArray *)srcArray withLow:(NSInteger)low withHigh:(NSInteger)high withKey:(NSNumber *)key {
    
    NSInteger mid = (low + high)/2;
    
    if (low > high) {
        return -1;
    }
    
    if (low==high == [key integerValue]) {
        return low;
    }
    
    if ([key integerValue] == [srcArray[mid] integerValue]) {
        return mid;
    } else if([key integerValue] < [srcArray[mid] integerValue]){
        return [self binSearch:srcArray withLow:low withHigh:(mid -1) withKey:key];
    } else {
        return [self binSearch:srcArray withLow:(mid + 1) withHigh:high withKey:key];
    }
}
@end
