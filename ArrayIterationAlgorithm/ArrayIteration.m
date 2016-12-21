//
//  NextArray.m
//  ArrayIterationAlgorithm
//
//  Created by 曾昭英 on 2016/12/20.
//  Copyright © 2016年 曾昭英. All rights reserved.
//

#import "ArrayIteration.h"

@implementation ArrayIteration

- (instancetype)initWithArray:(NSArray *)array
{
    self = [super init];
    if (self) {
        _array = array;
        _index = 0;
        _stack = [NSMutableArray new];
    }
    return self;
}

- (id)next
{
    // 1. 判断next的index是否越界，也是递归的结束条件
    if (_index >= _array.count) {
        return nil;
    }
    // 2. 获取数据的object
    id object = _array[_index];
    // 3. 判断object是否是数组
    if ([object isKindOfClass:[NSArray class]]) {
        // 4. 获取栈的数组
        ArrayIteration *array = [_stack lastObject];
        if (!array) {
            // 5. 如果数组为空则初始化并加入栈
            array = [[ArrayIteration alloc] initWithArray:object];
            [_stack addObject:array];
        }
        // 6. 获取数组里面的next，递归调用
        id arrayObject = [array next];
        if (arrayObject) {
            return arrayObject;
        } else {
            // 7. 如果数据的next是空，则把当前数据出栈，递归调用当前的下一个
            [_stack removeLastObject];
            _index ++;
            return [self next];
        }
    } else {
        // 8. 当前index不是数据，直接返回object，并下移index
        _index ++;
        return object;
    }
}

@end
