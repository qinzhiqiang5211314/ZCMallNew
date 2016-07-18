//
//  MKBaseViewController.m
//  MK
//
//  Created by 李诚 on 16/6/13.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCBaseViewController.h"
#import "ZCUINavigationController.h"
#import "ZCNaviBarProtocal.h"
#import "ZCCustomNaviBar.h"
#import "ZCNaviBarTool.h"
#import "MBProgressHUD.h"


@interface ZCBaseViewController ()
{
    
}

@property (nonatomic, strong) MBProgressHUD *mProgress;

@end

@implementation ZCBaseViewController
@synthesize mNavgationBar;

-(UIView<ZCNaviBarProtocal>*)mNavgationBar{
    if (mNavgationBar==nil) {
        mNavgationBar = [[ZCCustomNaviBar alloc] initWithFrame:CGRectMake(0, 0, [[ZCNaviBarTool tools] barSize].width, [[ZCNaviBarTool tools] barSize].height) WithNavController:self];
        
    }
    
    return mNavgationBar;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view.
    
    //添加默认导航栏sel
//    if (!self.mNavgationBar) {
//        //添加
//        
//    }
}


/**
 *  返回父窗口
 */
-(void)gotoSuperController
{
    //
    if ([[self.navigationController viewControllers] count] > 0) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES
                                 completion:^{
                                     
                                 }];
    }

  //  [self updateLastCtr:_vieCtr];
}

/**
 *  返回根控制器
 */
-(void)popToRootController
{
    [self.navigationController popToRootViewControllerAnimated:YES];
}


/**
 *  更新窗口
 */
- (void)pushController:(ZCBaseViewController*)_vieCtr  animate:(BOOL)animated
{
    [_vieCtr setHidesBottomBarWhenPushed:YES];
     [self.navigationController pushViewController:_vieCtr animated:animated];
    
}


/**
 *  更新窗口
 */
- (void)presentController:(ZCBaseViewController*)_vieCtr animated:(BOOL)animated completion:(void(^)())completion
{
    ZCUINavigationController *nvc=[[ZCUINavigationController alloc]initWithRootViewController:_vieCtr];
    [self presentViewController:nvc animated:animated completion:completion];
    
}

/**
 *  跳转到视图控制器VC
 *
 *  @param VC       控制器
 *  @param animated
 */
-(void) popToVC:(ZCBaseViewController *)VC animate:(BOOL)animated
{
    [self.navigationController popToViewController:VC animated:YES];
    

}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
    
}

- (BOOL)shouldAutorotate
{
    return NO;
}
//
- (NSUInteger)supportedInterfaceOrientations
{
    return (NSUInteger)UIInterfaceOrientationMaskPortrait;
}

-(BOOL)prefersStatusBarHidden
{
    return NO;
}


- (MBProgressHUD *)mProgress{
    if (!_mProgress) {
        _mProgress = [[MBProgressHUD alloc] initWithView:self.view];
        [_mProgress setMode:MBProgressHUDModeIndeterminate];
        //        _mProgress.touchableAreas = @[NSStringFromCGRect(self.headerBar.leftItemBtn.frame)];
                [self.view addSubview:_mProgress];
    }
    return _mProgress;
}


- (void)ZC_showLoadProgressWithTitle:(NSString *)titile{
    [self.mProgress setMode:MBProgressHUDModeIndeterminate];
    self.mProgress.labelText = titile;
    [self.mProgress show:YES];
}

- (void)ZC_showSuccessProgressWithTitle:(NSString *)title hideAfterDealy:(CGFloat)dealy{
    [self.mProgress setMode:MBProgressHUDModeCustomViewSuccess];
    self.mProgress.labelText = title;
    [self.mProgress hide:YES afterDelay:dealy];
}

- (void)ZC_showErrorProgressWithTitle:(NSString *)title hideAfterDealy:(CGFloat)dealy{
    [self.mProgress setMode:MBProgressHUDModeCustomViewWarning];
    self.mProgress.labelText = title;
    [self.mProgress hide:YES afterDelay:dealy];
}

- (void)ZC_showRectTipViewWithTitle:(NSString *)title hideAfterDealy:(CGFloat)dealy
{
    [self.mProgress setMode:MBProgressHUDModeCustomView];
    self.mProgress.labelText = title;
    [self.mProgress hide:YES afterDelay:dealy];
}


- (void)ZC_showSuccessProgressWithTitle:(NSString *)title hideAfterDealy:(CGFloat)dealy block:(void(^)())block{
    [self ZC_showSuccessProgressWithTitle:title hideAfterDealy:dealy];
    if (block) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(dealy * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            block();
        });
    }
    
}

-(void)ZC_HideProgress{
    [self.mProgress hide:YES];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)showAleterLabelWithStr:(NSString *)str WithController:(UIViewController *)VC  block:(void (^)())completion{
    
    
    CGRect rect = [str boundingRectWithSize:CGSizeMake(APPWIDTH, 30) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:20.0]} context:Nil];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake((APPWIDTH - rect.size.width - 30) / 2 ,  200, rect.size.width + 30, 30)];
    label.text = str;
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor blackColor];
    label.textColor = [UIColor whiteColor];
    label.layer.cornerRadius = 10;
    label.clipsToBounds = YES;
    label.alpha = 0.8;
    [VC.view addSubview:label];
    
    [UIView animateWithDuration:2 animations:^{
        label.alpha = 0;
    } completion:^(BOOL finished) {
        [label removeFromSuperview];
        if (completion) {
            completion();
        }
        
    }];
    
}



@end

