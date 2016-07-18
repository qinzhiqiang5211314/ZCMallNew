//
//  MKAPPLoginFactory.h
//  MK
//
//  Created by hgh on 16/6/20.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCAPPLogin.h"

@interface ZCAPPLoginFactory : NSObject
{
    
}

/**
 *  单例模式
 *
 *  @return 【返回单例对象】
 */
+(ZCAPPLoginFactory *) shareDefault;

//返回登录对象
-(id<ZCAPPLogin>) appLogin;


@end
