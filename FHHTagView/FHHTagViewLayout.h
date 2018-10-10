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

// 指定FHHTagView的宽度
@property (nonatomic, assign) CGFloat width;
@property (nonatomic, assign) UIEdgeInsets padding;
@property (nonatomic, assign) CGFloat lineSpacing;
@property (nonatomic, assign) CGFloat innerItemSpacing;

@end

NS_ASSUME_NONNULL_END
