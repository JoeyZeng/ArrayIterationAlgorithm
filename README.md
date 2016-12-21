# ArrayIterationAlgorithm
Algorithm for array iteration

    // 1. 创建一个属性文本
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] initWithString:@"Some Text, blabla..."];
    
    // 2. 为文本设置属性
    text.yy_font = [UIFont boldSystemFontOfSize:30];
    text.yy_color = [UIColor blueColor];
    [text yy_setColor:[UIColor redColor] range:NSMakeRange(0, 4)];
    text.yy_lineSpacing = 10;
    
    // 3. 赋值到 YYLabel 或 YYTextView
    YYLabel *label = [YYLabel new];
    label.frame = ...
    label.attributedString = text;
    
    YYTextView *textView = [YYTextView new];
    textView.frame = ...
    textView.attributedString = text;
