//
//  MKAdLaunchView.m
//  MEIKU
//
//  Created by 果子 on 16/4/29.
//  Copyright © 2016年 Mrrck. All rights reserved.
//

#import "ZCMatchPageView.h"

#import "ZCMatchPageFactory.h"

@interface ZCMatchPageView ()

@property (nonatomic, assign) NSTimeInterval secondsCountDown;
/** 计时器 */
@property (nonatomic, strong) NSTimer *countDownTimer;
/** 时间计时按钮 */
@property (nonatomic, strong) UIButton *timeButton;
/** 马上参加按钮 */
@property (nonatomic, strong) UIButton *enterButton;
@property (nonatomic, strong) UIImageView *bgImg;

@end

static const CGFloat timerW = 50;

@implementation ZCMatchPageView

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        //
        
        self.bgImg = [[UIImageView alloc] initWithFrame:CGRectZero];
        self.bgImg.contentMode = UIViewContentModeScaleAspectFill;
        NSString* _str = [[[ZCMatchPageFactory shareDefault] matchPage] matchImageUrl];
        
        if (_str!=nil) {
            self.bgImg.image = [UIImage imageNamed:_str];
        }else
        {
            self.bgImg.image = [UIImage imageNamed:@"matchAD"];
        }
        
        [self addSubview:_bgImg];
        
        
        //倒计时按钮(进入应用程序)
        self.timeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.timeButton.frame = CGRectZero;
        [self.timeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        self.timeButton.backgroundColor = [UIColor lightGrayColor];
        [self.timeButton setTitle:@"跳过" forState:UIControlStateNormal];
        [self.timeButton addTarget:self action:@selector(clickTimer) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_timeButton];
        
        //马上参加按钮
        self.enterButton = [UIButton buttonWithType:UIButtonTypeCustom];
        self.enterButton.frame = CGRectZero;
        self.enterButton.layer.cornerRadius = 3.0f;
        self.enterButton.layer.masksToBounds = YES;
        self.enterButton.layer.borderColor = [UIColor whiteColor].CGColor;
        self.enterButton.layer.borderWidth = 1.0f;
        [self.enterButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self.enterButton setTitle:@"我要参加" forState:UIControlStateNormal];
        [self.enterButton addTarget:self action:@selector(clickEnter) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_enterButton];
        
        
        self.secondsCountDown = 2.5;//5秒倒计时
        self.countDownTimer = [NSTimer scheduledTimerWithTimeInterval:0.5f target:self selector:@selector(timeFireMethod) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_countDownTimer forMode:NSRunLoopCommonModes];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.bgImg.frame = self.bounds;
    self.timeButton.frame = CGRectMake(self.width-20-timerW, 20, timerW, timerW);
    self.timeButton.layer.cornerRadius = timerW/2;
    self.timeButton.layer.masksToBounds = YES;
    self.enterButton.frame = CGRectMake(self.width/3, self.height-30-30, self.width/3, 30);
}
- (void)timeFireMethod {
    
    if (self.secondsCountDown <= 0){
        [self.countDownTimer invalidate];
        [self clickTimer];
    }
//    [self.timeButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
//    [self.timeButton setTitle:[NSString stringWithFormat:@"(%ld)",(long)self.secondsCountDown] forState:UIControlStateNormal];
//    self.timeButton.layer.borderColor = [UIColor grayColor].CGColor;
    
    self.secondsCountDown = self.secondsCountDown - 0.5f;
}

- (void)clickTimer
{
    if ([self.mDelegate respondsToSelector:@selector(adLaunchViewDidSelectSkipButton:)]&&self.mDelegate) {
        [self.mDelegate adLaunchViewDidSelectSkipButton:self];
    }
}

- (void)clickEnter
{
    if ([self.mDelegate respondsToSelector:@selector(adLaunchViewDidSelectEnterButton:)]&&self.mDelegate) {
        [self.countDownTimer invalidate];
        [self.mDelegate adLaunchViewDidSelectEnterButton:self];
    }
}

@end
