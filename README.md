# FHHTagView
[![License MIT](https://img.shields.io/badge/license-MIT-green.svg?style=flat)](https://raw.githubusercontent.com/jvjishou/FHHFPSIndicator/master/LICENSE)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/v/FHHFPSIndicator.svg?style=flat)](http://cocoapods.org/?q=FHHFPSIndicator)&nbsp;
[![CocoaPods](http://img.shields.io/cocoapods/p/FHHFPSIndicator.svg?style=flat)](http://cocoapods.org/?q=FHHFPSIndicator)&nbsp;

Installation
==============
### CocoaPods

1. Add `pod "FHHTagView"` to your Podfile.
2. Run `pod install` or `pod update`.
3. Import \<FHHTagView/FHHTagView.h\>.

### Manually
1. Drag all source files under floder `FHHTagView` to your project
2. Import the main header file：`#import "FHHTagView.h"`

### Tip：
* support apis of Height cacluation
* custom tag style
* support tagView selection style
* support the block while the Tag is selected
* offer add、insert、remove operations


### Introduction
#### How to use
  * initialize an array and add tag to the array like :
  ```
NSMuatbleArray<FHHTag *> *tagArray = [[NSMuatbleArray<FHHTag *> alloc] init];
FHHTag *tag = [[FHHTag alloc] initWithTitle:@"Big Hero 6"];
[tagArray addObject:tag];
  ```
  * initialize a layout like :
  ```
FHHTagViewLayout *layout = [[FHHTagViewLayout alloc] init];
layout.width = 300;
layout.lineSpacing = 5.0;
layout.innerItemSpacing = 4.0;
  ```
  * initialize a tagView,then call the func **refreshWithTagArray:**,like:
  ```
FHHTagView *tagView = [[FHHTagView alloc] init];
[tagView refreshWithTagArray:tagArray layout:layout];
  ```


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
