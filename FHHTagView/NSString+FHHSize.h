//
//  NSString+FHHSize.h
//  FHHTagView
//
//  Created by 002 on 2018/10/8.
//  Copyright © 2018年 002. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (FHHSize)

+ (CGSize)sizeForString:(NSString *)value
               fontSize:(CGFloat)fontSize
                maxSize:(CGSize)maxSize;

+ (CGFloat)heightForString:(NSString *)value
                  fontSize:(CGFloat)fontSize
                     width:(CGFloat)width;

@end

NS_ASSUME_NONNULL_END
