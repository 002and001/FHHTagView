//
//  FHHTag.m
//  FHHTagView
//
//  Created by 002 on 2018/10/8.
//  Copyright © 2018年 002. All rights reserved.
//

#import "FHHTag.h"

@interface FHHTag ()

@end

@implementation FHHTag

#pragma mark - Init
- (nonnull instancetype)initWithTitle:(nonnull NSString *)title {
    if (self = [super init]) {
        NSParameterAssert(![title isEqualToString:@""] && title != nil);
        _title = title;
        [self p_configOwnProperties];
    }
    return self;
}

- (void)p_configOwnProperties {
    _borderColor = [UIColor blackColor];
    _titleColor = [UIColor blackColor];
    _cornerRadius = 3;
    _borderWidth = 1.5;
    _fontSize = 15;
}

@end
