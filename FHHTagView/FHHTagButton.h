//
//  FHHTagButton.h
//  FHHTagView
//
//  Created by 002 on 2018/10/8.
//  Copyright © 2018年 002. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FHHTag;

NS_ASSUME_NONNULL_BEGIN

@interface FHHTagButton : UIButton

@property (nonatomic, strong) FHHTag *fhhTag;

- (instancetype)initWithTag:(FHHTag *)tag;
- (instancetype)initWithTag:(FHHTag *)tag maxWidth:(CGFloat)maxWidth;
- (void)refreshWithTag:(FHHTag *)tag maxWidth:(CGFloat)maxWidth;
+ (CGSize)sizeWithTag:(FHHTag *)tag maxWidth:(CGFloat)maxWidth;

@end

NS_ASSUME_NONNULL_END
