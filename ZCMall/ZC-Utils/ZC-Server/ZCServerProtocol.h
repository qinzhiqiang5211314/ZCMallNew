//
//  MKServerProtocol.h
//  MK
//
//  Created by 李和平 on 16/6/2.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCServerProtocol <NSObject>


//服务器域名
@property(nonatomic,strong,readonly)NSString*                   mApiBaseUrl;//apiurl
//加密文件
@property(nonatomic,strong,readonly)NSString*                   mPublicCipherKey;
//解密钥匙
@property(nonatomic,strong,readonly)NSString*                   mPrivateCipherKey;


@end


@protocol ZCIMServerProtocol <NSObject>


//ip地址
@property(nonatomic,strong,readonly)NSString*                   mIp;
//域名
@property(nonatomic,strong,readonly)NSString*                   mDomain;
//端口号
@property(nonatomic,strong,readonly)NSString*                   mPort;

//资源
@property(nonatomic,strong,readonly)NSString*                   mResource;


@end
