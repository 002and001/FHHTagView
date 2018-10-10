//
//  FHHTagView.m
//  FHHTagView
//
//  Created by 002 on 2018/10/8.
//  Copyright © 2018年 002. All rights reserved.
//

#import "FHHTagView.h"
#import "NSString+FHHSize.h"
#import "UIView+FHHFrame.h"

@interface FHHTagView ()

@property (nonatomic, strong) NSMutableArray<FHHTagButton *> *buttonArray;
@property (nonatomic, strong) NSMutableArray<FHHTagButton *> *selectedButtonArray;
@property (nonatomic, strong) FHHTagButton *lastLayoutButton;
@property (nonatomic, strong) FHHTagViewLayout *layout;

@end

@implementation FHHTagView

- (void)dealloc {
    NSLog(@"FHHTagView - delloc");
}

- (void)refreshWithTagArray:(NSArray *)tagArray layout:(nonnull FHHTagViewLayout *)layout {
    self.fhh_width = layout.width;
    _layout = layout;
    _tagArray = [NSMutableArray arrayWithArray:tagArray];
    _buttonArray = [NSMutableArray arrayWithCapacity:tagArray.count];
    _selectedButtonArray = [NSMutableArray arrayWithCapacity:tagArray.count];
    [self p_layoutButtonsWithTagArray:_tagArray];
}

- (void)addTag:(nonnull FHHTag *)tag {
    // check if the tag is existed
    for (FHHTag *existedTag in _tagArray) {
        if (existedTag == tag) {
            break;
            return;
        }
    }
    FHHTagButton *insertedButton = [[FHHTagButton alloc] initWithTag:tag maxWidth:_layout.width];
    [self addSubview:insertedButton];
    [_tagArray addObject:tag];
    [_buttonArray addObject:insertedButton];
    [self p_reLayoutButtonsFromBeginIndex:_tagArray.count - 1];
    if (self.fhh_height != _lastLayoutButton.fhh_bottom + _layout.padding.bottom) {
        self.fhh_height = _lastLayoutButton.fhh_bottom + _layout.padding.bottom;
    }
}

- (void)insertTag:(nonnull FHHTag *)tag atIndex:(NSUInteger)index {
    NSParameterAssert(index < _tagArray.count);
    if (index > _tagArray.count) {
        return;
    }
    FHHTagButton *insertedButton = [[FHHTagButton alloc] initWithTag:tag maxWidth:_layout.width];
    [self addSubview:insertedButton];
    if (tag.normalStateButtonBlock != nil) {
        tag.normalStateButtonBlock(insertedButton);
    }
    [_tagArray insertObject:tag atIndex:index];
    [_buttonArray insertObject:insertedButton atIndex:index];
    NSInteger lastLayoutButtonIndex = index - 1;
    if (lastLayoutButtonIndex >= 0) {
        _lastLayoutButton = _buttonArray[lastLayoutButtonIndex];
    } else {
        _lastLayoutButton = nil;
    }
    [self p_reLayoutButtonsFromBeginIndex:index];
    if (self.fhh_height != _lastLayoutButton.fhh_bottom + _layout.padding.bottom) {
        self.fhh_height = _lastLayoutButton.fhh_bottom + _layout.padding.bottom;
    }
}

- (void)removeTag:(nonnull FHHTag *)tag {
    for (NSUInteger i = 0; i < _tagArray.count; ++i) {
        if (tag == _tagArray[i]) {
            [self removeTagAtIndex:i];
            break;
        }
    }
}

- (void)removeTagAtIndex:(NSUInteger)index {
    NSParameterAssert(index < _tagArray.count);
    if (index >= _tagArray.count || _tagArray.count == 0) {
        return;
    }
    for (UIView *view in self.subviews) {
        if (view == _buttonArray[index]) {
            [view removeFromSuperview];
            [_tagArray removeObjectAtIndex:index];
            [_buttonArray removeObjectAtIndex:index];
            NSLog(@"delete view:%@",view);
            break;
        }
    }
    if (_buttonArray.count == 0) {
        self.fhh_height = 0;
        return;
    }
    NSInteger lastLayoutButtonIndex = index - 1;
    if (lastLayoutButtonIndex >= 0) {
        _lastLayoutButton = _buttonArray[lastLayoutButtonIndex];
    } else {
        _lastLayoutButton = nil;
    }
    [self p_reLayoutButtonsFromBeginIndex:index];
    if (self.fhh_height != _lastLayoutButton.fhh_bottom + _layout.padding.bottom) {
        self.fhh_height = _lastLayoutButton.fhh_bottom + _layout.padding.bottom;
    }
}

- (void)p_reLayoutButtonsFromBeginIndex:(NSInteger)index {
    NSInteger count = _buttonArray.count;
    for (NSInteger i = index; i < count; ++i) {
        FHHTagButton *button = _buttonArray[i];
        if (_lastLayoutButton == nil || i == 0) {
            button.fhh_x = _layout.padding.left;
            button.fhh_y = _layout.padding.top;
            _lastLayoutButton = button;
            self.fhh_height = button.fhh_bottom;
            continue;
        }
        [self p_reLayoutButtonIfNeeded:button];
        _lastLayoutButton = button;
    }
}

- (void)removeAllTags {
    for (UIView *view in self.subviews) {
        if ([view isKindOfClass:[FHHTagButton class]]) {
            [view removeFromSuperview];
        }
    }
    [_buttonArray removeAllObjects];
    [_selectedButtonArray removeAllObjects];
    [_tagArray removeAllObjects];
    self.fhh_size = CGSizeMake(_layout.width, 0);
}

- (CGFloat)heightForTagView {
    return self.fhh_height;
}

+ (CGFloat)heightForTagViewWithTagArray:(nonnull NSArray *)tagArray layout:(nonnull FHHTagViewLayout *)layout {
    CGFloat height = 0;
    CGFloat lastButtonRight = 0;
    CGFloat lastButtonBottom = 0;
    CGFloat currentButtonRight = 0;
    CGFloat currentButtonBottom = 0;
    for (NSInteger i = 0 ; i < tagArray.count; ++i) {
        FHHTag *tag = tagArray[i];
        CGSize buttonSize = [FHHTagButton sizeWithTag:tag maxWidth:layout.width];
        if (i == 0) {
            currentButtonRight = layout.padding.left + buttonSize.width;
            currentButtonBottom = layout.padding.top + buttonSize.height;
        } else {
            currentButtonRight = lastButtonRight + buttonSize.width + layout.innerItemSpacing;
            if (currentButtonRight > (layout.width - layout.padding.right)) {
                currentButtonRight = layout.padding.left + buttonSize.width;
                currentButtonBottom = lastButtonBottom + layout.lineSpacing + buttonSize.height;
            } else {
                currentButtonRight = lastButtonRight + layout.innerItemSpacing + buttonSize.width;
                currentButtonBottom = lastButtonBottom;
            }
        }
//        NSLog(@"currentButtonRight:%lf,currentButtonBottom:%lf",currentButtonRight, currentButtonBottom);
        lastButtonBottom = currentButtonBottom;
        lastButtonRight = currentButtonRight;
    }
    height = lastButtonBottom + layout.padding.bottom;
    return height;
}

#pragma mark - HandleView
- (void)p_removeAllSubviews {
    for (UIView *view in self.subviews) {
        [view removeFromSuperview];
    }
    self.lastLayoutButton = nil;
}

- (void)p_layoutButtonsWithTagArray:(NSArray *)tagArray {
    for (NSInteger i = 0 ; i < tagArray.count; ++i) {
        FHHTag *tag = tagArray[i];
        FHHTagButton *button = [[FHHTagButton alloc] initWithTag:tag maxWidth:self.fhh_width];
        [_buttonArray addObject:button];
        if (tag.enable) {
            [button addTarget:self action:@selector(p_buttonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        }
        [self addSubview:button];
    
        if (_lastLayoutButton == nil) {
            button.fhh_x = _layout.padding.left;
            button.fhh_y = _layout.padding.top;
            _lastLayoutButton = button;
            self.fhh_height = button.fhh_bottom;
            if (tag.normalStateButtonBlock != nil) {
                tag.normalStateButtonBlock(button);
            }
            continue;
        }
        [self p_reLayoutButtonIfNeeded:button];
        _lastLayoutButton = button;
        if (tag.normalStateButtonBlock != nil) {
            tag.normalStateButtonBlock(button);
        }
    }
    self.fhh_height = _lastLayoutButton.fhh_bottom + _layout.padding.bottom;
}

- (void)p_reLayoutButtonIfNeeded:(FHHTagButton *)button  {
    CGFloat buttonRight = self.lastLayoutButton.fhh_right + _layout.innerItemSpacing + button.fhh_width;
    if (buttonRight > (self.fhh_width - _layout.padding.right)) {
        button.fhh_y = self.lastLayoutButton.fhh_bottom + _layout.lineSpacing;
        button.fhh_x = _layout.padding.left;
    } else {
        button.fhh_bottom = self.lastLayoutButton.fhh_bottom;
        button.fhh_x = self.lastLayoutButton.fhh_right + _layout.innerItemSpacing;
    }
    NSLog(@"button:%@",button);
}

#pragma mark - HandleEvents
- (void)p_buttonDidClick:(FHHTagButton *)button {
    if (_selectionStyle == FHHTagViewSelectionStyleNone) {
        // do nothing
    } else if (_selectionStyle == FHHTagViewSelectionStyleSingle) {
        if (_selectedButtonArray.count != 0 && _selectedButtonArray[0] != button) { // there is a selected button,then selected anthoer button
            _selectedButtonArray[0].fhhTag.normalStateButtonBlock(_selectedButtonArray[0]);
            button.fhhTag.selectedStateButtonBlcok(button);
            _selectedButtonArray[0] = button;
        } else if (_selectedButtonArray.count != 0 && _selectedButtonArray[0] == button) { // the selected button is selected again
            _selectedButtonArray[0].fhhTag.normalStateButtonBlock(_selectedButtonArray[0]);
            [_selectedButtonArray removeObject:_selectedButtonArray[0]];
        } else {    // not a button is selected
            button.fhhTag.selectedStateButtonBlcok(button);
            _selectedButtonArray[0] = button;
        }
    } else if (_selectionStyle == FHHTagViewSelectionStyleMutiple) {
        BOOL isSelectedBefore = NO;
        for(FHHTagButton *selectedButton in _selectedButtonArray) {
            if (selectedButton == button) {
                selectedButton.fhhTag.normalStateButtonBlock(selectedButton);
                [_selectedButtonArray removeObject:button];
                isSelectedBefore = YES;
                break;
            }
        }
        if (isSelectedBefore == NO) {
            button.fhhTag.selectedStateButtonBlcok(button);
            [_selectedButtonArray addObject:button];
        }
    }
    [self selectedTagArray];
}

#pragma mark - Setter
- (void)setSelectionStyle:(FHHTagViewSelectionStyle)selectionStyle {
    if (_selectionStyle != selectionStyle) {
        _selectionStyle = selectionStyle;
        [self removeAllTags];
        [self p_layoutButtonsWithTagArray:_tagArray];
    }
}

#pragma mark - getter
- (NSMutableArray *)selectedTagArray {
    NSMutableArray *selectedTagArray = [NSMutableArray arrayWithCapacity:_selectedButtonArray.count];
    for (FHHTagButton *button in _selectedButtonArray) {
        [selectedTagArray addObject:button.fhhTag];
    }
    return selectedTagArray;
}

@end
