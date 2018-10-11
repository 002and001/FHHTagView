//
//  FHHTagViewLayout.m
//  FHHTagView
//
//  Created by 002 on 2018/10/8.
//  Copyright © 2018年 002. All rights reserved.
//

#import "FHHTagViewLayout.h"

@implementation FHHTagViewLayout

- (instancetype)init {
    if (self = [super init]) {
        _width = 50.0;
        _padding = UIEdgeInsetsZero;
        _lineSpacing = 10.0;
        _innerItemSpacing = 10.0;
    }
    return self;
}

- (void)dealloc {
    NSLog(@"FHHTagViewLayout - delloc");
}

@end
