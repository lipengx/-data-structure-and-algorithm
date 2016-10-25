//
//  BinaryTreeNode.h
//  二叉树
//
//  Created by peng on 2016/10/24.
//  Copyright © 2016年 Li Peng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BinaryTreeNode : NSObject
@property (nonatomic, assign) NSInteger value;
@property (nonatomic, strong) BinaryTreeNode *leftNode;
@property (nonatomic, strong) BinaryTreeNode *rightNode;

/**
 构造便利器
 */
+ (instancetype)initializeNodeWithValue:(NSInteger)value;
@end
