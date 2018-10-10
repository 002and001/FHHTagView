//
//  UIView+FHHFrame.m
//  FHHTagView
//
//  Created by 002 on 2018/10/8.
//  Copyright © 2018年 002. All rights reserved.
//

#import "UIView+FHHFrame.h"

@implementation UIView (FHHFrame)

#pragma mark - Setter
- (void)setFhh_x:(CGFloat)fhh_x {
    CGRect frame = self.frame;
    frame.origin.x = fhh_x;
    self.frame = frame;
}

- (void)setFhh_y:(CGFloat)fhh_y {
  CGRect frame = self.frame;
  frame.origin.y = fhh_y;
  self.frame = frame;
}

- (void)setFhh_right:(CGFloat)fhh_right {
  self.frame = CGRectMake(fhh_right - self.frame.size.width, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void)setFhh_bottom:(CGFloat)fhh_bottom {
  self.frame = CGRectMake(self.frame.origin.x, fhh_bottom - self.frame.size.height, self.frame.size.width, self.frame.size.height);
}

- (void)setFhh_centerX:(CGFloat)fhh_centerX {
  CGPoint center = self.center;
  center.x = fhh_centerX;
  self.center = center;
}

- (void)setFhh_centerY:(CGFloat)fhh_centerY {
  CGPoint center = self.center;
  center.y = fhh_centerY;
  self.center = center;
}

- (void)setFhh_width:(CGFloat)fhh_width {
  CGRect frame = self.frame;
  frame.size.width = fhh_width;
  self.frame = frame;
}

- (void)setFhh_height:(CGFloat)fhh_height {
  CGRect frame = self.frame;
  frame.size.height = fhh_height;
  self.frame = frame;
}

- (void)setFhh_origin:(CGPoint)fhh_origin {
  CGRect frame = self.frame;
  frame.origin = fhh_origin;
  self.frame = frame;
}

- (void)setFhh_size:(CGSize)fhh_size {
  CGRect tempFrame = self.frame;
  tempFrame.size = fhh_size;
  self.frame = tempFrame;
}

#pragma mark - Getter
- (CGFloat)fhh_x {
  return self.frame.origin.x;
}

- (CGFloat)fhh_y {
  return self.frame.origin.y;
}

- (CGFloat)fhh_width {
  return self.frame.size.width;
}

- (CGFloat)fhh_height {
  return self.frame.size.height;
}

- (CGSize)fhh_size {
  return self.frame.size;
}

- (CGPoint)fhh_origin {
  return self.frame.origin;
}

- (CGFloat)fhh_centerX {
  return self.center.x;
}

- (CGFloat)fhh_centerY {
  return self.center.y;
}

- (CGFloat)fhh_bottom {
  return self.frame.origin.y + self.frame.size.height;
}

- (CGFloat)fhh_right {
  return self.frame.origin.x + self.frame.size.width;
}

@end
