//
//  MKLocationDataHandler.m
//  MK
//
//  Created by 李和平 on 16/6/24.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCLocationDataHandler.h"
#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <sqlite3.h>

@interface ZCLocationDataHandler ()
{
    
}

@end

@implementation ZCLocationDataHandler

/**
 *  发送定位数据
 *
 *  @param _longitude 经度
 *  @param _latitue   纬度
 */
-(void)locationDataSend:(NSString*)_longitude Latitude:(NSString*)_latitue
{
    
    
}

/**
 *  定位数据处理
 *
 *  @param _loc   地位数据
 */
-(void)locationData:(id)_loc
{
//    __weak typeof(self) _weakself = self;
//    //获取定位信息
//    CLLocation* newLocation = _loc;
//    
//    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
//    [geocoder reverseGeocodeLocation: newLocation completionHandler:^(NSArray *array, NSError *error) {
//        if (array.count > 0) {
//            CLPlacemark *placemark = [array objectAtIndex:0];
//            NSString *name = placemark.name;
//            NSString *thoroughfare = placemark.thoroughfare;
//            NSString *subThoroughfare = placemark.subThoroughfare;
//            NSString *locality = placemark.locality;
//            NSString *subLocality = placemark.subLocality;
//            NSString *administrativeArea = placemark.administrativeArea;
//            NSString *subAdministrativeArea = placemark.subAdministrativeArea;
//            
//            NSMutableString *address=[NSMutableString string];
//            if(name) [address appendFormat:@"%@",name];
//            else{
//                if(thoroughfare) [address appendFormat:@"%@",thoroughfare];
//                else{
//                    if(subThoroughfare) [address appendFormat:@"%@ ",subThoroughfare];
//                    if(locality) [address appendFormat:@"%@ ",locality];
//                    if(subLocality) [address appendFormat:@"%@ ",subLocality];
//                    if(administrativeArea) [address appendFormat:@"%@ ",administrativeArea];
//                    if(subAdministrativeArea) [address appendFormat:@"%@",subAdministrativeArea];
//                }
//            }
//            NSLog(@"用户当前地址:%@-------%@",locality,address);
//            
//            //判断是不是属于国内范围,转换后的coord
//            CLLocationCoordinate2D transformCoord = newLocation.coordinate;//[self zzTransGPS:newLocation.coordinate]; //火星坐标
//            
//            double longtitude = transformCoord.longitude;
//            double latitude = transformCoord.latitude;
//            if (!locality) locality = @"";
//            
//            
//            NSDictionary *dict = @{@"province":(subAdministrativeArea == nil ? @"":subAdministrativeArea),@"city": (locality == nil ? @"":locality),@"subLocal":(subLocality == nil ? @"":subLocality), @"address": (address==nil? @"":address), @"longtitude":[NSString stringWithFormat:@"%lf",longtitude], @"latitude":[NSString stringWithFormat:@"%lf",latitude],@"administrativeArea":administrativeArea};
//            
//            NSString* _longtitude = [NSString stringWithFormat:@"%f",longtitude];
//            NSString* _latitude = [NSString stringWithFormat:@"%f",latitude];
//            
//            [_weakself locationDataSend:_longtitude Latitude:_latitude];
//            
//            //保存个人信息之 城市信息
//            [[[MKAppUserFactory shareDefault] user]  updateLocationWithDic:dict];
////            if ([[MKAppUserFactory shareDefault] user].locationDto==nil) {
////                [[MKAppUserFactory shareDefault] user].locationDto = [[MKAppLocationModel alloc] init];
////            }
////            [[[MKAppUserFactory shareDefault] user].locationDto doParserLocation:dict];
//            
//            
//            
//            [[NSUserDefaults standardUserDefaults] setObject:_longtitude forKey:@"longitude"];
//            [[NSUserDefaults standardUserDefaults] setObject:_latitude forKey:@"latitude"];
//            [[NSUserDefaults standardUserDefaults] synchronize];
//                     
//            NSLog(@"%@",[[MKAppUserFactory shareDefault] user].locationDto.city);
//            
////            self.city = locality;
////            self.latitude = latitude;
////            self.longtitude = longtitude;
////            if (weakSlef.successHandler){
////                weakSlef.successHandler(dict);
////                weakSlef.successHandler = nil;
////                [weakSlef.locationManager stopUpdatingLocation];
//            //}
//            
//        }else{
//            
//            NSLog(@"解析地址出错:-%@-",error);
////            if (self.failureHandler){
////                self.failureHandler(@"解析地址出错");
////                self.failureHandler = nil;
////                [self.locationManager stopUpdatingLocation];
//            }
//        //}
//    }];

}

-(CLLocationCoordinate2D)zzTransGPS:(CLLocationCoordinate2D)yGps
{
//    int TenLat=0;
//    int TenLog=0;
//    TenLat = (int)(yGps.latitude*10);
//    TenLog = (int)(yGps.longitude*10);
//    NSString *sql = [[NSString alloc]initWithFormat:@"select offLat,offLog from gpsT where lat=%d and log = %d",TenLat,TenLog];
//    NSLog(@"%@",sql);
//    sqlite3_stmt* stmtL = [_m_sqlite NSRunSql:sql];
//    int offLat=0;
//    int offLog=0;
//    while (sqlite3_step(stmtL)==SQLITE_ROW)
//    {
//        offLat = sqlite3_column_int(stmtL, 0);
//        offLog = sqlite3_column_int(stmtL, 1);
//        
//    }
//    
//    yGps.latitude = yGps.latitude+offLat*0.0001;
//    yGps.longitude = yGps.longitude + offLog*0.0001;
   return yGps;
    
    
}

@end
