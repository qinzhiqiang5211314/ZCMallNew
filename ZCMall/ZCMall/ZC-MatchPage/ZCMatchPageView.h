//
//  MKAdLaunchView.h
//  MEIKU
//
//  Created by 果子 on 16/4/29.
//  Copyright © 2016年 Mrrck. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZCMatchPageView;
@protocol ZCMatchPageViewDelegate <NSObject>

@optional
//我要参加按钮
- (void)adLaunchViewDidSelectEnterButton:(ZCMatchPageView *)view;
//跳过按钮
- (void)adLaunchViewDidSelectSkipButton:(ZCMatchPageView *)view;

@end

@interface ZCMatchPageView : UIView

@property (nonatomic, strong) NSString *matchID;
@property (nonatomic, strong) NSArray  *dataArray;

/**  */
@property (nonatomic, weak) id<ZCMatchPageViewDelegate> mDelegate;

@end
