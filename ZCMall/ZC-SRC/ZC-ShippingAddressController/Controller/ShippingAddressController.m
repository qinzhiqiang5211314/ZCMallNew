//
//  ShippingAddressController.m
//  ZCMall
//
//  Created by 秦志强 on 16/7/17.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "ShippingAddressController.h"
#import "ShippingAddressView.h"
@interface ShippingAddressController ()

@end

@implementation ShippingAddressController


- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     *  添加导航栏
     */
    [self loadHeaderView];
    ShippingAddressView *_shoppingView =[[ShippingAddressView alloc]initWithFrame:CGRectMake(0, APP_NaviH, APPWIDTH, APPHEIGHT-APP_NaviH)];
    [self.view addSubview:_shoppingView];
    // Do any additional setup after loading the view.
}

-(void)loadHeaderView{
    [self.mNavgationBar setMTitleStr:@"收货地址"];
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