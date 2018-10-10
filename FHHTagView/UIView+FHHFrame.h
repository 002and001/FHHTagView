//
//  UIView+FHHFrame.h
//  FHHTagView
//
//  Created by 002 on 2018/10/8.
//  Copyright © 2018年 002. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (FHHFrame)

@property (nonatomic, assign) CGFloat fhh_x;
@property (nonatomic, assign) CGFloat fhh_y;
@property (nonatomic, assign) CGFloat fhh_right;
@property (nonatomic, assign) CGFloat fhh_bottom;
@property (nonatomic, assign) CGFloat fhh_centerX;
@property (nonatomic, assign) CGFloat fhh_centerY;
@property (nonatomic, assign) CGFloat fhh_width;
@property (nonatomic, assign) CGFloat fhh_height;
@property (nonatomic, assign) CGPoint fhh_origin;
@property (nonatomic, assign) CGSize fhh_size;

@end

NS_ASSUME_NONNULL_END
