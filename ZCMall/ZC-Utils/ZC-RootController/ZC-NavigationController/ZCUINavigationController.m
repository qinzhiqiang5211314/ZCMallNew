//
//  MKUINavigationController.m
//  MK
//
//  Created by hgh on 16/6/14.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCUINavigationController.h"

@interface ZCUINavigationController ()

@end

@implementation ZCUINavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
//            //状态栏颜色
//            UIImageView* _statueBar = [[UIImageView alloc] initWithFrame:CGRectMake(0, -20, self.navigationController.navigationBar.bounds.size.width, 20)];
//            _statueBar.image = [UIImage imageNamed:@"statueBar.png"];
//            [self.navigationController.navigationBar addSubview:_statueBar];
//    
//    
//     [self.navigationController.navigationBar setBackgroundImage: [UIImage imageNamed:@"navigationBar.png"] forBarMetrics:UIBarMetricsDefault];

    
    //隐藏导航条
    [self setNavigationBarHidden:NO];
    [self.navigationBar setHidden:YES];
}


-(BOOL)shouldAutorotate {
    
    //NSLog(@"UINavigationController 100");
    // 不想其子页面支持旋转， 可直接返回 NO
    //return NO;
    return [self.visibleViewController shouldAutorotate];
    //return [[self.viewControllers lastObject] shouldAutorotate];
}

-(NSUInteger)supportedInterfaceOrientations {
    // NSLog(@"UINavigationController 200");
    return [self.visibleViewController supportedInterfaceOrientations];
    //return [[self.viewControllers lastObject] supportedInterfaceOrientations];
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    // NSLog(@"UINavigationController 300");
    return [self.visibleViewController preferredInterfaceOrientationForPresentation];
    //return [[self.viewControllers lastObject] preferredInterfaceOrientationForPresentation];
}


-(BOOL)prefersStatusBarHidden
{
    return [self.visibleViewController prefersStatusBarHidden];
    //return NO;
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
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
