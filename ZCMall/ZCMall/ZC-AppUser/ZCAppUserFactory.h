//
//  MKAppUserFactory.h
//  MK
//
//  Created by 李和平 on 16/6/21.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCAppUserModel.h"
#import "ZCAppUser.h"

@interface ZCAppUserFactory : NSObject
{
    
}

/**
 *  单例模式
 *
 *  @return 【返回单例对象】
 */
+(ZCAppUserFactory *) shareDefault;

/**
 *  返回当前用户对象
 *
 *  @return 返回用户实例
 */
-(ZCAppUserModel<ZCAppUser>*)user;


@end
