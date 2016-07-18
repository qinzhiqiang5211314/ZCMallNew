//
//  MKTableCircleHeader.m
//  MK
//
//  Created by hgh on 16/6/13.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCTableCHeader.h"
#import "ZCRefreshCircleHeader.h"


@interface ZCTableCHeader()
{
    BOOL _hasLayoutedForManuallyRefreshing;
}

@end


@implementation ZCTableCHeader
@synthesize refreshBlock;
@synthesize refreshEndBlock;
@synthesize mRefreshHeader;

-(void) setMRefreshHeader:(UIView<ZCRefreshProtocol> *)mRefreshHeader_
{
    mRefreshHeader = mRefreshHeader_;
    [self addSubview:mRefreshHeader];
    [mRefreshHeader setNormalState];
}

-(UIView<ZCRefreshProtocol>*)mRefreshHeader
{
    if (mRefreshHeader==nil) {
        mRefreshHeader = [[ZCRefreshCircleHeader alloc] initWithFrame:CGRectMake(0, 0, APPSIZE.width, 70)];
        [self addSubview:mRefreshHeader];
        [mRefreshHeader setNormalState];

    }
    
    return mRefreshHeader;
}

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //布局
        [self setRefreshState:ZCRefreshState_Normal];
    }
    
    return self;
}

- (CGFloat)yOfCenterPoint
{
    return - (self.bounds.size.height * 0.5);
}

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    [self SetScrollViewEdgeInsets:UIEdgeInsetsMake(self.frame.size.height, 0, 0, 0)];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.center = CGPointMake(mScrollview.bounds.size.width * 0.5, [self yOfCenterPoint]);
    
    //self.backgroundColor = [UIColor redColor];
    // 手动刷新
    if ([self isManuaRefresh] && !_hasLayoutedForManuallyRefreshing && mScrollview.contentInset.top > 0) {
        
        // 模拟下拉操作
        CGPoint temp = mScrollview.contentOffset;
        temp.y -= self.bounds.size.height * 2;
        mScrollview.contentOffset = temp; // 触发准备刷新
        temp.y += self.bounds.size.height;
        mScrollview.contentOffset = temp; // 触发刷新
        
        _hasLayoutedForManuallyRefreshing = YES;
        
    } else {
        
       
    }
}

- (void)forceToFresh
{
    [self setManualRefresh:YES];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (![keyPath isEqualToString:ZCRefreshObservingkeyWord]) return;
    
    CGFloat y = [change[@"new"] CGPointValue].y;
    CGFloat criticalY = -self.bounds.size.height - mScrollview.contentInset.top;
    
    // 只有在 y<=0 以及 scrollview的高度不为0 时才判断
    if ((y > 0) || (mScrollview.bounds.size.height == 0)) return;
    
    // 触发SDRefreshViewStateRefreshing状态
    if (y >= criticalY && ([self currentState] == ZCRefreshState_WillRefresh)) {
        if ([self setRefreshState:ZCRefreshState_Refreshing]) {
            [self.mRefreshHeader setRefreshingState];
            if (self.refreshBlock) {
                self.refreshBlock();
            }

        }
    }
    
    // 触发SDRefreshViewStateWillRefresh状态
    if (y < criticalY && (ZCRefreshState_Normal == [self currentState])) {
        if ([self setRefreshState:ZCRefreshState_WillRefresh])
        {
            [self setRefreshState:ZCRefreshState_WillRefresh];
            [self.mRefreshHeader setWillRefreshState];

        }
    }
}

- (void)endRefreshing
{
    [UIView animateWithDuration:0.6 animations:^{
        
        mScrollview.contentInset = [self originalEdgeInsets];
        
    } completion:^(BOOL finished) {
        
        [self setRefreshState:ZCRefreshState_Normal];
        if ([self isManuaRefresh]) {
            [self setManualRefresh:NO];
            //_isManuallyRefreshing = NO;
            [self.mRefreshHeader setNormalState];
            if (self.refreshEndBlock) {
                self.refreshEndBlock();
            }
            
        }
        
    }];
}

/**
 *  强制刷新
 */
-(void)forceRefresh
{
    [self setManualRefresh:YES];
}

/**
 *  停止刷新
 */
-(void)stopRefresh
{
    [self endRefreshing];
}



/**
 *  注入scrollview
 *
 *  @param _scrollview 实例
 */
-(void) plugScrollview:(UIScrollView*)_scrollview
{
    mScrollview = _scrollview;
    [self setScrollView:_scrollview];
}



@end
