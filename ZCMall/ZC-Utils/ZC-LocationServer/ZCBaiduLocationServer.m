//
//  MKBaiduLocationServer.m
//  MK
//
//  Created by 李和平 on 16/6/24.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCBaiduLocationServer.h"
#import <BaiduMapAPI_Location/BMKLocationComponent.h>
#import "ZCLocationDatahandlerProtocol.h"

@interface ZCBaiduLocationServer()<BMKLocationServiceDelegate>
{
    BMKMapManager*                          _mapManager;
    BMKLocationService*                     mLocService;
    
    BMKUserLocation*                        mPosition;
}

@property(nonatomic,assign)id<ZCLocationDatahandlerProtocol>            mLocationDataSend;

@end

@implementation ZCBaiduLocationServer
@synthesize mDelegate;
@synthesize mLocationDataSend;

-(void)setMDelegate:(id<ZCLocationServerDelegate>)mDelegate_
{
    mDelegate = mDelegate_;
    if (mPosition!=nil) {
        [self refreshLocation];
    }
}
/**
 *  刷新一次定位
 */
-(void) refreshLocation
{
    if (mPosition!=nil) {
        if (self.mDelegate &&[self.mDelegate respondsToSelector:@selector(didUpdateBMKUserLocation:)]) {
            [self.mDelegate didUpdateBMKUserLocation:mPosition];
        }
    }

}


-(id) init
{
    self = [super init];
    if (self) {
        //
        if ([self conformsToProtocol:@protocol(ZCLocationDatahandlerProtocol)]) {
            self.mLocationDataSend = (id<ZCLocationDatahandlerProtocol>)self;
        }
    }
    return self;
}

-(BMKLocationService*)MLocService
{
    if (mLocService==nil) {
        _mapManager = [[BMKMapManager alloc]init];
        BOOL ret = [_mapManager start:@"KlNCoOXgFTozIge6t3FaIUD1DZfgdsOX" generalDelegate:self];
        if (!ret) {
            NSLog(@"manager start failed!");
        }

        mLocService = [[BMKLocationService alloc] init];
        mLocService.distanceFilter = 0.01;
        mLocService.desiredAccuracy = kCLLocationAccuracyBestForNavigation;
        mLocService.delegate = self;
    }
    
    return mLocService;
}

/**
 *  开始定位
 */
-(void) startLocation
{
    //
    [[self MLocService] startUserLocationService];
}

/**
 *  停止定位
 */
-(void) stopLocation
{
    //
    [[self MLocService] stopUserLocationService];
}

/**
 *  返回是否开启了定位
 *
 *  @return 【NO/Yes】对应【未开启/开启】
 */
-(BOOL) authorizationStatus
{
    return YES;
}

/**
 *  当前是否处于定位状态
 *
 *  @return 【NO/Yes】对应【未开始定位/定位中】
 */
-(BOOL) locing
{
    return YES;
}



/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    if (self.mDelegate &&[self.mDelegate respondsToSelector:@selector(didUpdateUserHeading:)]) {
        [self.mDelegate didUpdateUserHeading:userLocation];
    }
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    if ((userLocation==nil||(userLocation.location==nil))) {
        return ;
    }
    //发送更新数据
    if (self.mLocationDataSend) {
        
//        [self.mLocationDataSend locationDataSend:[NSString stringWithFormat:@"%f",userLocation.location.coordinate.longitude] Latitude:[NSString stringWithFormat:@"%f",userLocation.location.coordinate.longitude]];
        
        [self.mLocationDataSend locationData:userLocation.location];
    }
    
    //更新回调
    if (self.mDelegate &&[self.mDelegate respondsToSelector:@selector(didUpdateBMKUserLocation:)]) {
        [self.mDelegate didUpdateBMKUserLocation:userLocation];
    }
}

/**
 *定位失败后，会调用此函数
 *@param error 错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    if (self.mDelegate &&[self.mDelegate respondsToSelector:@selector(didFailToLocateUserWithError:)]) {
        [self.mDelegate didFailToLocateUserWithError:error];
    }
}

/**
 *在将要启动定位时，会调用此函数
 */
- (void)willStartLocatingUser
{
    if (self.mDelegate &&[self.mDelegate respondsToSelector:@selector(willStartLocatingUser)]) {
        [self.mDelegate willStartLocatingUser];
    }

}

/**
 *在停止定位后，会调用此函数
 */
- (void)didStopLocatingUser
{
    if (self.mDelegate &&[self.mDelegate respondsToSelector:@selector(didStopLocatingUser)]) {
        [self.mDelegate didStopLocatingUser];
    }

}


@end
