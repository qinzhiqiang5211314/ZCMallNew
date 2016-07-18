//
//  MKLocationDataHandler.h
//  MK
//
//  Created by 李和平 on 16/6/24.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCBaiduLocationServer.h"
#import "ZCLocationDatahandlerProtocol.h"

@interface ZCLocationDataHandler : ZCBaiduLocationServer<ZCLocationDatahandlerProtocol>
{
    
}

@end
