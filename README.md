#FHHTagView
[Github](https://github.com/002and001/FHHTagView)
### Tip：
* 提供高度计算Api
* 自定义标签样式
* 可设置标签控件是否支持单选、多选、不可选三种方式
* 标签点击选择后可执行block回调
* 支持标签的add、insert、remove操作
### Demo：
---
![FHHtagViewGif.gif](https://upload-images.jianshu.io/upload_images/2351207-3895eb096d3791e7.gif?imageMogr2/auto-orient/strip)

### Demo part code
```
- (void)p_configTagView {
    NSArray *titleArray = @[@"Tatchi", @"DRAGON BALL", @"火影忍者", @"我家有个狐仙大人", @"进击的巨人", @"东京食尸鬼", @"ONE PUNCH-MAN", @"我叫坂本我最屌", @"四月是你的谎言", @"Angle beats", @"Charlotte", @"Fate", @"境界的彼方", @"头脑特工队", @"从前有座灵剑山",@"一人之下", @"妖狐小红娘"];
    NSMutableArray *tagArrayM = [NSMutableArray arrayWithCapacity:titleArray.count];
    for (NSString *title in titleArray) {
        FHHTag *tag = [self p_tagWithTitle:title];
        if ([title isEqualToString:@"头脑特工队"]) {
            tag.normalStateButtonBlock = ^(FHHTagButton *button) {
                button.layer.borderColor = [[UIColor purpleColor] CGColor];
                [button setTitleColor:[UIColor purpleColor] forState:UIControlStateNormal];
            };
        }
        [tagArrayM addObject:tag];
    }
    FHHTagViewLayout *layout = [[FHHTagViewLayout alloc] init];
    _tagViewLayout = layout;
    FHHTagView *tagView = [[FHHTagView alloc] init];
    tagView.selectionStyle = FHHTagViewSelectionStyleSingle;
//    tagView.selectionStyle = FHHTagViewSelectionStyleMutiple;
//    tagView.selectionStyle = FHHTagViewSelectionStyleNone;
    
    layout.width = 300;
    layout.lineSpacing = 10.0;
    layout.innerItemSpacing = 10.0;
    //    tagView.padding = UIEdgeInsetsMake(10, 5, 20, 0);
    tagView.fhh_x = 10;
    tagView.fhh_y = 50;
    [tagView refreshWithTagArray:tagArrayM layout:layout];
    [self.view addSubview:tagView];
```

```
- (FHHTag *)p_tagWithTitle:(NSString *)title {
    FHHTag *tag = [[FHHTag alloc] initWithTitle:title];
    tag.normalStateButtonBlock = ^(FHHTagButton *button) {
        button.layer.borderColor = [[UIColor blackColor] CGColor];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    };
    __weak typeof(tag) weakTag = tag;
    tag.selectedStateButtonBlcok = ^(FHHTagButton *button) {
        button.layer.borderColor = [[UIColor orangeColor] CGColor];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        NSLog(@"tag.title:%@",weakTag.title);
    };
    tag.enable = true;
    tag.cornerRadius = 3;
    tag.borderWidth = 1.0;
    tag.fontSize = 12;
    tag.padding = UIEdgeInsetsMake(5, 5, 5, 5);
//    tag.buttonHeight = 25.0;  // will disable tag.padding
    return tag;
}
```

### Introduction
#### How to use
  * 创建一个NSArray<FHHTag *>类型的数组tagArray
  * 创建一个FHHTagViewLayout对象tagLayout，需设置tagLayout的Width，用于指定FHHTagView的宽度
  * 创建一个FHHTagView对象tagView,调用[tagView refreshWithTagArray:tagArray layout:layout]刷新视图即可

示例Demo请参考[Github](https://github.com/002and001/FHHTagView)