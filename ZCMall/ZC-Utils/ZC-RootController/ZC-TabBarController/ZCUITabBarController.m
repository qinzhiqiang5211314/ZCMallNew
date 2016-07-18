//
//  MKUITabBarController.m
//  MK
//
//  Created by hgh on 16/6/14.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCUITabBarController.h"
#import "ZCTabBarViewCfg.h"

@interface ZCUITabBarController ()<UITabBarControllerDelegate>
{
    
    
}


@property(nonatomic,weak)id<ZCTabBarViewCfg>             mTabBarConfig;

@end

@implementation ZCUITabBarController
@synthesize mTabBarConfig;


- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self conformsToProtocol:@protocol(ZCTabBarViewCfg)]) {
        self.mTabBarConfig = (id<ZCTabBarViewCfg>)self;
    }
    
    self.delegate = self;
    
    //添加controller
    if (self.mTabBarConfig) {
        /**
         *  初始控制器
         */
        self.viewControllers = [self.mTabBarConfig controllers];
        
        /**
         *  样式设置
         */
        [self.mTabBarConfig setTabBarStyle];
        
        /**
         *  其他设置
         */
        [self.mTabBarConfig otherSeting];
    }
    
    
}

-(BOOL)shouldAutorotate {
        
    return [[self.viewControllers lastObject] shouldAutorotate];
}

-(NSUInteger)supportedInterfaceOrientations {
    return (NSUInteger)[[self.viewControllers lastObject] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    
    return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}


-(BOOL)prefersStatusBarHidden
{
    return [[self.viewControllers lastObject] prefersStatusBarHidden];
    //return NO;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
