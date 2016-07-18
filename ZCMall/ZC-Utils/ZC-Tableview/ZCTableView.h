//
//  MKTableView.h
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCRefreshProtocol.h"

@interface ZCTableView : UITableView
{
    
}

//是否使用默认刷新控件
-(id) initWithFrame:(CGRect)frame WithRefreshHeader:(BOOL)_hye WithRefreshFooter:(BOOL)_fye;

/**
 *  自定义头部刷新控件
 */
@property(nonatomic,strong)UIView<ZCRefreshProtocol>*    mRefreshHeader;

/**
 *  自定义底部刷新控件
 */
@property(nonatomic,strong)UIView<ZCRefreshProtocol>*    mRefreshFooter;

/**
 *  刷新回调
 */
@property(nonatomic,copy)void(^refreshBlock)(void);

/**
 *  加载更多回调
 */
@property(nonatomic,copy)void(^loadmoreBlock)(void);


/**
 *  强制刷新
 */
-(void)forceRefrsh;



@end
