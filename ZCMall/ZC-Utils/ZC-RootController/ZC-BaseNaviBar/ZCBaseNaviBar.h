//
//  MKBaseNaviBar.h
//  MK
//
//  Created by 果子 on 16/6/14.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCBaseNaviBar : UIView

/** 内容视图 */
@property (nonatomic, retain) UIView        *contentView;
/** 左侧按钮 */
@property (nonatomic, retain) UIButton      *leftItemBtn;
/** 中间按钮 */
@property (nonatomic, retain) UIButton      *centerItemBtn;
/** 右侧按钮 */
@property (nonatomic, retain) UIButton      *rightItemBtn;

/** 配置左侧按钮 */
- (void)leftBtnSetTitle:(NSString *)title forState:(UIControlState)state;
- (void)leftBtnSetImage:(UIImage *)image forState:(UIControlState)state;
- (void)leftBtnAddTarget:(id)target selector:(SEL)selector;

/** 配置中间按钮 */
- (void)centerBtnSetTitle:(NSString *)title forState:(UIControlState)state;
- (void)centerBtnSetImage:(UIImage *)image forState:(UIControlState)state;
- (void)centerBtnAddTarget:(id)target selector:(SEL)selector;

/** 配置右侧按钮 */
- (void)rightBtnSetTitle:(NSString *)title forState:(UIControlState)state;
- (void)rightBtnSetImage:(UIImage *)image forState:(UIControlState)state;
- (void)rightBtnAddTarget:(id)target selector:(SEL)selector;
/** 右侧按钮为文字 且 圆角 */
- (void)rightBtnSetRoundViewWithTitle:(NSString *)title forState:(UIControlState)state;


/** 改变导航条的颜色 */
- (void)changeHeaderVisibleColor:(UIColor *)visibleColor;


/** 改变导航条标题的颜色 */
- (void)changeTitleColor:(UIColor *)color;
@end
