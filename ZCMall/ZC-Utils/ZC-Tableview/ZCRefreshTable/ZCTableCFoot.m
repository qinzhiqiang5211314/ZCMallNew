//
//  MKTableCircleFoot.m
//  MK
//
//  Created by hgh on 16/6/13.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCTableCFoot.h"
#import "ZCRefreshCircleFooter.h"

@interface ZCTableCFoot()
{
    CGFloat             mOriginalScrollViewContentHeight;
}
@end

@implementation ZCTableCFoot
@synthesize loadMoreBlock;
@synthesize mRefreshFooter;

-(void)setMRefreshFooter:(UIView<ZCRefreshProtocol> *)mRefreshFooter_
{
    mRefreshFooter = mRefreshFooter_;
    [self addSubview:mRefreshFooter];
    [mRefreshFooter setNormalState];
}

-(UIView<ZCRefreshProtocol>*)mRefreshFooter
{
    if (mRefreshFooter==nil) {
        mRefreshFooter = [[ZCRefreshCircleFooter alloc] initWithFrame:CGRectMake(0, 0, APPSIZE.width, 70)];//
        [self addSubview:mRefreshFooter];
        [mRefreshFooter setNormalState];
    }
    return mRefreshFooter;
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

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    mOriginalScrollViewContentHeight = mScrollview.contentSize.height;
    self.center = CGPointMake(mScrollview.bounds.size.width * 0.5,mScrollview.contentSize.height + self.bounds.size.height * 0.5);
    
    self.hidden = [self shouldHide];
}

- (void)didMoveToSuperview
{
    [super didMoveToSuperview];
    [self SetScrollViewEdgeInsets:UIEdgeInsetsMake(0, 0, self.bounds.size.height, 0)];
    
}

- (BOOL)shouldHide
{
    //if ([self isEffectedByNavigationController]) {
        return (mScrollview.contentSize.height - ZCNavigationBarDefaultHeight < mScrollview.bounds.size.height); //  + self.scrollView.contentInset.bottom
   // }
    
   // return (mScrollview.contentSize.height< mScrollview.bounds.size.height); // +
    
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (![keyPath isEqualToString:ZCRefreshObservingkeyWord]) return;
    
    CGFloat y = [change[@"new"] CGPointValue].y;
    
    CGFloat criticalY = mScrollview.contentSize.height - mScrollview.bounds.size.height + self.bounds.size.height + mScrollview.contentInset.bottom;
    
    // 只有在 y>0 以及 scrollview的高度不为0 时才判断
    if ((y <= 0) || (mScrollview.bounds.size.height == 0)) return;
    
    // 触发SDRefreshViewStateRefreshing状态
    if (y < criticalY && ([self currentState] == ZCRefreshState_WillRefresh)) {
        if ([self setRefreshState:ZCRefreshState_Refreshing]) {
            [self.mRefreshFooter setRefreshingState];
            if (self.loadMoreBlock) {
                self.loadMoreBlock();
            }

        }
    }
    
    // 触发SDRefreshViewStateWillRefresh状态
    if (y > criticalY && (ZCRefreshState_Normal == [self currentState])) {
        //if (self.hidden) return;
        if ([self setRefreshState:ZCRefreshState_WillRefresh]) {
            [self.mRefreshFooter setWillRefreshState];

        }

    }
    
    // 如果scrollView内容有增减，重新调整refreshFooter位置
    if (mScrollview.contentSize.height != mOriginalScrollViewContentHeight) {
        [self layoutSubviews];
        [self.mRefreshFooter setNormalState];

    }
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

/**
 *  停止刷新
 */
-(void)stopRefresh
{
    [self endRefreshing];
}


@end
