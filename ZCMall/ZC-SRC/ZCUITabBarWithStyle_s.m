//
//  MKUITabBarWithStyle_s.m
//  MK
//
//  Created by hgh on 16/6/14.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCUITabBarWithStyle_s.h"
#import "ZCUINavigationController.h"
#import "ZCShopingController.h"
#import "ZCLoginController.h"
#import "ZCMineController.h"
#import "ZCHomepageController.h"
#import "ZCCommunityController.h"
#import "ZCClassifyController.h"

@interface ZCUITabBarWithStyle_s ()
{
  
}

@end

@implementation ZCUITabBarWithStyle_s

- (void)viewDidLoad {
    [super viewDidLoad];
}


/**
 *  返回所有控制器
 *
 *  @return 控制器列表
 */
-(NSMutableArray*) controllers
{
    ZCUINavigationController * nvct_1 = [[ZCUINavigationController alloc] initWithRootViewController:[[ZCHomepageController alloc] init]];
    
    nvct_1.tabBarItem.selectedImage=[[UIImage imageNamed:@"btn1_pre_tabbar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    nvct_1.tabBarItem.image=[[UIImage imageNamed:@"btn1_tabbar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nvct_1.tabBarItem.title = @"首页";
 
    
    ZCUINavigationController * nvct_2 = [[ZCUINavigationController alloc] initWithRootViewController:[[ZCClassifyController alloc] init]];
    //nvct_2.view.backgroundColor = [UIColor blackColor];
    nvct_2.tabBarItem.selectedImage=[[UIImage imageNamed:@"btn2_pre_tabbar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    nvct_2.tabBarItem.image=[[UIImage imageNamed:@"btn2_tabbar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nvct_2.tabBarItem.title = @"分类";
    
    
    ZCUINavigationController * nvct_3 = [[ZCUINavigationController alloc] initWithRootViewController:[[ZCCommunityController alloc] init]];
    //nvct_3.view.backgroundColor = [UIColor yellowColor];
    nvct_3.tabBarItem.selectedImage=[[UIImage imageNamed:@"btn3_pre_tabbar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    nvct_3.tabBarItem.image=[[UIImage imageNamed:@"btn3_tabbar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nvct_3.tabBarItem.title = @"社区";
    
    ZCUINavigationController * nvct_4 = [[ZCUINavigationController alloc] initWithRootViewController:[[ZCShopingController alloc] init]];
    // nvct_4.view.backgroundColor = [UIColor greenColor];
    nvct_4.tabBarItem.selectedImage=[[UIImage imageNamed:@"btn4_pre_tabbar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    nvct_4.tabBarItem.image=[[UIImage imageNamed:@"btn4_tabbar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nvct_4.tabBarItem.title = @"购物车";
    
    
    ZCUINavigationController * nvct_5 = [[ZCUINavigationController alloc] initWithRootViewController:[[ZCMineController alloc] init]];
    //nvct_5.view.backgroundColor = [UIColor greenColor];
    nvct_5.tabBarItem.selectedImage=[[UIImage imageNamed:@"btn5_pre_tabbar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];;
    nvct_5.tabBarItem.image=[[UIImage imageNamed:@"btn5_tabbar"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nvct_5.tabBarItem.title = @"我的";
    
    
    
    NSArray *ctrlArr = [NSArray arrayWithObjects:nvct_1,nvct_2,nvct_3,nvct_4,nvct_5,nil];

   // NSArray *ctrlArr = [NSArray arrayWithObjects:nvct_1,nvct_3,nvct_4,nvct_5,nil];
    
    
    return ctrlArr;


}


/**
 *  设施tabbar样式
 */
-(void) setTabBarStyle
{
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor blackColor], UITextAttributeTextColor,
                                                       nil] forState:UIControlStateNormal];
    
    UIColor *titleHighlightedColor = APP_FEMALE_COLOR;
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       titleHighlightedColor, UITextAttributeTextColor,
                                                       nil] forState:UIControlStateSelected];
    
    
//    CGRect frame = CGRectMake(0, 0, 320, 49);
//    UIView *v = [[UIView alloc] initWithFrame:frame];
//    v.backgroundColor = [UIColor colorWithRed:134.0/255.0 green:103.0/255.0 blue:82.0/255.0 alpha:1.0];
//    [self.tabBar insertSubview:v atIndex:0];
//    self.tabBar.opaque = YES;

}

/**
 *  其他设置
 */
-(void) otherSeting
{
    
}



@end
