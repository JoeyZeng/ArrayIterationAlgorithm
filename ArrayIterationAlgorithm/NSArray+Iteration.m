//
//  NSArray+NSArray_Iteration.m
//  ArrayIterationAlgorithm
//
//  Created by 曾昭英 on 2016/12/20.
//  Copyright © 2016年 曾昭英. All rights reserved.
//

#import "NSArray+Iteration.h"

@implementation NSArray (Iteration)

- (NSArray *)allObjects
{
    NSMutableArray *array = [NSMutableArray new];
    
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSArray class]]) {
            [array addObjectsFromArray:[obj allObjects]];
        } else {
            [array addObject:obj];
        }
    }];
    
    return [array copy];
}


@end
