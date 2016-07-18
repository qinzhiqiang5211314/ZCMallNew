//
//  MKAppUser.h
//  MK
//
//  Created by 李和平 on 16/6/21.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCAppUser <NSObject>

/**
 *  清理 本地数据
 */
-(void) clearArchive;

/**
 *  读取本地数据 ---程序启动需要读取本地数据
 */
-(void) readArchive;

/**
 *  本地Archive 是否可用
 *
 *  @return 【yes/no】对应【可用/不可用】
 */
-(BOOL) archiveUable;

/**
 *  更新当前用户全部信息 （公司信息及个人基本信息）
 *
 *  @param _it 用户信息字典
 *
 *  @return 是否更新用户成功  【yes/no】对应【成功/失败】
 */
-(BOOL) updataWithDic:(NSDictionary*)_it;

/**
 *  更新当前用户信息          ***不包括公司信息***
 *
 *  @param _it 用户信息字典
 *
 *  @return 是否更新用户成功  【yes/no】对应【成功/失败】
 */
-(BOOL) updataUserWithDic:(NSDictionary*)_it;

/**
 *  更新本地定位信息
 *
 *  @param _dic 信息字典
 *
 *  @return yes/no】对应【成功/失败】
 */
-(BOOL) updateLocationWithDic:(NSDictionary*)_dic;

/**
 *  更新本地定位信息
 *
 *  @param _dic 信息字典
 *
 *  @return yes/no】对应【成功/失败】
 */

-(BOOL) updateLocationWithModel:(id)_it;



@end
