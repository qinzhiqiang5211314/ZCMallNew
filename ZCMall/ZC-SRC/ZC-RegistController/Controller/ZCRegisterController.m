//
//  ZCRegisterController.m
//  ZCMall
//
//  Created by 秦志强 on 16/7/17.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "ZCRegisterController.h"
#import "RegisterView.h"
@interface ZCRegisterController ()

@end

@implementation ZCRegisterController

- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    *  添加导航栏
    */
    [self loadHeaderView];
    RegisterView *_registerView =[[RegisterView alloc]initWithFrame:CGRectMake(0, APP_NaviH, APPWIDTH, APPHEIGHT-APP_NaviH)];
    [self.view addSubview:_registerView];
    // Do any additional setup after loading the view.
}

-(void)loadHeaderView{
    [self.mNavgationBar setMTitleStr:@"注册"];
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
