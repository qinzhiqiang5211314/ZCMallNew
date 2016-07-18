//
//  MKCyclescrollView.h
//  MK
//
//  Created by 李诚 on 16/6/21.
//  Copyright © 2016年 MCMac. All rights reserved.
//


#import <UIKit/UIKit.h>


@class ZCCyclescrollView;

@protocol ZCCyclescrollViewDelegate <NSObject>

-(void)cyclescrollView:(ZCCyclescrollView *)cyclescrollView didTapIamgeViewWithIndex:(NSInteger)index;

@end

@interface ZCCyclescrollView : UIView

@property (nonatomic, strong) NSArray *mImageArray;

@property (nonatomic, strong) UIImage * mPlaceholderImage;


/**  */
@property (nonatomic, assign) id<ZCCyclescrollViewDelegate>  mDelegate ;



- (instancetype)initWithFrame:(CGRect)frame mTimeInterval:(CGFloat)mTimeInterval;

@end
