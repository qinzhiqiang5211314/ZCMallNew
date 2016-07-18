//
//  MKNaviBarProtocal.h
//  MK
//
//  Created by hgh on 16/6/15.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCNaviBarProtocal <NSObject>


//===============================================
// 常用快捷入口
//====================================================

/**
 *  设置左边按钮
 *
 *  @param btn 按钮
 */
@property(nonatomic,strong)UIButton*            mLeftBtn;

/**
 *  设置右边按钮
 *
 *  @param btn 按钮
 */
@property(nonatomic,strong)UIButton*            mRightBtn;

/**
 *  设置标题
 *
 *  @param strTitle 标题
 */
@property(nonatomic,strong)NSString*            mTitleStr;


/**
 *  设置是否隐藏导航栏
 *
 *  @param _ye 【yes/no】对应【隐藏/显示】
 */
-(void) hiden:(BOOL)_ye;

/**
 *  置顶层
 */
-(void) bringToTopmost;


//===============================================
// 特殊导航栏
//====================================================


/**
 *  导航栏添加自定义view
 *
 *  @param view 自定义的view
 */
- (void)showCoverView:(UIView *)_views;

/**
 *  导航栏添加自定义view （搜索框/等特殊的控件）
 *
 *  @param view         自定义view
 *  @param bIsAnimation 是否使用底层动画
 */
- (void)showCoverView:(UIView *)_views animation:(BOOL)_bIsAnimation;

/**
 *   添加自定义标题（分段器/等）
 *
 *  @param view 标题view
 */
- (void)showCoverViewOnTitleView:(UIView *)_views;

/**
 *  设置右边边自定义view
 *
 *  @param _view
 */
-(void) showCoverViewOnRightView:(UIView*)_views;


/**
 *  设置左边自定义view
 *
 *  @param _view
 */
-(void) showCoverViewOnLeftView:(UIView*)_views;



/**
 *  隐藏导航栏上 覆盖层view
 *
 *  @param view 覆盖层view
 */
- (void)hideCoverView:(UIView *)_views;


@end
