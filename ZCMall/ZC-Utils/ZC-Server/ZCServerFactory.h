//
//  MKServerFactory.h
//  MK
//
//  Created by 李和平 on 16/6/2.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCServerCfgProtocol.h"
#import "ZCServer.h"

@interface ZCServerFactory : NSObject
{
    
}
//返回单例对象
+ (instancetype)shareDefault;
//设置服务器配置对象
- (void)setServer:(ZCServer<ZCServerProtocol>*)_mkServer;
//设置服务器环境
- (void)setServerEnvironment:(ZCServerEnvironment)_type;
//返回服务器环境
- (ZCServerEnvironment)serverEnvironment;

//返回服务器配置对象
- (ZCServer<ZCServerProtocol>*)mkServerWithType:(ZCServerEnvironment)_type;
//返回服务器配置对象
- (ZCServer<ZCServerProtocol>*)mkServer;

@end
