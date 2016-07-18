//
//  MKAppUserHelper.m
//  MK
//
//  Created by 李和平 on 16/6/21.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCAppUserHelper.h"
//#import "ZC"

@interface ZCAppUserHelper()
{
    BOOL                    mArchiveUsable;
}

@end

@implementation ZCAppUserHelper

/**
 *  清理 本地数据
 */
-(void) clearArchive
{
    NSString *filename = [[[[ZCCacheTool caches] fileCache] cachePath] stringByAppendingPathComponent:@"user.archive"];
    if ([ZCSandBox isFileExists:filename])
    {
        [ZCSandBox deleteFile:filename];
    }
    
    filename = [[[[ZCCacheTool caches] fileCache] cachePath] stringByAppendingPathComponent:@"location.archive"];
    if ([ZCSandBox isFileExists:filename])
    {
        [ZCSandBox deleteFile:filename];
    }
    
    //
    [self clears];
    
}

/**
 *  读取本地数据
 */
-(void) readArchive
{
    //
//    NSString *filename = [[[[ZCCacheTool caches] fileCache] cachePath] stringByAppendingPathComponent:@"user.archive"];
//    if ([ZCSandBox isFileExists:filename]) {
//        //读取文件信息
//        
//        NSData * theData =[NSData dataWithContentsOfFile:filename];
//        
//        
//        if ([theData length]>0)
//        {
//            NSKeyedUnarchiver *unArchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:theData];
//            
//            NSDictionary *dictionary_archive=[unArchiver decodeObjectForKey:NSUserDefaults_UserInform];
//            [unArchiver finishDecoding];
//            NSLog(@"%@", dictionary_archive);
//            
//            ZCAppUserModel* _md =  [[ZCDataPraseTool dataPrase] mk_ojbectWithKeyValues:dictionary_archive[@"userEntity"] WithClass:[ZCAppUserModel class] Dic:@{@"companyEntity":@"MKAPPCompanyModel"}];
//            
//            NSLog(@"%ld",_md.userId);
//            [_md operateCopy:self];
//            
//            mArchiveUsable= YES;
//            
//           // return;
//            
//        }else
//        {
//            mArchiveUsable = NO;
//        }
//        
//    }else
//    {
//        mArchiveUsable = NO;
//    }
//    
//    //读取本地定位信息
//    filename =[[[[MKCacheTool caches] fileCache] cachePath] stringByAppendingPathComponent:@"location.archive"];
//    if ([MKSandBox isFileExists:filename]) {
//        //读取文件信息
//        
//        NSData * theData =[NSData dataWithContentsOfFile:filename];
//        
//        
//        if ([theData length]>0)
//        {
//            NSKeyedUnarchiver *unArchiver=[[NSKeyedUnarchiver alloc]initForReadingWithData:theData];
//            
//            NSDictionary *dictionary_archive=[unArchiver decodeObjectForKey:NSUserDefaults_LocInform];
//            [unArchiver finishDecoding];
//            NSLog(@"%@", dictionary_archive);
//            
//            NSMutableDictionary* _dic = dictionary_archive[@"locationEntity"];
//            
//            if (self.locationDto==nil) {
//                self.locationDto = [[ZCAppLocationModel alloc] init];
//            }
//            
//            self.locationDto.province = [_dic objectForKey:@"province"];
//            self.locationDto.city = [_dic objectForKey:@"city"];
//            self.locationDto.subLocal = [_dic objectForKey:@"subLocal"];
//            self.locationDto.address = [_dic objectForKey:@"address"];
//            self.locationDto.longtitude = [_dic objectForKey:@"longtitude"];
//            self.locationDto.latitude = [_dic objectForKey:@"latitude"];
//            
//        }
//        
//    }
    

}

/**
 *  本地Archive 是否可用
 *
 *  @return 【yes/no】对应【可用/不可用】
 */
-(BOOL) archiveUable
{
    return mArchiveUsable;
}


/**
 *  更新当前用户全部信息 （公司信息及个人基本信息）
 *
 *  @param _it 用户信息字典
 *
 *  @return 是否更新用户成功  【yes/no】对应【成功/失败】
 */
-(BOOL) updataWithDic:(NSDictionary*)_it
{
    NSMutableDictionary* _dic = nil;
    if ([[_it objectForKey:@"userEntity"] isKindOfClass:[NSDictionary class]]) {
        _dic = [_it objectForKey:@"userEntity"];
        
    }else{
        _dic = [_it objectForKey:@"user"];
    }
    
    return [self saveWithDic:_dic];

}

/**
 *  更新当前用户信息
 *
 *  @param _it 用户信息字典
 *
 *  @return 是否更新用户成功  【yes/no】对应【成功/失败】
 */
-(BOOL) updataUserWithDic:(NSDictionary*)_it
{
    //保存本地
    return [self updataWithDic:_it];
    //return [self saveWithDic:(NSMutableDictionary*)_it];

}

-(BOOL) saveWithDic:(NSMutableDictionary*)_dic
{
    //保存本地
//    NSMutableDictionary *dicttttt = [NSMutableDictionary dictionaryWithCapacity:0];
//    [dicttttt setObject:_dic forKey:@"userEntity"];
//    NSMutableData *theData=[NSMutableData data];
//    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:theData];
//    [archiver encodeObject:dicttttt forKey:NSUserDefaults_UserInform];
//    [archiver finishEncoding];
//    
//    NSString *filename = [[[[MKCacheTool caches] fileCache] cachePath] stringByAppendingPathComponent:@"user.archive"];
//    
//    BOOL _ye =  [theData writeToFile:filename atomically:YES];
//    
//    if (_ye) {
//        //读取信息
//        
//        NSDictionary *itemDict = [dicttttt objectForKey:@"userEntity"];
//        if (itemDict && [itemDict isKindOfClass:[NSDictionary class]]) {
//            
//            ZCAppUserModel* _md =  [[MKDataPraseTool dataPrase] mk_ojbectWithKeyValues:itemDict WithClass:[ZCAppUserModel class] Dic:@{@"companyEntity":@"MKAPPCompanyModel"}];
//            
//            NSLog(@"xxxxxxx奶奶的--------------------%ld",_md.userId);
//            
//            [_md operateCopy:self];
//            
//        }
//    }
    
    return YES;

}


/**
 *  @author MCMac
 *
 *  更新用户的公司信息
 *
 *  @param _it 公司信息model
 *
 *  @return 【yes/no】对应【成功/失败】
 */
-(BOOL) updataCompanyWithCompanyModel:(id)_it{
    
    
    return nil;
}

/**
 *  更新本地定位信息
 *
 *  @param _dic 信息字典
 *
 *  @return yes/no】对应【成功/失败】
 */
-(BOOL) updateLocationWithDic:(NSDictionary*)_dic
{
    //
    
//    NSMutableDictionary *dicttttt = [NSMutableDictionary dictionaryWithCapacity:0];
//    [dicttttt setObject:_dic forKey:@"locationEntity"];
//    NSMutableData *theData=[NSMutableData data];
//    NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:theData];
//    [archiver encodeObject:dicttttt forKey:NSUserDefaults_LocInform];
//    [archiver finishEncoding];
//    
//    NSString *filename = [[[[MKCacheTool caches] fileCache] cachePath] stringByAppendingPathComponent:@"location.archive"];
//    
//    BOOL _ye =  [theData writeToFile:filename atomically:YES];
//    
//    if (_ye) {
//        //读取信息
//        
//        NSDictionary *itemDict = [dicttttt objectForKey:@"locationEntity"];
//        if (itemDict && [itemDict isKindOfClass:[NSDictionary class]]) {
//            
//          
//            if (self.locationDto==nil) {
//                self.locationDto = [[ZCAppLocationModel alloc] init];
//            }
//            
//            self.locationDto.province = [_dic objectForKey:@"province"];
//            self.locationDto.city = [_dic objectForKey:@"city"];
//            self.locationDto.subLocal = [_dic objectForKey:@"subLocal"];
//            self.locationDto.address = [_dic objectForKey:@"address"];
//            self.locationDto.longtitude = [_dic objectForKey:@"longtitude"];
//            self.locationDto.latitude = [_dic objectForKey:@"latitude"];
//
//        }
//    }
    
    return YES;
    
}

/**
 *  更新本地定位信息
 *
 *  @param _dic 信息字典
 *
 *  @return yes/no】对应【成功/失败】
 */

-(BOOL) updateLocationWithModel:(id)_it
{
    //
    
    return YES;
    
}



@end
