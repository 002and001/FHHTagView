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

/**
 refresh the view with tag and layout.

 @param tagArray the tagArray mapping to the tagButtonArray shown in the view
 @param layout The layout you specified to configure tagView layout's style
 */
- (void)refreshWithTagArray:(nonnull NSArray *)tagArray layout:(nonnull FHHTagViewLayout *)layout;

/**
 Return An NSArray Which contains All FHHTagButtons Frame for calcu lating All buttons layout In advance.
 
 @param tagArray the tagArray mapping to the tagButtonArray shown in the view
 @param layout The layout you specified to configure tagView layout's style
 @return Return An NSArray Which contains All FHHTagButtons Frame
 */
+ (NSArray <NSString *> *)tagRectArrayWithTagArray:(nonnull NSArray *)tagArray layout:(nonnull FHHTagViewLayout *)layout;

/**
 Refresh the view with tag 、tagRectStrArray and layout.
 The tagRectStrArray can be return by func tagRectArrayWithTagArray:layout:
 
 @param tagArray the tagArray mapping to the tagButtonArray shown in the view
 @param tagRectStrArray An NSArray Which contains All FHHTagButtons Frame
 @param layout layout The layout you specified to configure tagView layout's style
 */
- (void)refreshWithTagArray:(nonnull NSArray *)tagArray tagRectStrArray:(nonnull NSArray<NSString *> *)tagRectStrArray layout:(nonnull FHHTagViewLayout *)layout;

/**
 Inserts a given tag at the end of the array.

 @param tag The tag to add to the end of the tagArray’s content. This value must not be nil.
 */
- (void)addTag:(nonnull FHHTag *)tag;

/**

 Inserts a given tag into the tagArray’s contents at a given index.

 @param tag The tag to add to the tagArray's content. This value must not be nil.
 @param index The index in the tagArray at which to insert anObject. This value must not be greater than the count of elements in the array.
 */
- (void)insertTag:(nonnull FHHTag *)tag atIndex:(NSUInteger)index;

/**
 Removes all occurrences in the tagArray of a given tag.
 
 @param tag The tag to remove from the tagArray.
 */
- (void)removeTag:(nonnull FHHTag *)tag;

/**
 Removes the tag at index

 @param index The index from which to remove the tag in the tagArray. The value must not exceed the bounds of the array.
 */
- (void)removeTagAtIndex:(NSUInteger)index;

/**
 Removes all occurrences tag in the tagArray.
 */
- (void)removeAllTags;

- (CGFloat)heightForTagView;
+ (CGFloat)heightForTagViewWithTagArray:(nonnull NSArray *)tagArray layout:(nonnull FHHTagViewLayout *)layout;

@end

NS_ASSUME_NONNULL_END
