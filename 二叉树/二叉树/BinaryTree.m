//
//  BinaryTree.m
//  二叉树
//
//  Created by peng on 2016/10/24.
//  Copyright © 2016年 Li Peng. All rights reserved.
//

#import "BinaryTree.h"
#import "BinaryTreeNode.h"
@implementation BinaryTree

/**
 生成二叉树 (链式存储)
 */
+ (BinaryTreeNode *)createTreeWithValues:(NSArray *)values {

    BinaryTreeNode *root = nil;
    for (NSInteger i = 0; i > values.count; i ++) {
        NSInteger value = [values[i] integerValue];
        root = [[self class] addTreeNode:root value:value];
    }
    
    return root;
}
#pragma mark - 二叉树反转 （又叫：二叉树的镜像）
+ (BinaryTreeNode *)invertBinaryTree:(BinaryTreeNode *)rootNode {

    if (!rootNode) {
        return nil;
    }
    
    if (!rootNode.leftNode && !rootNode.rightNode) {
        return rootNode;
    }
    
    NSMutableArray *queueArray = [NSMutableArray array]; //数组当成队列
    [queueArray addObject:rootNode]; //压入根节点
    while (queueArray.count > 0) {
        BinaryTreeNode *node = [queueArray firstObject];
        [queueArray removeObjectAtIndex:0]; //弹出最前面的节点，仿照队列先进先出原则
        BinaryTreeNode *pLeft = node.leftNode;
        node.leftNode = node.rightNode;
        node.rightNode = pLeft;
        if (node.leftNode) {
            [queueArray addObject:node.leftNode];
        }
        if (node.rightNode) {
            [queueArray addObject:node.rightNode];
        }
    }
    return rootNode;
}

+ (BinaryTreeNode *)invertBinaryTreeWithoutRecursion:(BinaryTreeNode *)rootNode {

    if (!rootNode) {  return nil; }
    if (!rootNode.leftNode && !rootNode.rightNode) {  return rootNode; }
    [self invertBinaryTree:rootNode.leftNode];
    [self invertBinaryTree:rootNode.rightNode];
    BinaryTreeNode *tempNode = rootNode.leftNode;
    rootNode.leftNode = rootNode.rightNode;
    rootNode.rightNode = tempNode;
    return rootNode;
}
#pragma mark - 遍历二叉树
///先序遍历 根左右
+ (void)treeFirstInformationWithNode:(BinaryTreeNode *)rootNode resultBlock:(void (^)(NSInteger))block {
    
    if (block) {
        block(rootNode.value);
    }
    if (rootNode.leftNode) {
        [self treeFirstInformationWithNode:rootNode.leftNode resultBlock:block];
    }
    if (rootNode.rightNode) {
        [self treeFirstInformationWithNode:rootNode.rightNode resultBlock:block];
    }
}

///中序遍历  左根右
+ (void)treeMiddleInformationWithNode:(BinaryTreeNode *)rootNode resultBlock:(void (^)(NSInteger))block {

    if (rootNode.leftNode) {
        [self treeMiddleInformationWithNode:rootNode.leftNode resultBlock:block];
    }
    if (block) {
        block(rootNode.value);
    }
    if (rootNode.rightNode) {
        [self treeMiddleInformationWithNode:rootNode.rightNode resultBlock:block];
    }
}

//后续遍历 左右根
+ (void)treeLastInformationWithNode:(BinaryTreeNode *)rootNode resultBlock:(void (^)(NSInteger))block {
    
    if (rootNode.leftNode) {
        [self treeLastInformationWithNode:rootNode.leftNode resultBlock:block];
    }
    
    if (rootNode.rightNode) {
        [self treeLastInformationWithNode:rootNode.rightNode resultBlock:block];
    }
    if (block) {
        block(rootNode.value);
    }
}
/// 二叉树深度
+ (NSInteger)depathOfTree:(BinaryTreeNode *)rootNode {

    if (!rootNode) {
        return 0;
    }
    
    if (!rootNode.leftNode && !rootNode.rightNode) {
        return 1;
    }
    
    NSInteger depathLeft = [self depathOfTree:rootNode.leftNode];
    NSInteger depathRitht = [self depathOfTree:rootNode.rightNode];
    
    return MAX(depathLeft, depathRitht) + 1;
}

/// 二叉树所有节点数  节点数=左子树节点数+右子树节点数+1（根节点）
+ (NSInteger)numberOfNodesInTree:(BinaryTreeNode *)rootNode{
    if (!rootNode) return 0;
    return [self numberOfNodesInTree:rootNode.leftNode] + [self numberOfNodesInTree:rootNode.rightNode] + 1;
}

//二叉树中某个节点到根节点的路径
+ (NSArray *)pathOfTreeNode:(BinaryTreeNode *)treeNode inTree:(BinaryTreeNode *)rootNode {

    NSMutableArray *paths = [[NSMutableArray alloc]init];
    [self isFoundTreeNode:treeNode inTree:rootNode routePath:paths];

    return paths;
}

#pragma mark - Private SEL
+ (BinaryTreeNode *)addTreeNode:(BinaryTreeNode *)treeNode value:(NSInteger)value {
    
    if (!treeNode) {
        treeNode = [[BinaryTreeNode alloc]init];
        treeNode.value = value;
    } else if (value <= treeNode.value) {
        NSLog(@"to left");
        //值小于根节点，则插入到左子树
        treeNode.leftNode = [[self class] addTreeNode:treeNode.leftNode value:value];}
    else {
        NSLog(@"to right");
        //值大于根节点，则插入到右子树
        treeNode.rightNode = [[self class] addTreeNode:treeNode.rightNode value:value];
    }
    return treeNode;
}

+ (BOOL)isFoundTreeNode:(BinaryTreeNode *)treeNode inTree:(BinaryTreeNode *)rootNode routePath:(NSMutableArray *)path {

    if (!rootNode || !treeNode) {
        return NO;
    }
    
    if (rootNode == treeNode) {
        [path addObject:rootNode];
        return YES;
    }
    //压人根节点进行递归
    [path addObject:rootNode];
    //先从左子树中查找
    BOOL find = [self isFoundTreeNode:treeNode inTree:rootNode.leftNode routePath:path];
    //未找到，再从右子树查找
    if (!find) {
        find = [self isFoundTreeNode:treeNode inTree:rootNode.rightNode routePath:path];
    }
    //如果2边都没查找到，则弹出此根节点
    if (!find) {
        [path removeLastObject];
    }
    
    return find;
}

@end
