//
//  MKBaseViewController.h
//  MK
//
//  Created by 李诚 on 16/6/13.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCAbnormalShowProtocal.h"
#import "ZCNaviBarProtocal.h"
#import "ZCNaviBarTool.h"

@interface ZCBaseViewController : UIViewController
{
    
}

/**
 *  页面异常处理接口
 */
@property(nonatomic,strong)UIView<ZCAbnormalShowProtocal>*        mAbnormalShow;

/**
 *  导航栏
 */
@property(nonatomic,strong)UIView<ZCNaviBarProtocal>*             mNavgationBar;




/**
 *  返回父窗口
 */
-(void)gotoSuperController;

/**
 *  返回根控制器
 */
-(void)popToRootController;


/**
 *  更新窗口
 */
- (void)pushController:(ZCBaseViewController*)_vieCtr  animate:(BOOL)animated;


/**
 *  更新窗口
 */
- (void)presentController:(ZCBaseViewController*)_vieCtr animated:(BOOL)animated completion:(void(^)())completion;

/**
 *  跳转到视图控制器VC
 *
 *  @param VC       控制器
 *  @param animated
 */
-(void) popToVC:(ZCBaseViewController *)VC animate:(BOOL)animated;


/**
 *  @author MCMac
 *
 *  菊花
 *
 *  @param titile 
 */

- (void)ZC_showLoadProgressWithTitle:(NSString *)titile;

- (void)ZC_showSuccessProgressWithTitle:(NSString *)title hideAfterDealy:(CGFloat)dealy;

- (void)ZC_showErrorProgressWithTitle:(NSString *)title hideAfterDealy:(CGFloat)dealy;

- (void)ZC_showRectTipViewWithTitle:(NSString *)title hideAfterDealy:(CGFloat)dealy;

- (void)ZC_HideProgress;
- (void)ZC_showSuccessProgressWithTitle:(NSString *)title hideAfterDealy:(CGFloat)dealy block:(void(^)())block;

-(void)showAleterLabelWithStr:(NSString *)str WithController:(UIViewController *)VC  block:(void (^)())completion;


@end














