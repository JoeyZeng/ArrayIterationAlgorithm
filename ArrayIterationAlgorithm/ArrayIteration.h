//
//  NextArray.h
//  ArrayIterationAlgorithm
//
//  Created by 曾昭英 on 2016/12/20.
//  Copyright © 2016年 曾昭英. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ArrayIteration : NSObject
{
    NSArray *_array;
    NSUInteger _index;
    NSMutableArray *_stack; //存当前index压栈的array
}

- (instancetype)initWithArray:(NSArray *)array;
- (id)next;

@end
