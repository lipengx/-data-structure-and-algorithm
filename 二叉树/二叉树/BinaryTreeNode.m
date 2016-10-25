//
//  BinaryTreeNode.m
//  二叉树
//
//  Created by peng on 2016/10/24.
//  Copyright © 2016年 Li Peng. All rights reserved.
//

#import "BinaryTreeNode.h"

@implementation BinaryTreeNode

+ (instancetype)initializeNodeWithValue:(NSInteger)value {

    BinaryTreeNode *node = [[super alloc] init];
    node.value = value;
    return node;
}
@end
