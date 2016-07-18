//
//  MKRefreshCircleHeader.m
//  MK
//
//  Created by 李和平 on 16/6/13.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCRefreshCircleHeader.h"
#import "ZCCircleBar.h"

#define MKActivityIndicatorViewMargin 30.0f
#define MKTextIndicatorMargin 20.0f
#define MKTimeIndicatorMargin 10.0f


@interface ZCRefreshCircleHeader()
{
    UILabel *                       mTextIndicator;
    UILabel *                       mTimeIndicator;
    NSString*                       mLastRefreshingTimeString;
    
    //
    ZCCircleBar*                         mCircle;

}

@end

@implementation ZCRefreshCircleHeader

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        // 状态提示label
        mTextIndicator = [[UILabel alloc] init];
        mTextIndicator.bounds = CGRectMake(0, 0, APPSIZE.width, 30);
        mTextIndicator.textAlignment = NSTextAlignmentCenter;
        mTextIndicator.backgroundColor = [UIColor clearColor];
        mTextIndicator.font = [UIFont systemFontOfSize:14];
        mTextIndicator.textColor = [UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:1.0];
        [self addSubview:mTextIndicator];
        
        
        // 更新时间提示label
        mTimeIndicator = [[UILabel alloc] init];
        mTimeIndicator.bounds = CGRectMake(0, 0, 160, 16);;
        mTimeIndicator.textAlignment = NSTextAlignmentCenter;
        mTimeIndicator.textColor = [UIColor colorWithRed:50.0/255.0 green:50.0/255.0 blue:50.0/255.0 alpha:1.0];
        mTimeIndicator.font = [UIFont systemFontOfSize:14];
        [self addSubview:mTimeIndicator];
        
        //旋转动画
        mCircle= [[ZCCircleBar alloc] initWithFrame:CGRectMake(20, 10, MKActivityIndicatorViewMargin, MKActivityIndicatorViewMargin)];
        [self addSubview:mCircle];
        //self.backgroundColor = [UIColor redColor];
        
        mCircle.center = CGPointMake(50,self.bounds.size.height * 0.5);
        mTextIndicator.center = CGPointMake(self.bounds.size.width * 0.5, 15);
        
        mTimeIndicator.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height - mTimeIndicator.bounds.size.height-15);


    }
    
    return self;
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    mCircle.center = CGPointMake(50,self.bounds.size.height * 0.5);
    mTextIndicator.center = CGPointMake(self.bounds.size.width * 0.5, 15);
    mTimeIndicator.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height - mTimeIndicator.bounds.size.height-15);
}


/**
 *  即将刷新
 */
-(void)setWillRefreshState
{
    mTextIndicator.text = @"松开即可加载最新数据";
    
    mCircle.mProgress = 0;
    mCircle.hidden = NO;
   // [mCircle stopAnimating];

}

/**
 *  刷新中
 */
-(void)setRefreshingState
{
    mCircle.mProgress = 1;

    [mCircle startAnimating];
    //_stateIndicatorView.hidden = YES;
    
    mLastRefreshingTimeString = [self refreshingTimeString];
    mTextIndicator.text = @"正在加载最新数据,请稍候";

}


/**
 *  正常状态
 */
-(void)setNormalState
{
    mTextIndicator.text = [self textIndicatorTextAtNomal];
    mTimeIndicator.text = [NSString stringWithFormat:@"最后更新：%@", [self lastRefreshingTimeString]];
    [mCircle stopAnimating];
    mCircle.hidden = YES;

}

- (NSString *)lastRefreshingTimeString
{
    if (mLastRefreshingTimeString == nil) {
        return [self refreshingTimeString];
    }
    return mLastRefreshingTimeString;
}

// 更新时间
- (NSString *)refreshingTimeString
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    return [formatter stringFromDate:date];
}

-(NSString*) textIndicatorTextAtNomal
{
    return @"下拉可以加载最新数据";
}

@end
