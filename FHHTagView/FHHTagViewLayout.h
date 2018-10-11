//
//  FHHTagViewLayout.h
//  FHHTagView
//
//  Created by 002 on 2018/10/8.
//  Copyright © 2018年 002. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FHHTagViewLayout : NSObject

/**
 the width of FHHTagView,it must be set greate than 0.The default value of this property is 50.0.
 */
@property (nonatomic, assign) CGFloat width;

/**
 the FHHTagView's content insert,The default value of this property is UIEdgeInsetsZero.
 */
@property (nonatomic, assign) UIEdgeInsets padding;

/**
 The spacing to use between lines of tags in the tagView.The default value of this property is 10.0.
 */
@property (nonatomic, assign) CGFloat lineSpacing;

/**
 The spacing to use between tags in the same row.The default value of this property is 10.0.
 */
@property (nonatomic, assign) CGFloat innerItemSpacing;

@end

NS_ASSUME_NONNULL_END
