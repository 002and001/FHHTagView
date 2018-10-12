//
//  FHHTagViewControllerDemo.m
//  FHHTagView
//
//  Created by 002 on 2018/10/8.
//  Copyright © 2018年 002. All rights reserved.
//

#import "FHHTagViewControllerDemo.h"
#import "FHHTagView.h"
#import "FHHTag.h"
#import "UIView+FHHFrame.h"

@interface FHHTagViewControllerDemo ()

@property (nonatomic, strong) FHHTagViewLayout *tagViewLayout;
@property (nonatomic, weak) FHHTagView *tagView;
@property (nonatomic, weak) UIButton *btnAdd;
@property (nonatomic, weak) UITextView *textViewAdd;
@property (nonatomic, weak) UIButton *btnAddAtIndex;
@property (nonatomic, weak) UITextView *textViewAddAtIndexContent;
@property (nonatomic, weak) UILabel *labelAddAtIndex;
@property (nonatomic, weak) UITextView *textViewAddAtIndex;
@property (nonatomic, weak) UILabel *labelAddIndexRange;
@property (nonatomic, weak) UIButton *btnRemove;
@property (nonatomic, weak) UITextView *textViewRemove;
@property (nonatomic, weak) UIButton *btnRemoveAtIndex;
@property (nonatomic, weak) UITextView *textViewRemoveAtIndex;
@property (nonatomic, weak) UILabel *labelRemoveRange;
@property (nonatomic, weak) UIButton *btnRemoveAll;
@property (nonatomic, weak) UIButton *btnShowInfo;
@property (nonatomic, weak) UIButton *btnDismiss;

@end

@implementation FHHTagViewControllerDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];

    [self p_configTagView];
    [self p_configBtnAdd];
    [self p_configTextViewAdd];
    [self p_configBtnAddAtIndex];
    [self p_configTextViewAddAtIndexContent];
    [self p_configTextViewAddAtIndex];
    [self p_configLabelAddIndexRange];
    [self p_configBtnRemove];
    [self p_configTextViewRemove];
    [self p_configBtnRemoveAtIndex];
    [self p_configTextViewRemoveAtIndex];
    [self p_configLabelRemoveRange];
    [self p_configBtnRemoveAll];
    [self p_configBtnShowInfo];
    [self p_configBtnDismiss];
    [self p_updateLabelRange];
}

- (void)dealloc {
    NSLog(@"FHHTagListViewController - dealloc");
}

#pragma mark - HandleViews
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
    [tagView refreshWithTagArray:tagArrayM layout:layout];
    [self.view addSubview:tagView];
    _tagView = tagView;
    _tagView.fhh_x = 10;
    _tagView.fhh_y = 50;
//    CGFloat tagH = [tagView heightForTagView];
//    CGFloat height = [FHHTagView heightForTagViewWithTagArray:tagArrayM layout:layout];
//    NSLog(@"tagH:%lf,height:%lf",tagH,height);
}

- (void)p_configBtnAdd {
    UIButton *btn = [self p_buttonWithTitle:@"add" size:CGSizeMake(50, 30)];
    [self.view addSubview:btn];
    _btnAdd = btn;
    _btnAdd.fhh_x = 10;
    _btnAdd.fhh_y = 350;
    [_btnAdd addTarget:self action:@selector(p_add) forControlEvents:UIControlEventTouchUpInside];
}

- (void)p_configTextViewAdd {
    UITextView *textViewAdd = [self p_textViewWithSize:CGSizeMake(100, 30)];
    [self.view addSubview:textViewAdd];
    _textViewAdd = textViewAdd;
    _textViewAdd.text = @"驯龙高手";
    _textViewAdd.fhh_x = _btnAdd.fhh_right + 10;
    _textViewAdd.fhh_centerY = _btnAdd.fhh_centerY;
}

- (void)p_configBtnAddAtIndex {
    UIButton *btn = [self p_buttonWithTitle:@"addContent" size:CGSizeMake(100, 30)];
    [self.view addSubview:btn];
    _btnAddAtIndex = btn;
    _btnAddAtIndex.fhh_width = 100;
    _btnAddAtIndex.fhh_x = _btnAdd.fhh_x;
    _btnAddAtIndex.fhh_y = _btnAdd.fhh_bottom + 10;
    [_btnAddAtIndex addTarget:self action:@selector(p_addAtIndex) forControlEvents:UIControlEventTouchUpInside];
}

- (void)p_configTextViewAddAtIndexContent {
    UITextView *textViewAddAtIndexContent = [self p_textViewWithSize:CGSizeMake(100, 30)];
    [self.view addSubview:textViewAddAtIndexContent];
    _textViewAddAtIndexContent = textViewAddAtIndexContent;
    _textViewAddAtIndexContent.text = @"Big Hero 6";
    _textViewAddAtIndexContent.fhh_x = _btnAddAtIndex.fhh_right + 10;
    _textViewAddAtIndexContent.fhh_centerY = _btnAddAtIndex.fhh_centerY;
}

- (void)p_configTextViewAddAtIndex {
    UITextView *textViewAddAtIndex = [self p_textViewWithSize:CGSizeMake(50, 30)];
    [self.view addSubview:textViewAddAtIndex];
    _textViewAddAtIndex = textViewAddAtIndex;
    _textViewAddAtIndex.text = @"0";
    _textViewAddAtIndex.fhh_x = _textViewAddAtIndexContent.fhh_right + 10;
    _textViewAddAtIndex.fhh_centerY = _btnAddAtIndex.fhh_centerY;
}

- (void)p_configLabelAddIndexRange {
    UILabel *label = [[UILabel alloc] init];
    [self.view addSubview:label];
    _labelAddIndexRange = label;
    _labelAddIndexRange.fhh_size = CGSizeMake(80, 30);
    _labelAddIndexRange.font = [UIFont systemFontOfSize:12];
    _labelAddIndexRange.textColor = [UIColor blackColor];
    _labelAddIndexRange.fhh_x = _textViewAddAtIndex.fhh_right + 10;
    _labelAddIndexRange.fhh_centerY = _textViewAddAtIndex.fhh_centerY;
}

- (void)p_configBtnRemove {
    UIButton *btnRemove = [self p_buttonWithTitle:@"remove" size:CGSizeMake(50, 30)];
    [self.view addSubview:btnRemove];
    _btnRemove = btnRemove;
    _btnRemove.fhh_x = _btnAddAtIndex.fhh_x;
    _btnRemove.fhh_y = _btnAddAtIndex.fhh_bottom + 10;
    [_btnRemove addTarget:self action:@selector(p_remove) forControlEvents:UIControlEventTouchUpInside];
}

- (void)p_configTextViewRemove {
    UITextView *textViewRemove = [self p_textViewWithSize:CGSizeMake(100, 30)];
    [self.view addSubview:textViewRemove];
    _textViewRemove = textViewRemove;
    _textViewRemove.text = @"头脑特工队";
    _textViewRemove.fhh_x = _btnRemove.fhh_right + 10;
    _textViewRemove.fhh_centerY = _btnRemove.fhh_centerY;
}

- (void)p_configBtnRemoveAtIndex {
    UIButton *btnRemoveAtIndex = [self p_buttonWithTitle:@"removeAtIndex" size:CGSizeMake(100, 30)];
    [self.view addSubview:btnRemoveAtIndex];
    _btnRemoveAtIndex = btnRemoveAtIndex;
    _btnRemoveAtIndex.fhh_x = _btnRemove.fhh_x;
    _btnRemoveAtIndex.fhh_y = _btnRemove.fhh_bottom + 10;
    [_btnRemoveAtIndex addTarget:self action:@selector(p_removeAtIndex) forControlEvents:UIControlEventTouchUpInside];
}

- (void)p_configTextViewRemoveAtIndex {
    UITextView *textViewRemoveAtIndex = [self p_textViewWithSize:CGSizeMake(50, 30)];
    textViewRemoveAtIndex.text = @"0";
    [self.view addSubview:textViewRemoveAtIndex];
    _textViewRemoveAtIndex = textViewRemoveAtIndex;
    _textViewRemoveAtIndex.fhh_x = _btnRemoveAtIndex.fhh_right + 10;
    _textViewRemoveAtIndex.fhh_centerY = _btnRemoveAtIndex.fhh_centerY;
}

- (void)p_updateLabelRange {
    NSString *rangeText = @"range:";
    if (_tagView.tagArray.count > 0) {
        rangeText = [NSString stringWithFormat:@"rang:0-%ld",_tagView.tagArray.count - 1];
    }
    _labelAddIndexRange.text = rangeText;
    _labelRemoveRange.text = rangeText;
}

- (void)p_configLabelRemoveRange {
    UILabel *label = [[UILabel alloc] init];
    [self.view addSubview:label];
    _labelRemoveRange = label;
    label.fhh_size = CGSizeMake(80, 30);
    label.font = [UIFont systemFontOfSize:12];
    label.textColor = [UIColor blackColor];
    _labelRemoveRange.fhh_x = _textViewRemoveAtIndex.fhh_right + 10;
    _labelRemoveRange.fhh_centerY = _btnRemoveAtIndex.fhh_centerY;
}

- (void)p_configBtnRemoveAll {
    UIButton *btnRemoveAll = [self p_buttonWithTitle:@"removeAll" size:CGSizeMake(100, 30)];
    [self.view addSubview:btnRemoveAll];
    _btnRemoveAll = btnRemoveAll;
    _btnRemoveAll.fhh_x = _btnRemoveAtIndex.fhh_x;
    _btnRemoveAll.fhh_y = _btnRemoveAtIndex.fhh_bottom + 10;
    [_btnRemoveAll addTarget:self action:@selector(p_removeAll) forControlEvents:UIControlEventTouchUpInside];
}

- (void)p_configBtnShowInfo {
    UIButton *btnShowInfo = [self p_buttonWithTitle:@"showInfoInXcodeConsole" size:CGSizeMake(150, 30)];
    [self.view addSubview:btnShowInfo];
    _btnShowInfo = btnShowInfo;
    _btnShowInfo.fhh_x = _btnRemoveAll.fhh_x;
    _btnShowInfo.fhh_y = _btnRemoveAll.fhh_bottom + 10;
    [_btnShowInfo addTarget:self action:@selector(p_showInfoInXcodeConsole) forControlEvents:UIControlEventTouchUpInside];
}

- (void)p_configBtnDismiss {
    UIButton *btnDimiss = [self p_buttonWithTitle:@"dismiss" size:CGSizeMake(50, 30)];
    [self.view addSubview:btnDimiss];
    _btnDismiss = btnDimiss;
    _btnDismiss.fhh_x = _btnShowInfo.fhh_x;
    _btnDismiss.fhh_y = _btnShowInfo.fhh_bottom + 10;
    [_btnDismiss addTarget:self action:@selector(p_dismiss) forControlEvents:UIControlEventTouchUpInside];
}

- (UIButton *)p_buttonWithTitle:(NSString *)title size:(CGSize)size {
    UIButton *button = [[UIButton alloc] init];
    button.fhh_size = size;
    button.layer.cornerRadius = 5.0;
    button.titleLabel.font = [UIFont systemFontOfSize:12];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateHighlighted];
    button.layer.borderColor = [[UIColor blackColor] CGColor];
    button.layer.borderWidth = 1.5;
    [button setTitle:title forState:UIControlStateNormal];    
    [self.view addSubview:button];
    return button;
}

- (UITextView *)p_textViewWithSize:(CGSize)size {
    UITextView *textView = [[UITextView alloc] init];
    textView.layer.borderWidth = 1;
    textView.layer.borderColor = [[UIColor grayColor] CGColor];
    textView.fhh_size = size;
    textView.layer.cornerRadius = 5.0;
    return textView;
}

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

#pragma mark - HandleEvents
- (void)p_add {
    NSString *title = _textViewAdd.text;
    if (title == nil || [title isEqualToString:@""]) {
        return;
    }
    FHHTag *tag = [self p_tagWithTitle:title];
    [_tagView addTag:tag];
    [self p_updateLabelRange];
}

- (void)p_addAtIndex {
    NSInteger index = [self p_indexFromTextViewText:_textViewAddAtIndex.text];
    NSString *insertTagTitle = _textViewAddAtIndexContent.text;
    FHHTag *tag = [self p_tagWithTitle:insertTagTitle];
    [_tagView insertTag:tag atIndex:index];
    [self p_updateLabelRange];
}

- (void)p_remove {
    NSString *text = _textViewRemove.text;
    for (FHHTag *tag in _tagView.tagArray) {
        if ([tag.title isEqualToString:text]) {
            [_tagView removeTag:tag];
            break;
        }
    }
    [self p_updateLabelRange];
}

- (void)p_removeAtIndex {
    NSInteger index = [self p_indexFromTextViewText:_textViewRemoveAtIndex.text];
    [_tagView removeTagAtIndex:index];
    [self p_updateLabelRange];
}

- (NSInteger)p_indexFromTextViewText:(NSString *)text {
    NSInteger index = 0;
    if (text != nil || ![text isEqualToString:@""]) {
        index = [text integerValue];
    }
    return index;
}

- (void)p_removeAll {
    [_tagView removeAllTags];
    [self p_updateLabelRange];
}

- (void)p_showInfoInXcodeConsole {
    NSLog(@"selectedTitleArray:");
    NSArray *selectedTagArray = _tagView.selectedTagArray;
    for (FHHTag *tag in selectedTagArray) {
        NSLog(@"%@  ",tag.title);
    }
    
    CGFloat heightFromObjectFun = [_tagView heightForTagView];
    CGFloat heightFromClassFun = [FHHTagView heightForTagViewWithTagArray:_tagView.tagArray layout:_tagViewLayout];
    NSLog(@"FHHTagView - heightForTagView:  %lf",heightFromObjectFun);
    NSLog(@"FHHTagView + heightForTagViewWithTagArray:layout:  %lf",heightFromClassFun);
}

- (void)p_dismiss {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
