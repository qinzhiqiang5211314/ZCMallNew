//
//  MKUINavigationController.h
//  MK
//
//  Created by hgh on 16/6/14.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZCUINavigationController : UINavigationController
{
    
}

/**
 *  旋转接口
 */
-(BOOL)shouldAutorotate;

/**
 *  支持的旋转方向
 */
-(NSUInteger)supportedInterfaceOrientations;

/**
 *
 */
-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation;


@end
