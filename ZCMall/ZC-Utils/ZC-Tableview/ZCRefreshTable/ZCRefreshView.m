//
//  MKRefreshView.m
//  MK
//
//  Created by hgh on 16/6/13.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCRefreshView.h"
#import "ZCRefreshProtocol.h"

ZCRefreshState      CurrentRefreshState;


@interface ZCRefreshView()
{
    UIEdgeInsets                    _scrollViewEdgeInsets;
    UIEdgeInsets                    _originalEdgeInsets;
    UIScrollView*                   _scrollView;
    UIActivityIndicatorView*        _activityIndicatorView;
    
    
    ZCRefreshState               _refreshState;
    BOOL                            _isEffectedByNavigationController;
    BOOL                            _isManuallyRefreshing;
    
    //
    CGFloat _stateIndicatorViewNormalTransformAngle;
    CGFloat _stateIndicatorViewWillRefreshStateTransformAngle;

}

//@property(nonatomic,weak)id<MKRefreshProtocol>              mRefreshView;

@end

@implementation ZCRefreshView
@synthesize refreshBlock;

-(instancetype)init
{
    self = [super init];
    if (self) {
//        if ([self conformsToProtocol:@protocol(MKRefreshProtocol)]) {
//            self.mRefreshView = (id<MKRefreshProtocol>)self;
//            
//        } else {
//            //
//            
//        }
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        
        _refreshState = ZCRefreshState_Normal;
        self.backgroundColor = [UIColor clearColor];
        
    }
    return self;
}

+ (instancetype)refreshView
{
    return [[self alloc] init];
}

- (void)willMoveToSuperview:(UIView *)newSuperview
{
    if (!newSuperview) {
        [_scrollView removeObserver:self forKeyPath:ZCRefreshObservingkeyWord];
    }
}

- (void)didMoveToSuperview
{
    self.bounds = CGRectMake(0, 0, _scrollView.frame.size.width, ZCNavigationBarDefaultHeight);
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
//    _activityIndicatorView.center = CGPointMake(HActivityIndicatorViewMargin,self.bounds.size.height * 0.5);
//    _activityIndicatorView.backgroundColor = [UIColor redColor];
//    
    
//    _stateIndicatorView.center = _activityIndicatorView.center;
//    _textIndicator.center = CGPointMake(self.bounds.size.width * 0.5, _activityIndicatorView.bounds.size.height * 0.5 + HTextIndicatorMargin);
//    _timeIndicator.center = CGPointMake(self.bounds.size.width * 0.5, self.bounds.size.height - _timeIndicator.bounds.size.height * 0.5 - HTimeIndicatorMargin);
}

//- (NSString *)lastRefreshingTimeString
//{
//    if (_lastRefreshingTimeString == nil) {
//        return [self refreshingTimeString];
//    }
//    return _lastRefreshingTimeString;
//}

- (void)setScrollView:(UIScrollView *)scrollView
{
    _scrollView = scrollView;
    
    [_scrollView addSubview:self];
    [_scrollView addObserver:self forKeyPath:ZCRefreshObservingkeyWord options:NSKeyValueObservingOptionNew context:nil];
    
    // 默认是在NavigationController控制下，否则可以调用addToScrollView:isEffectedByNavigationController:(设值为NO) 即可
    _isEffectedByNavigationController = YES;
}

- (void)addToScrollView:(UIScrollView *)scrollView isEffectedByNavigationController:(BOOL)effectedByNavigationController
{
    [self setScrollView:scrollView];
    _isEffectedByNavigationController = effectedByNavigationController;
    _originalEdgeInsets = scrollView.contentInset;
}


// 获得在scrollView的contentInset原来基础上增加一定值之后的新contentInset
- (UIEdgeInsets)syntheticalEdgeInsetsWithEdgeInsets:(UIEdgeInsets)edgeInsets
{
    return UIEdgeInsetsMake(_originalEdgeInsets.top + edgeInsets.top, _originalEdgeInsets.left + edgeInsets.left, _originalEdgeInsets.bottom + edgeInsets.bottom, _originalEdgeInsets.right + edgeInsets.right);
}

- (BOOL)setRefreshState:(ZCRefreshState)refreshState
{
    if ((CurrentRefreshState==refreshState)&&(CurrentRefreshState==ZCRefreshState_Refreshing)) {
        return NO;
    }
    
    if ((refreshState==ZCRefreshState_WillRefresh)&&(CurrentRefreshState==ZCRefreshState_Refreshing)) {
        return NO;
    }
    CurrentRefreshState = refreshState;
    
    _refreshState = refreshState;
    
    switch (refreshState) {
            // 进入刷新状态
        case ZCRefreshState_Refreshing:
        {
            _originalEdgeInsets = _scrollView.contentInset;
            
            _scrollView.contentInset = [self syntheticalEdgeInsetsWithEdgeInsets:_scrollViewEdgeInsets];
            
            
        }
            break;
            
        case ZCRefreshState_WillRefresh:
        {
            
        }
            break;
            
        case ZCRefreshState_Normal:
            
         
            break;
            
        default:
            break;
    }
    
    return YES;
}



- (void)endRefreshing
{
    if (_refreshState!=ZCRefreshState_Refreshing)
        return;
    
    [UIView animateWithDuration:0.6 animations:^{
        
        _scrollView.contentInset = _originalEdgeInsets;
        //[self layoutSubviews];
        
    } completion:^(BOOL finished) {
        
        [self setRefreshState:ZCRefreshState_Normal];
        if (_isManuallyRefreshing) {
            _isManuallyRefreshing = NO;
        }
        
    }];
}

// 更新时间
- (NSString *)refreshingTimeString
{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"HH:mm";
    return [formatter stringFromDate:date];
}


-(void)setManualRefresh:(BOOL)_ye
{
    _isManuallyRefreshing = _ye;
}


-(NSString*) textForNormalState
{
    return @"";
}


-(UIView*)activityIndicatorView
{
    return _activityIndicatorView;
}


-(void)SetScrollViewEdgeInsets:(UIEdgeInsets)_value
{
    _scrollViewEdgeInsets = _value;
}

-(BOOL)isEffectedByNavigationController
{
    return _isEffectedByNavigationController;
}

- (ZCRefreshState) currentState
{
    return _refreshState;
}

-(BOOL)isManuaRefresh
{
    return _isManuallyRefreshing;
}

-(UIEdgeInsets)originalEdgeInsets
{
    return _originalEdgeInsets;
}

// 观察着相应
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    ;
}

- (void)dealloc
{
    [_scrollView removeObserver:self forKeyPath:ZCRefreshObservingkeyWord];
}

@end
