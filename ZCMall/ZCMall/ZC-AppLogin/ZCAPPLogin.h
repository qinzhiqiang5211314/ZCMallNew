//
//  MKAPPLogin.h
//  MK
//
//  Created by hgh on 16/6/20.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface ZCAPPLoginModel : NSObject
{
    
}

/**
 *  登录密码
 */
@property(nonatomic,strong)NSString*                mPswd;

/**
 *  登录唯一码  【用户名/openid】
 */
@property(nonatomic,strong)NSString*                mUniqueCode;

/**
 *  登录类型    【0/1】对应【一般登录/三方登录】
 */
@property(nonatomic,assign)NSInteger                mType;

/**
 *  经度
 */
@property(nonatomic,strong)NSString*                mlongitude;

/**
 *  维度
 */
@property(nonatomic,strong)NSString*                mlatitude;

@end



@protocol ZCAPPLogin <NSObject>

/**
 *  是否已经登录
 *
 *  @return 【yes/no】对应 【登录/未登录】
 */
-(BOOL) isLogin;


/**
 *  @author MCMac
 *
 *  是否完善信息
 *
 *  @return 【yes/no】对应 【完善/未为完善】
 */
- (BOOL) isPerfectUserInfo;

/**
 *  退出登录
 *
 *  @param _succed 退出成功
 *  @param _error  退出失败
 */
-(void) logout:(void(^)(void))_succed Failed:(void(^)(NSString*))_error;

/**
 *  登录服务器
 *
 *  @param _param  登录参数
 *  @param _succed 登录成功
 *  @param _error  登录失败
 */
-(void) login:(ZCAPPLoginModel*)_param Succed:(void(^)(void))_succed Failed:(void(^)(NSString*))_error;

/**
 *  登录成功
 *
 *  @param _it 数据
 */
-(void) loginSucced:(id)_it;

@end
