//
//  FHHTag.h
//  FHHTagView
//
//  Created by 002 on 2018/10/8.
//  Copyright © 2018年 002. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class FHHTagButton;
@class FHHTag;

typedef void(^NormalStateButtonBlcok)(FHHTagButton *button);
typedef void(^SelectedStateButtonBlcok)(FHHTagButton *button);

NS_ASSUME_NONNULL_BEGIN

@interface FHHTag : NSObject

@property (nonatomic, copy) NSString *tagID;
// button‘s title in normal state
@property (nonatomic, copy) NSString *title;
// button's contentEdgeInsets
@property (nonatomic, assign) UIEdgeInsets padding;
// if you set the property, the button's height won't be adjusted by button's content and padding
@property (nonatomic, assign) CGFloat buttonHeight;
// fontSize at normalState,default is 15
@property (nonatomic, assign) CGFloat fontSize;
// cornerRadius at normalState,default is 1.5
@property (nonatomic, assign) CGFloat cornerRadius;
// titleColor at normalState, default is blackColor
@property (nonatomic, strong) UIColor *titleColor;
// borderColor at normalState, default is blackColor
@property (nonatomic, strong) UIColor *borderColor;
// borderWidth at normalState
@property (nonatomic, assign) CGFloat borderWidth;
// custom your button style at UIControlStateNormal
@property (nonatomic, copy) NormalStateButtonBlcok normalStateButtonBlock;
// custom your button style when you selected the button
@property (nonatomic, copy) SelectedStateButtonBlcok selectedStateButtonBlcok;
// wheather button is useterinterface
@property (nonatomic, assign) BOOL enable;

- (nonnull instancetype)initWithTitle:(nonnull NSString *)title;

//- (nonnull instancetype)initWithTitle:(nonnull NSString *)title
//               normalStateButtonBlcok:(nonnull NormalStateButtonBlcok)normalStateButtonBlcok
//               selectedStateButtonBlcok:(nonnull SelectedStateButtonBlcok)selectedStateButtonBlcok;


@end

NS_ASSUME_NONNULL_END
