//
//  FHHTagView.h
//  FHHTagView
//
//  Created by 002 on 2018/10/8.
//  Copyright © 2018年 002. All rights reserved.
//
//  https://github.com/002and001/FHHTagView

#import <UIKit/UIKit.h>
#import "FHHTagViewLayout.h"
#import "FHHTagButton.h"
#import "FHHTag.h"

typedef NS_ENUM(NSInteger, FHHTagViewSelectionStyle) {
    FHHTagViewSelectionStyleNone,   // disable select button
    FHHTagViewSelectionStyleSingle, // enable select one button
    FHHTagViewSelectionStyleMutiple // enable select more than one button
};

NS_ASSUME_NONNULL_BEGIN

@interface FHHTagView : UIView

@property (nonatomic, assign) FHHTagViewSelectionStyle selectionStyle;
@property (nonatomic, strong, readonly) NSMutableArray *tagArray;
@property (nonatomic, strong, readonly) NSMutableArray *selectedTagArray;

- (void)refreshWithTagArray:(nonnull NSArray *)tagArray layout:(nonnull FHHTagViewLayout *)layout;

- (void)addTag:(nonnull FHHTag *)tag;
- (void)insertTag:(nonnull FHHTag *)tag atIndex:(NSUInteger)index;
- (void)removeTag:(nonnull FHHTag *)tag;
- (void)removeTagAtIndex:(NSUInteger)index;
- (void)removeAllTags;

- (CGFloat)heightForTagView;
+ (CGFloat)heightForTagViewWithTagArray:(nonnull NSArray *)tagArray layout:(nonnull FHHTagViewLayout *)layout;

@end

NS_ASSUME_NONNULL_END
