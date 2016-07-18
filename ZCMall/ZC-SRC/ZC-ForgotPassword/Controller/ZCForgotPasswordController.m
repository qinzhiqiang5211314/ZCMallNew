//
//  ZCForgotPasswordController.m
//  ZCMall
//
//  Created by 秦志强 on 16/7/17.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "ZCForgotPasswordController.h"
#import "ForgotPasswordView.h"
@interface ZCForgotPasswordController ()

@end

@implementation ZCForgotPasswordController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     *  添加导航栏
     */
    [self loadHeaderView];
    ForgotPasswordView *_forgotPassView =[[ForgotPasswordView alloc]initWithFrame:CGRectMake(0, APP_NaviH, APPWIDTH, APPHEIGHT-APP_NaviH)];
    [self.view addSubview:_forgotPassView];
    // Do any additional setup after loading the view.
}

-(void)loadHeaderView{
    [self.mNavgationBar setMTitleStr:@"找回密码"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
