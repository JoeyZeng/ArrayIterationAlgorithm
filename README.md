# ArrayIterationAlgorithm
Algorithm for array iteration

## 问题
给你一个嵌套的 NSArray 数据，实现一个迭代器类，该类提供一个 next() 方法，可以依次的取出这个 NSArray 中的数据。
比如 NSArray 如果是 [1,[4,3],6,[5,[1,0]]]， 则最终应该输出：1, 4, 3, 6, 5, 1, 0 。
另外，实现一个 allObjects 方法，可以一次性取出所有元素。

## Code

### allObjects

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


### next

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
