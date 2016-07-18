//
//  MKAPPLoginHelper.m
//  MK
//
//  Created by hgh on 16/6/20.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCAPPLoginHelper.h"
#import "ZCUserDataLogic.h"
#import "ZCAppUserFactory.h"


@interface ZCAPPLoginHelper()
{
    BOOL                        mIsLogin;
    
    ZCAPPLoginModel*            mCurrentAppLoginParam;
    
}

@end

@implementation ZCAPPLoginHelper

-(id) init
{
    self = [super init];
    if (self) {
    
        mIsLogin = [[[ZCAppUserFactory shareDefault] user] archiveUable];
        
        if (mIsLogin) {
            mCurrentAppLoginParam = [[ZCAPPLoginModel alloc] init];
            mCurrentAppLoginParam.mUniqueCode =[NSString stringWithFormat:@"%ld",(long)[[ZCAppUserFactory shareDefault] user].userId];
        }
        
    }
    return self;
}

/**
 *  是否已经登录
 *
 *  @return 【yes/no】对应 【登录/未登录】
 */
-(BOOL) isLogin
{
    return mIsLogin;
}

/**
 *  退出登录
 *
 *  @param _succed 退出成功
 *  @param _error  退出失败
 */
-(void) logout:(void(^)(void))_succed Failed:(void(^)(NSString*))_error
{
    //退出登录
    //NSInteger tag = 20048;
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setObject:mCurrentAppLoginParam.mUniqueCode forKey:@"userId"];
    
    ZCAPIUser* _lg = [[ZCAPIUser alloc] init];
    [_lg postRequest:@"20048" WithParam:dic Succed:^(id arg){
        
        if (_succed) {
            _succed();
        }
        
        
        mIsLogin= NO;

        //发送 退成登录成功通知
        [[NSNotificationCenter defaultCenter] postNotificationName:NSNotification_LoginoutSucced object:nil];
        

        
    } Error:^(NSString * _er) {
            
        if (_error) {
            _error(_er);
        }
    
    }];
    
}

/**
 *  登录成功
 *
 *  @param _it 数据
 */
-(void) loginSucced:(id)_it
{
    [[[ZCAppUserFactory shareDefault] user] updataUserWithDic:_it];
    
    if (mCurrentAppLoginParam==nil) {
        mCurrentAppLoginParam = [[ZCAPPLoginModel alloc] init];
    }
    mCurrentAppLoginParam.mUniqueCode = [NSString stringWithFormat:@"%ld",(long)[[ZCAppUserFactory shareDefault] user].userId];
    mIsLogin = YES;
      
    //发送登录成功通知
    [[NSNotificationCenter defaultCenter] postNotificationName:NSNotification_LoginSucced object:nil];

}

/**
 *  登录服务器
 *
 *  @param _param  登录参数
 *  @param _succed 登录成功
 *  @param _error  登录失败
 */
-(void) login:(ZCAPPLoginModel*)_param Succed:(void(^)(void))_succed Failed:(void(^)(NSString*))_error
{
    //用户登录
    mCurrentAppLoginParam = _param;
    
    if (_param.mType==0) {
        //一般登录
        
        //NSInteger tag = 20060;
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:_param.mUniqueCode forKey:@"phone"];
        [dic setObject:_param.mPswd forKey:@"pwd"];
        [dic setObject:_param.mlongitude forKey:@"longitude"];
        [dic setObject:_param.mlatitude forKey:@"latitude"];
       
        ZCAPIUser* _lg = [[ZCAPIUser alloc] init];

        [_lg postRequest:@"20060" WithParam:dic Succed:^(id arg){
        
        
            if ([arg[@"loginCode"] isEqualToString:@"0"]) {//登录成功
                
              
                [self loginSucced:arg];
//                [[[MKAppUserFactory shareDefault] user] updataUserWithDic:arg];
//                
//               mCurrentAppLoginParam.mUniqueCode = [NSString stringWithFormat:@"%ld",[[MKAppUserFactory shareDefault] user].userId];
//                mIsLogin = YES;
                
                if (_succed) {
                    _succed();
                }
                
                //发送登录成功通知
                //[[NSNotificationCenter defaultCenter] postNotificationName:NSNotification_LoginSucced object:nil];
                
            }else {//2、用户不存在//1、登录失败，用户名与密码不匹配
                
                if (_error) {
                    _error(arg[@"loginMsg"]);
                }
            }

            
        } Error:^(NSString * _er) {
            
            if (_error) {
                _error(_er);
            }
        }];
        
        return;
    }
    
    //if (_param.mType==1) {
    //{
        //三方登录
        
        //NSInteger tag = 20061;
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        
        if (_param.mUniqueCode==nil) {
            _param.mUniqueCode = @"";
        }
        
        [dic setObject:_param.mUniqueCode forKey:@"openId"];
        [dic setObject:[NSString stringWithFormat:@"%ld",_param.mType] forKey:@"type"];
        if (_param.mlongitude == nil || _param.mlongitude.length < 1) {
            _param.mlongitude = @"-1";
        }
        [dic setObject:_param.mlongitude forKey:@"longitude"];
        if (_param.mlatitude == nil || _param.mlatitude.length < 1) {
            _param.mlatitude = @"-1";
        }
        [dic setObject:_param.mlatitude forKey:@"latitude"];
       
        ZCAPIUser* _lg = [[ZCAPIUser alloc] init];
        
        [_lg postRequest:@"20061" WithParam:dic Succed:^(id arg){
            
            
            if ([arg[@"loginCode"] isEqualToString:@"0"]) {//验证登陆成功
              
                [[[ZCAppUserFactory shareDefault] user] updataUserWithDic:arg];
                
                
                mIsLogin = YES;
                
                if (_succed) {
                    _succed();
                }
                
                //发送登录成功通知
                [[NSNotificationCenter defaultCenter] postNotificationName:NSNotification_LoginSucced object:nil];
                
            }else if ([arg[@"loginCode"] isEqualToString:@"1"]){ //1(验证登陆失败,未注册)登陆没有绑定手机号
                //去绑定手机
//                MK_LoginBindPhoneNumberViewController *bindingPhoneNumberVC = [[MK_LoginBindPhoneNumberViewController alloc] init];
//                bindingPhoneNumberVC.OpenId = snsAccount.openId;
//                bindingPhoneNumberVC.thirdType = type;
//                bindingPhoneNumberVC.headPicUrl =  snsAccount.iconURL;
//                bindingPhoneNumberVC.nickName = snsAccount.userName;
//                bindingPhoneNumberVC.gender = @"2";
//                bindingPhoneNumberVC.birthDate = @"";
//                
//                [self.navigationController pushViewController:bindingPhoneNumberVC animated:YES];
                
                
            }else{//2(未识别登录类型)
                
                if (_error) {
                    _error(arg[@"loginMsg"]);
                }
                

            }
            
        } Error:^(NSString * _er) {
            
            if (_error) {
                _error(_er);
            }
        }];

}

@end
