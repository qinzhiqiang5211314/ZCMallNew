//
//  MKCustomNaviBar.m
//  MK
//
//  Created by hgh on 16/6/15.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCCustomNaviBar.h"
#import "ZCNaviBarTool.h"
#import "ZCBaseViewController.h"

#define statuBar_hight 20.0

@interface ZCCustomNaviBar ()
{
    UIViewController*                   mController;
    
    UIButton*                           mBtnBack;
    UILabel*                            mLableTitle;
    UIImageView*                        mImgViewBck;
    
    
    UIView*                             mStatuBar;
    UIView*                             mNavBar;
    
}


@end

@implementation ZCCustomNaviBar
@synthesize mBlur;
@synthesize mLeftBtn;
@synthesize mRightBtn;

-(id) initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame WithNavController:nil];
}

-(id) initWithFrame:(CGRect)frame WithNavController:(UIViewController*)_ctr
{
    //
    mController = _ctr;
    
    self = [super initWithFrame:frame];
    if (self) {
        
        if (mController) {
            [_ctr.view addSubview:self];
            
        }

        [self uiLayout];
    }
    
      return  self;
    
}

/**
 *  设置是否隐藏导航栏
 *
 *  @param _ye 【yes/no】对应【隐藏/显示】
 */
-(void) hiden:(BOOL)_ye
{
    [mNavBar setHidden:_ye];
}


/**
 *  置顶层
 */
-(void) bringToTopmost
{
    if (mController) {
        [mController.view bringSubviewToFront:self];
    }
    
}


- (void)uiLayout
{
    self.backgroundColor = [UIColor clearColor];
    
    //电池栏
    mStatuBar = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, statuBar_hight)];
    mStatuBar.backgroundColor = APP_FEMALE_COLOR;
    [self addSubview:mStatuBar];
    
    //导航栏
    mNavBar = [[UIView alloc] initWithFrame:CGRectMake(0, statuBar_hight, self.frame.size.width, self.frame.size.height-statuBar_hight)];
    mNavBar.backgroundColor = APP_FEMALE_COLOR;
    [self addSubview:mNavBar];
    
    // 默认左侧显示返回按钮
    mBtnBack =[[ZCNaviBarTool tools] createNavBtnByImg:@"back" imgHighlight:@"back" target:self action:@selector(btnBack:)];
    
    mLableTitle = [[UILabel alloc] initWithFrame:CGRectZero];
    mLableTitle.backgroundColor = [UIColor clearColor];
    mLableTitle.textColor = [[ZCNaviBarTool tools] titleColor];
    mLableTitle.font = [UIFont systemFontOfSize:[[ZCNaviBarTool tools] titleSize]];
    mLableTitle.textAlignment = NSTextAlignmentCenter;
    
//    mImgViewBck = [[UIImageView alloc] initWithFrame:self.bounds];
//    mImgViewBck.image = [[UIImage imageNamed:@"NaviBar_Bg"] resizableImageWithCapInsets:UIEdgeInsetsMake(0, 0, 0, 0)];
//    mImgViewBck.alpha = 0.98f;
    
    if (self.mBlur)
    {// iOS7可设置是否需要现实磨砂玻璃效果
        mImgViewBck.alpha = 0.0f;
        UINavigationBar *naviBar = [[UINavigationBar alloc] initWithFrame:self.bounds];
        [self addSubview:naviBar];
    }
    
    mLableTitle.frame = [[ZCNaviBarTool tools] titleViewFrame];
    mImgViewBck.frame = self.bounds;
    
    //[mNavBar addSubview:mImgViewBck];
    [mNavBar addSubview:mLableTitle];
    
    [self setMLeftBtn:mBtnBack];
    
}


- (void)btnBack:(id)sender
{

    if (mController) {
        [(ZCBaseViewController*)mController gotoSuperController];
    }
}


#pragma mark -
- (void)hideOriginalBarItem:(BOOL)bIsHide
{
//    if (mLeftBtn)
//    {
//        mLeftBtn.hidden = bIsHide;
//    }else{}
//    if (mBtnBack)
//    {
//        mBtnBack.hidden = bIsHide;
//    }else{}
//    if (mRightBtn)
//    {
//        mRightBtn.hidden = bIsHide;
//    }else{}
//    if (mLableTitle)
//    {
//        mLableTitle.hidden = bIsHide;
//    }else{}
}


//===============================================
// 常用快捷入口
//====================================================

/**
 *  设置左边按钮
 *
 *  @param btn 按钮
 */
-(void) setMLeftBtn:(UIButton *)mLeftBtn_
{
    if (mLeftBtn)
    {
        [mLeftBtn removeFromSuperview];
        mLeftBtn = nil;
    }else{}
    
    mLeftBtn = mLeftBtn_;
    if (mLeftBtn)
    {
        
        mLeftBtn.frame = CGRectMake(2.0f,0.0f, [[ZCNaviBarTool tools] barBtnSize].width, [[ZCNaviBarTool tools] barBtnSize].height);
        [mNavBar addSubview:mLeftBtn];
    }else{}

}


/**
 *  设置右边按钮
 *
 *  @param btn 按钮
 */
-(void) setMRightBtn:(UIButton *)mRightBtn_
{
    if (mRightBtn)
    {
        [mRightBtn removeFromSuperview];
        mRightBtn = nil;
    }else{}
    
    mRightBtn = mRightBtn_;
    if (mRightBtn)
    {
        mRightBtn.frame = [[ZCNaviBarTool tools] rightBtnFrame];
        [mNavBar addSubview:mRightBtn];
    }else{}

}

/**
 *  设置标题
 *
 *  @param strTitle 标题
 */
-(void) setMTitleStr:(NSString *)mTitleStr_
{
    if (mLableTitle) {
        mLableTitle.text = mTitleStr_;
    }
}


//===============================================
// 特殊导航栏
//====================================================


/**
 *  导航栏添加自定义view
 *
 *  @param view 自定义的view
 */
- (void)showCoverView:(UIView *)_views
{
    [self showCoverView:_views animation:NO];
}

/**
 *  导航栏添加自定义view （搜索框/等特殊的控件）
 *
 *  @param view         自定义view
 *  @param bIsAnimation 是否使用底层动画
 */
- (void)showCoverView:(UIView *)_views animation:(BOOL)_bIsAnimation
{
    if (_views)
    {
        [self hideOriginalBarItem:YES];
        
        [_views removeFromSuperview];
        
        _views.alpha = 0.4f;
        [mNavBar addSubview:_views];
        if (_bIsAnimation)
        {
            [UIView animateWithDuration:0.2f animations:^()
             {
                 _views.alpha = 1.0f;
             }completion:^(BOOL f){}];
        }
        else
        {
            _views.alpha = 1.0f;
        }
    }

}

/**
 *   添加自定义标题（分段器/等）
 *
 *  @param view 标题view
 */
- (void)showCoverViewOnTitleView:(UIView *)_views
{
    if (_views)
    {
        if (mLableTitle)
        {
            mLableTitle.hidden = YES;
        }else{}
        
        [_views removeFromSuperview];
        
        _views.frame = mLableTitle.frame;
        
        [mNavBar addSubview:_views];
    }

}

/**
 *  设置右边边自定义view
 *
 *  @param _view
 */
-(void) showCoverViewOnRightView:(UIView*)_views
{
    
}

/**
 *  设置左边自定义view
 *
 *  @param _view
 */
-(void) showCoverViewOnLeftView:(UIView*)_views
{
    
}

/**
 *  隐藏导航栏上 覆盖层view
 *
 *  @param view 覆盖层view
 */
- (void)hideCoverView:(UIView *)_views
{
    [self hideOriginalBarItem:NO];
    if (_views && (_views.superview == self))
    {
        [_views removeFromSuperview];
    }else{}

}


@end
