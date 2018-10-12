//
//  FHHTagButton.m
//  FHHTagView
//
//  Created by 002 on 2018/10/8.
//  Copyright © 2018年 002. All rights reserved.
//

#import "FHHTagButton.h"
#import "FHHTag.h"
#import "NSString+FHHSize.h"
#import "UIView+FHHFrame.h"

@interface FHHTagButton ()

@property (nonatomic, assign) CGFloat maxWidth;

@end

@implementation FHHTagButton

#pragma mark - Init
- (instancetype)initWithTag:(FHHTag *)tag maxWidth:(CGFloat)maxWidth {
    if (self = [super init]) {
        _fhhTag = tag;
        _maxWidth = maxWidth;
        self.userInteractionEnabled = tag.enable;
        [self p_configUIWithTag:tag];
    }
    return self;
}

#pragma mark - Functions
+ (CGSize)sizeWithTag:(FHHTag *)tag maxWidth:(CGFloat)maxWidth {
    CGSize titleSize = [NSString sizeForString:tag.title fontSize:tag.fontSize maxSize:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
    CGFloat width = titleSize.width + tag.padding.left + tag.padding.right;
    CGFloat height = 66 * 0.5;
    if (tag.buttonHeight > 0) {
        height = tag.buttonHeight;
    } else {
        height = [NSString heightForString:@" "
                                  fontSize:tag.fontSize
                                     width:width] + tag.padding.top + tag.padding.bottom;
    }
    if (width > maxWidth) {
        width = maxWidth;
    }
    return CGSizeMake(width, height);
}

#pragma mark - HandleViews
- (void)p_configUIWithTag:(FHHTag *)tag {
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    if ([self p_neitherNilOrEmpty:tag.title]) {
        [self setTitle:tag.title forState:UIControlStateNormal];
    }
    if (tag.cornerRadius > 0) {
        self.layer.cornerRadius = tag.cornerRadius;
        self.clipsToBounds = YES;
    }
    if (tag.fontSize > 0) {
        self.titleLabel.font = [UIFont systemFontOfSize:tag.fontSize];
    }
    if (UIEdgeInsetsEqualToEdgeInsets(tag.padding, UIEdgeInsetsZero) == false) {
        self.contentEdgeInsets = tag.padding;
    }
    [self setTitleColor:tag.titleColor forState:UIControlStateNormal];
    self.layer.borderColor = [tag.borderColor CGColor];
    self.layer.borderWidth = tag.borderWidth;    
    [self p_configSelfSizeWithTag:tag];
}

- (void)p_configSelfSizeWithTag:(FHHTag *)tag {
    CGSize buttonSize = [FHHTagButton sizeWithTag:tag maxWidth:_maxWidth];
    self.fhh_size = buttonSize;
}

#pragma mark - Functions
- (BOOL)p_neitherNilOrEmpty:(NSString *)text {
    if (text != nil && ![text isEqualToString:@""]) {
        return YES;
    }
    return NO;
}

@end
