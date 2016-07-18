//
//  MKRequestHeaderProtocol.h
//  MK
//
//  Created by 李和平 on 16/6/17.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCRequestHeaderProtocol <NSObject>

/**
 *  返回请求头
 *
 *  @return 字典
 */
-(NSMutableDictionary*) requestHeaderById:(NSString*)_id;

@end
