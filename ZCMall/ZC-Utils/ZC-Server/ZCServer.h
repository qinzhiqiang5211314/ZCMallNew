//
//  MKServer.h
//  MK
//
//  Created by 李和平 on 16/6/2.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCServerProtocol.h"
#import "ZCServerCfgProtocol.h"

@interface ZCServer : NSObject<ZCServerProtocol,ZCIMServerProtocol>
{
    
}
//服务器配置
@property (nonatomic, assign) ZCServerEnvironment               mServerEnvironmentType;


@end
