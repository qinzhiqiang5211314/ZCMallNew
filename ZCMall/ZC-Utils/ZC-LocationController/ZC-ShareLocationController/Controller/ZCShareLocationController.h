//
//  MKShareLocationController.h
//  MK
//
//  Created by 李和平 on 16/6/24.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCBaseViewController.h"

@interface ZCShareLocationController : ZCBaseViewController
{
    
}


/**
 *  返回当前经纬度
 */
@property(nonatomic,copy)void(^(currentLocationBlock))(NSString*,NSString*);


//大头针位置是否固定 【yes/no】对应【大头针处于初始经纬度不变/大头针位置随点击变化】
@property(nonatomic,assign)BOOL         mPinFixed;

/**
 *  初始化参数
 *
 *  @param _longitude 参数经度
 *  @param _latitue   参数纬度
 */
-(void) initParam:(NSString*)_longitude Latitue:(NSString*)_latitue;

@end
