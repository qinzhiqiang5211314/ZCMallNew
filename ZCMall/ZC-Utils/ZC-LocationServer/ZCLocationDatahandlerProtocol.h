//
//  MKLocationDatahandler.h
//  MK
//
//  Created by 李和平 on 16/6/24.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCLocationDatahandlerProtocol <NSObject>

/**
 *  发送定位数据
 *
 *  @param _longitude 经度
 *  @param _latitue   纬度
 */
-(void)locationDataSend:(NSString*)_longitude Latitude:(NSString*)_latitue;

/**
 *  定位数据处理
 *
 *  @param _loc   地位数据
 */
-(void)locationData:(id)_loc;

@end


