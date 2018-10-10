//
//  NSString+FHHSize.m
//  FHHTagView
//
//  Created by 002 on 2018/10/8.
//  Copyright © 2018年 002. All rights reserved.
//

#import "NSString+FHHSize.h"

@implementation NSString (FHHSize)

+ (CGSize)sizeForString:(NSString *)value
               fontSize:(CGFloat)fontSize
                maxSize:(CGSize)maxSize {
  if (value.length == 0 || fontSize == 0 || maxSize.width <= 0 || maxSize.height <= 0) {
    return CGSizeZero;
  }
  CGSize resultSize = [value boundingRectWithSize:maxSize
                                          options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)
                                       attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}
                                          context:nil].size;
  return resultSize;
}

+ (CGFloat)heightForString:(NSString *)value
                  fontSize:(CGFloat)fontSize
                     width:(CGFloat)width {
  if (value == nil) {
    return 0;
  }
  NSRange allRange = [value rangeOfString:value];
  NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:value];
  [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:fontSize] range:allRange];
  CGRect rect = [value boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX)
                                    options:NSStringDrawingUsesLineFragmentOrigin
                                 attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:fontSize]}
                                    context:nil];
  return rect.size.height;
}

@end
