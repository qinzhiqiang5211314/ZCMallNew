//
//  MKRequestLogic.m
//  MK
//
//  Created by 李和平 on 16/6/17.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCRequestLogic.h"
#import "ZCRequestHeaderProtocol.h"
#import "ZCRequestLogicModuleProtocal.h"
#import "ZCHttpTool.h"
#import "ZCGZIPHelper.h"
#import "ZCEncryptionHelper.h"


@interface ZCRequestLogic()
{
    
}

@property(nonatomic,strong)id                                       mRqst;
@property(nonatomic,weak)id<ZCRequestHeaderProtocol>                mRequestHeader;
@property(nonatomic,weak)id<ZCRequestLogicModuleProtocal>           mRequestModule;


@end


@implementation ZCRequestLogic
@synthesize mRqst;
@synthesize mGZIP;
@synthesize mEncryption;

-(id<ZCEncryption>)mEncryption
{
    if (mEncryption==nil) {
        mEncryption = [[ZCEncryptionHelper alloc] init];
    }
    
    return mEncryption;
}

-(id<ZCGZIP>)mGZIP
{
    if (mGZIP==nil) {
        mGZIP = [[ZCGZIPHelper alloc] init];
    }
    
    return mGZIP;

}


-(id) init
{
    self = [super init];
    if (self) {
        
        if ([self conformsToProtocol:@protocol(ZCRequestHeaderProtocol)]) {
            self.mRequestHeader = (id<ZCRequestHeaderProtocol>)self;
        }
        
        if ([self conformsToProtocol:@protocol(ZCRequestLogicModuleProtocal)]) {
            self.mRequestModule = (id<ZCRequestLogicModuleProtocal>)self;
        }
    }
    
    return self;
}


/**
 *  post请求
 *
 *  @param _requestId 请求id
 *  @param _param    参数
 *  @param _response 返回数据
 *  @param _error    错误信息
 *
 *  @return 请求线程
 */
-(id) postRequest:(NSString*)_requestId WithParam:(NSDictionary*)_param Succed:(void(^)(id))_response Error:(void(^)(NSString*))_error
{
    //获取文件头
    NSMutableDictionary* _dic = [self.mRequestHeader requestHeaderById:_requestId];
    
    //添加加密body
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:_param options:NSJSONWritingPrettyPrinted error:&parseError];
    
    NSString *des=[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *str =des;
    if ([_dic[@"secretFlag"] integerValue] == 1) {
         str =[self.mEncryption encryption:des];
    }
    
    //    NSLog(@"加密：%@",str);
    [_dic setObject:str forKey:@"body"];

    
    //合成参数
    NSMutableDictionary *queryDict = [NSMutableDictionary dictionary];
    NSData *_jData = [NSJSONSerialization dataWithJSONObject:_dic options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *_des=[[NSString alloc] initWithData:_jData encoding:NSUTF8StringEncoding];
    [queryDict setObject:_des forKey:@"params"];
    

    
    //网络请求
    NSObject<ZCHttp>* _rqst = [ZCHttpTool httpRequest];
    self.mRqst = _rqst;
    ZCHTTPTask* _task = [[ZCHTTPTask alloc] init];
    _task.mbody  =queryDict;
    _task.mRequestMethod = MKHTTPREQUSTMETHOD_Post;
    _task.mUrl = [self.mRequestModule logicReqMapping];
    return [_rqst httpRequest:_task complete:^(ZCHTTPTask* _it){
        

        if (_it.mResponse==nil) {
            if (_error) {
                _error(_it.mErrorString);
                return;
            }
        }
        
        id jsonDict = _it.mResponse;
        
        if (jsonDict && [jsonDict isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *headerDict = [jsonDict objectForKey:@"header"];
            if (headerDict && [headerDict isKindOfClass:[NSDictionary class]]) {
                NSInteger retStatus = [[headerDict objectForKey:@"retStatus"] integerValue];
                
                if (![self checkWhetherTheSingleSignOnWithJsessionId:headerDict]) {
                    return;
                }
                
                if (retStatus == 0) {
                    //成功
                    //获取返回的数据包体
                    NSString *bodyDict = [jsonDict objectForKey:@"body"];
                    NSInteger flag = [[headerDict objectForKey:@"secretFlag"] integerValue];
                    NSDictionary *responseJSON;//=[NSDictionary dictionary];
                    if (flag==1) {
                        NSString *str = [self.mEncryption decrypt:bodyDict];//[DES3Util decrypt:bodyDict];
                        //                    NSLog(@"加密：%@",str);
                        NSData *JSONData = [str dataUsingEncoding:NSUTF8StringEncoding];
                        responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
                    }else{
                        responseJSON=[jsonDict objectForKey:@"body"];
                    }
                    
                    if (_response) {
                        _response(responseJSON);
                    }
                    if ([headerDict[@"businessId"] integerValue] ==  20037 || [headerDict[@"businessId"] integerValue] == 20043 || 20044 == [headerDict[@"businessId"] integerValue] || 20039 == [headerDict[@"businessId"] integerValue] || 20060 == [headerDict[@"businessId"] integerValue] || 20061 == [headerDict[@"businessId"] integerValue] || [headerDict[@"businessId"] integerValue] == 20062 ||[headerDict[@"businessId"] integerValue] ==20063) {
                        
                        
//                        [[NSUserDefaults standardUserDefaults] setObject:headerDict[NSUserDefaults_Gps_wdcli] forKey:NSUserDefaults_Gps_wdcli];
//                        [[NSUserDefaults standardUserDefaults] synchronize];
                        /**
                         *  @author Mrrck
                         *
                         *  归档存储用户信息
                         */
                        //                    NSMutableData *theData=[NSMutableData data];
                        //                    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:theData];
                        //                    [archiver encodeObject:responseJSON forKey:NSUERDEFOUS_UserINFO];
                        //                    [archiver finishEncoding];
                        //                   [theData writeToFile:[__PATH_CACHE__ stringByAppendingPathComponent:@"user.archive"] atomically:YES];
                        
                       // [AppData saveTheUserInformationAction:responseJSON];
                    }
                }else{
                    //失败
                    //获取失败信息
                    NSString *retMessage = [headerDict objectForKey:@"retMessage"];
                    if (_error) {
                        _error([NSString stringWithFormat:@"%ld: %@",(long)retStatus, retMessage]);
                    }
                }
            }else{
                if (_error) {
                    _error(@"服务器数据错误，请稍后再试");
                }
            }
        }else{
            if (_error) {
                _error(@"服务器数据错误，请稍后再试");
            }
        }
        
    }];
    
}

/**
 *  @author Mrrck
 *
 *  校验是否在另一个地方登陆,,
 */

- (BOOL)checkWhetherTheSingleSignOnWithJsessionId:(NSDictionary *)dic{
//    
//    if (![[[MKAPPLoginFactory shareDefault] appLogin] isLogin] || [dic[NSUserDefaults_Gps_wdcli] isEqualToString:@""]) {
//        return YES;
//    }else{
//        if ([dic[@"businessId"] integerValue] == 20048 ) {
//            [[NSUserDefaults standardUserDefaults] setObject:@"" forKey:NSUserDefaults_Gps_wdcli];
//            [[NSUserDefaults standardUserDefaults] synchronize];
//            return YES;
//        }
//        NSString *ss = [[NSUserDefaults standardUserDefaults] objectForKey:NSUserDefaults_Gps_wdcli];
//        NSLog(@"%@=-=--==%@", ss, dic[NSUserDefaults_Gps_wdcli]);
//        NSLog(@"%@", dic[@"jsessionId"]);
//        if ([dic[NSUserDefaults_Gps_wdcli] isEqualToString:ss]) {
//            return YES;
//        }else {
//            if ([[NSUserDefaults standardUserDefaults] boolForKey:NSNotification_LoginAbnormal] == NO) {
//                [[NSNotificationCenter defaultCenter] postNotificationName:NSNotification_LoginAbnormal object:self];
//                [[NSUserDefaults standardUserDefaults] setBool:YES forKey:NSNotification_LoginAbnormal];
//                [[NSUserDefaults standardUserDefaults] synchronize];
//            }
//            return NO;
//        }
 //   }
    
    return NO;
}


/**
 *  post请求
 *
 *  @param _requestId 请求id
 *  @param _param    参数
 *  @param _buffs    上传图片视频流
 *  @param _response 返回数据
 *  @param _error    错误信息
 *
 *  @return 请求线程
 */
-(id) postRequest:(NSString*)_requestId WithParam:(NSDictionary*)_param WithFileForm:(NSMutableArray*)_buffs Succed:(void(^)(id))_response Error:(void(^)(NSString*))_error
{
    //获取文件头
    NSMutableDictionary* _dic = [self.mRequestHeader requestHeaderById:_requestId];
    
    //添加加密body
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:_param options:NSJSONWritingPrettyPrinted error:&parseError];
    
    NSString *des=[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *str =des;
    if ([_dic[@"secretFlag"] integerValue] == 1) {
        str =[self.mEncryption encryption:des];
    }
    
    //    NSLog(@"加密：%@",str);
    [_dic setObject:str forKey:@"body"];
    
    
    //合成参数
    NSMutableDictionary *queryDict = [NSMutableDictionary dictionary];
    NSData *_jData = [NSJSONSerialization dataWithJSONObject:_dic options:NSJSONWritingPrettyPrinted error:&parseError];
    NSString *_des=[[NSString alloc] initWithData:_jData encoding:NSUTF8StringEncoding];
    [queryDict setObject:_des forKey:@"params"];
    
    
    
    //网络请求
    NSObject<ZCHttpUpload>* _rqst = [ZCHttpTool uploadTask];
    self.mRqst = _rqst;
    ZCHTTPTask* _task = [[ZCHTTPTask alloc] init];
    _task.mbody  =queryDict;
    _task.mRequestMethod = MKHTTPREQUSTMETHOD_Post;
    _task.mUrl = [self.mRequestModule logicReqMapping];
    
    return [_rqst startTask:_task WithFileDatas:_buffs Complete:^(ZCHTTPTask* _it){
        
        
        if (_it.mResponse==nil) {
            if (_error) {
                _error(_it.mErrorString);
                return;
            }
        }
        
        id jsonDict = _it.mResponse;
        
        if (jsonDict && [jsonDict isKindOfClass:[NSDictionary class]]) {
            NSMutableDictionary *headerDict = [jsonDict objectForKey:@"header"];
            if (headerDict && [headerDict isKindOfClass:[NSDictionary class]]) {
                NSInteger retStatus = [[headerDict objectForKey:@"retStatus"] integerValue];
                
                if (![self checkWhetherTheSingleSignOnWithJsessionId:headerDict]) {
                    return;
                }
                
                if (retStatus == 0) {
                    //成功
                    //获取返回的数据包体
                    NSString *bodyDict = [jsonDict objectForKey:@"body"];
                    NSInteger flag = [[headerDict objectForKey:@"secretFlag"] integerValue];
                    NSDictionary *responseJSON;//=[NSDictionary dictionary];
                    if (flag==1) {
                        NSString *str = [self.mEncryption decrypt:bodyDict];//[DES3Util decrypt:bodyDict];
                        //                    NSLog(@"加密：%@",str);
                        NSData *JSONData = [str dataUsingEncoding:NSUTF8StringEncoding];
                        responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
                    }else{
                        responseJSON=[jsonDict objectForKey:@"body"];
                    }
                    
                    if (_response) {
                        _response(responseJSON);
                    }
                    if ([headerDict[@"businessId"] integerValue] ==  20037 || [headerDict[@"businessId"] integerValue] == 20043 || 20044 == [headerDict[@"businessId"] integerValue] || 20039 == [headerDict[@"businessId"] integerValue] || 20060 == [headerDict[@"businessId"] integerValue] || 20061 == [headerDict[@"businessId"] integerValue] || [headerDict[@"businessId"] integerValue] == 20062 ||[headerDict[@"businessId"] integerValue] ==20063) {
                        
                        
                        [[NSUserDefaults standardUserDefaults] setObject:headerDict[@"jsessionId"] forKey:@"jsessionId"];
                        [[NSUserDefaults standardUserDefaults] synchronize];
                        /**
                         *  @author Mrrck
                         *
                         *  归档存储用户信息
                         */
                        //                    NSMutableData *theData=[NSMutableData data];
                        //                    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:theData];
                        //                    [archiver encodeObject:responseJSON forKey:NSUERDEFOUS_UserINFO];
                        //                    [archiver finishEncoding];
                        //                   [theData writeToFile:[__PATH_CACHE__ stringByAppendingPathComponent:@"user.archive"] atomically:YES];
                        
                        // [AppData saveTheUserInformationAction:responseJSON];
                    }
                }else{
                    //失败
                    //获取失败信息
                    NSString *retMessage = [headerDict objectForKey:@"retMessage"];
                    if (_error) {
                        _error([NSString stringWithFormat:@"%ld: %@",(long)retStatus, retMessage]);
                    }
                }
            }else{
                if (_error) {
                    _error(@"服务器数据错误，请稍后再试");
                }
            }
        }else{
            if (_error) {
                _error(@"服务器数据错误，请稍后再试");
            }
        }
        
    }];
    

}


@end
