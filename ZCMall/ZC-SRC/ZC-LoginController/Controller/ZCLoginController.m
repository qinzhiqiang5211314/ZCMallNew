//
//  ZCLoginController.m
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "ZCLoginController.h"
#import "LoginView.h"
#import "ZCRegisterController.h"
#import "ZCForgotPasswordController.h"
@implementation ZCLoginController


-(void)viewDidLoad{
    /**
     *  添加导航栏
     */
    [self loadHeaderView];
    LoginView *_loginView =[[LoginView alloc]initWithFrame:CGRectMake(0, APP_NaviH, APPWIDTH, APPHEIGHT-APP_NaviH)];
    [_loginView showLoginBlock:^(NSString *sender){
        if ([sender isEqualToString:@"手机快速注册"]) {
            ZCRegisterController *zcRegisterVc =[[ZCRegisterController alloc]init];
            [self.navigationController pushViewController:zcRegisterVc animated:YES];
        }else if ([sender isEqualToString:@"找回密码"]){
            ZCForgotPasswordController *zcForPassVc =[[ZCForgotPasswordController alloc]init];
            [self.navigationController pushViewController:zcForPassVc animated:YES];
        }
    
    }];
    [self.view addSubview:_loginView];
}


-(void)loadHeaderView{
           [self.mNavgationBar setMTitleStr:@"登录"];
}
@end
