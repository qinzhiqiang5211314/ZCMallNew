//
//  MKTableView.h
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//


#import <UIKit/UIKit.h>

@interface ZCCircleBar : UIView
{
    
}

/**
 *  进度
 */
@property (nonatomic, assign) float mProgress;

/**
 *  开始动画
 */
- (void)startAnimating;

/**
 *  停止动画
 */
- (void)stopAnimating;

@end
