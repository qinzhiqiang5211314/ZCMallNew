//
//  MKCyclescrollView.m
//  MK
//
//  Created by 李诚 on 16/6/21.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCCyclescrollView.h"
//#import "UIImageView+ZC.h"

static NSInteger tagNumber = 1000;

@interface ZCCyclescrollView ()
{
    
}

@property (nonatomic, strong) UIScrollView *mScrollView;


@property (nonatomic, strong) UIPageControl *mPageControl;
@property (nonatomic, strong) NSTimer *mTimer;

@property (nonatomic, assign) CGFloat mTimeInterval;

@property (nonatomic, assign) BOOL mZhengFanFlag;


@end

@implementation ZCCyclescrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)dealloc{
    
    [self.mTimer invalidate];

}

-(void) startRoop
{
    [self mTimer];
}
-(void) stopRoop
{
    if (self.mTimer!=nil) {
        [self.mTimer invalidate];
        self.mTimer = nil;
    }
}


- (instancetype)initWithFrame:(CGRect)frame mTimeInterval:(CGFloat)mTimeInterval{
    self = [super initWithFrame:frame];
    if (self) {
        self.mTimeInterval = mTimeInterval;
    }
    return self;
}

- (void)setUpSubViews{
//
    [self stopRoop];
    __weak typeof(self) weakSelf = self;
    
    [self.mScrollView.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [obj removeFromSuperview];
    }];
    [self addSubview:self.mScrollView];
    
    
    _mScrollView.contentSize = CGSizeMake(self.width * self.mImageArray.count, self.height);

    [self addSubview: self.mPageControl];
    int idx =0;
    for (id obj in self.mImageArray) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(idx * weakSelf.width, 0, weakSelf.width, weakSelf.height)];
        if ([obj isKindOfClass:[UIImage class]]) {
            imageView.image = (UIImage *)obj;
        }else{
            
            [imageView ZC_setImageWithUrl:(NSString *)obj placeholderImage:_mPlaceholderImage];
        }
        imageView.tag = tagNumber + idx;
        imageView.userInteractionEnabled = YES;
        NSLog(@"%@", NSStringFromCGRect(imageView.frame));
        [weakSelf.mScrollView addSubview:imageView];
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageAction:)];
        [imageView addGestureRecognizer:tap];
        idx++;
    }
    self.mPageControl.numberOfPages =self.mImageArray.count;
    
    [self startRoop];
}

-(void)tapImageAction:(UITapGestureRecognizer *)tap {
    if (self.mDelegate && [self.mDelegate respondsToSelector:@selector(cyclescrollView:didTapIamgeViewWithIndex:)]) {
        UIImageView *imageView =(UIImageView *)tap.view;
        [self.mDelegate cyclescrollView:self didTapIamgeViewWithIndex:imageView.tag - tagNumber];
    }
}


-(void)privateScrollAction{
    
    if (_mZhengFanFlag) {
        
        self.mPageControl.currentPage --;
        
        if (self.mPageControl.currentPage == 0) {
            _mZhengFanFlag = NO;
        }
    }else{
        

        
        self.mPageControl.currentPage ++;
        if (self.mPageControl.currentPage == self.mImageArray.count - 1) {
            _mZhengFanFlag = YES;
        }
    }
    
    dispatch_async(dispatch_get_main_queue(), ^{
        self.mScrollView.contentOffset = CGPointMake(self.mPageControl.currentPage * APPWIDTH , 0);
        });
}


-(void)setMPlaceholderImage:(UIImage *)mPlaceholderImage{
    _mPlaceholderImage = mPlaceholderImage;
}

-(void)setMImageArray:(NSArray *)mImageArray{
    _mImageArray = mImageArray;
    [self setUpSubViews];
}


-(UIScrollView *)mScrollView{
    if (!_mScrollView) {
        _mScrollView = [[UIScrollView alloc] initWithFrame:self.bounds];
        _mScrollView.alwaysBounceVertical = NO;
        _mScrollView.alwaysBounceHorizontal = NO;
        _mScrollView.pagingEnabled =  YES;
        _mScrollView.backgroundColor = [UIColor grayColor];
    }
    return _mScrollView;
}

-(NSTimer *)mTimer{
    if (!_mTimer) {
        _mTimer = [NSTimer scheduledTimerWithTimeInterval:self.mTimeInterval target:self selector:@selector(privateScrollAction) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:_mTimer forMode:NSRunLoopCommonModes];
    }
    return _mTimer;
}


-(UIPageControl *)mPageControl{
    if (!_mPageControl) {
        _mPageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.height - 30, self.width, 30)];
//        _mPageControl.backgroundColor = [UIColor redColor];
        _mPageControl.pageIndicatorTintColor = [UIColor whiteColor];
        _mPageControl.currentPageIndicatorTintColor = [UIColor grayColor];
    }
    return _mPageControl;
}


@end
