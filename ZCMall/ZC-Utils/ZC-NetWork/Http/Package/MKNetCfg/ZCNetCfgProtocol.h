//
//  MkNetCfgProtocol.h
//  MK
//
//  Created by hgh on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCNetCfgProtocol <NSObject>

@property(nonatomic,assign,readonly)NSInteger            mTimeoutInterval;//超时时间
@property(nonatomic,assign,readonly)NSInteger            mRequestSerializerType;//请求格式
@property(nonatomic,assign,readonly)NSInteger            mResponseSerializerType;//返回数据格式


@end
