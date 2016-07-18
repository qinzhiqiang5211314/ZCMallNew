//
//  MKBaseNaviBar.m
//  MK
//
//  Created by 果子 on 16/6/14.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCBaseNaviBar.h"

/** 状态栏的高度 */
static const CGFloat stateH = 20.0f;
/** 按钮的宽度 */
static const CGFloat btnW = 44.0f;

@interface ZCBaseNaviBar ()

@end

@implementation ZCBaseNaviBar

- (instancetype)init
{
    if (self = [super init]) {
       self = [self initWithFrame:CGRectZero];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    CGRect rect = CGRectMake(0, 0, APPSIZE.width, 64);
    if (self = [super initWithFrame:rect]) {
        [self p_setupSubviews];
    }
    return self;
}

- (void)p_setupSubviews
{
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, stateH, self.bounds.size.width, self.height - stateH)];
    [self.contentView setBackgroundColor:[UIColor clearColor]];
    [self addSubview:self.contentView];
    
    /** 中心按钮 */
    self.centerItemBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.centerItemBtn setFrame:CGRectMake(btnW, 0, (self.frame.size.width-2*btnW), btnW)];
    self.centerItemBtn.hidden = YES;
    self.centerItemBtn.titleLabel.font = DEFAULT_FONT(18.0f);
    self.centerItemBtn.userInteractionEnabled = NO;
    [self.contentView addSubview:self.centerItemBtn];
    
    /** 左侧按钮 */
    self.leftItemBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, btnW, self.contentView.height)];
    self.leftItemBtn.hidden = YES;
    [[self.leftItemBtn titleLabel] setFont:DEFAULT_FONT(14.0f)];
    self.leftItemBtn.userInteractionEnabled = NO;
    [self.contentView addSubview:self.leftItemBtn];
    
    /** 右侧按钮 */
    self.rightItemBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.width-btnW, 0, btnW, self.leftItemBtn.height)];
    self.rightItemBtn.hidden = YES;
    [[self.rightItemBtn titleLabel] setFont:DEFAULT_FONT(14.0f)];
    self.rightItemBtn.userInteractionEnabled = NO;
    self.rightItemBtn.titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
    [self.contentView addSubview:self.rightItemBtn];
}


- (void)leftBtnSetTitle:(NSString *)title forState:(UIControlState)state{
    self.leftItemBtn.hidden = NO;
    [self.leftItemBtn setTitle:title forState:state];
}
- (void)leftBtnSetImage:(UIImage *)image forState:(UIControlState)state{
    self.leftItemBtn.hidden = NO;
    [self.leftItemBtn setImage:image forState:state];
}
- (void)leftBtnAddTarget:(id)target selector:(SEL)selector{
    self.leftItemBtn.hidden = NO;
    self.leftItemBtn.userInteractionEnabled = YES;
    [self.leftItemBtn setShowsTouchWhenHighlighted:YES];
    [self.leftItemBtn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}


- (void)centerBtnSetTitle:(NSString *)title forState:(UIControlState)state{
    self.centerItemBtn.hidden = NO;
    [self.centerItemBtn setTitle:title forState:state];
}
- (void)centerBtnSetImage:(UIImage *)image forState:(UIControlState)state{
    self.centerItemBtn.hidden = NO;
    [self.centerItemBtn setImage:image forState:state];
}
- (void)centerBtnAddTarget:(id)target selector:(SEL)selector{
    self.centerItemBtn.hidden = NO;
    self.centerItemBtn.userInteractionEnabled = YES;
    [self.centerItemBtn setShowsTouchWhenHighlighted:YES];
    [self.centerItemBtn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}

- (void)rightBtnSetTitle:(NSString *)title forState:(UIControlState)state{
    self.rightItemBtn.hidden = NO;
    CGSize contentSize = [title sizeWithFont:DEFAULT_FONT(16.0f) maxSize:CGSizeMake(80, 44)];
    [self.rightItemBtn setBackgroundColor:[UIColor clearColor]];
    [self.rightItemBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.rightItemBtn.frame = CGRectMake(self.width-14-contentSize.width, 0, contentSize.width, 44);
    [self.rightItemBtn setTitle:title forState:state];
}
- (void)rightBtnSetImage:(UIImage *)image forState:(UIControlState)state{
    self.rightItemBtn.hidden = NO;
    [self.rightItemBtn setImage:image forState:state];
}
- (void)rightBtnAddTarget:(id)target selector:(SEL)selector{
    self.rightItemBtn.hidden = NO;
    self.rightItemBtn.userInteractionEnabled = YES;
    [self.rightItemBtn setShowsTouchWhenHighlighted:YES];
    [self.rightItemBtn addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
}

- (void)rightBtnSetRoundViewWithTitle:(NSString *)title forState:(UIControlState)state
{
    self.rightItemBtn.hidden = NO;
    CGSize contentSize = [title sizeWithFont:DEFAULT_FONT(16.0f) maxSize:CGSizeMake(80, 44)];
    NSInteger width = contentSize.width < btnW ? btnW : contentSize.width + 8;
    [self.rightItemBtn setFrame:CGRectMake(self.frame.size.width - width - 10 , (self.contentView.height-30)/2, width, 30)];
    [self.rightItemBtn setBackgroundColor:[UIColor whiteColor]];
    [self.rightItemBtn setTitleColor:self.backgroundColor forState:UIControlStateNormal];
    [self.rightItemBtn.layer setCornerRadius:5.0f];
    self.rightItemBtn.layer.masksToBounds = YES;
    
    [self.rightItemBtn setTitle:title forState:state];
}
/**
 *  改变导航条的颜色
 *
 *  @param visibleColor
 */
- (void)changeHeaderVisibleColor:(UIColor *)visibleColor {
    self.contentView.backgroundColor = visibleColor;
    self.backgroundColor = visibleColor;
}
/**
 *  改变导航条标题的颜色
 *
 *  @param color
 */
- (void)changeTitleColor:(UIColor *)color
{
    [self.centerItemBtn setTitleColor:color forState:UIControlStateNormal];
}
@end
