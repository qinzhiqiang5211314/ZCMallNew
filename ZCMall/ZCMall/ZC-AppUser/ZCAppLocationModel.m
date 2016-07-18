//
//  MKAppLocationModel.m
//  MK
//
//  Created by 李和平 on 16/6/28.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCAppLocationModel.h"

@implementation ZCAppLocationModel

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.province = @"";
        self.city = @"";
        self.subLocal = @"";
        self.address = @"";
        self.latitude = @"";
        self.longtitude = @"";
        self.cityCode = -1;
        self.level = -1;
        self.provinceCode = -1;
        self.provinceName = @"";
    }
    return self;
}

/**
 *  @author 玉伯, 15-05-14 09:05:22
 *
 *  TODO:解析地理位置
 *
 *  @param locationDict 地理位置Dict
 *
 *  @since 1.0
 */
- (void)doParserLocation:(NSDictionary *)locationDict{
    self.province = [locationDict objectForKey:@"province"];
    self.city = [locationDict objectForKey:@"city"];
    self.subLocal = [locationDict objectForKey:@"subLocal"];
    self.address = [locationDict objectForKey:@"address"];
    self.latitude = [locationDict objectForKey:@"latitude"];
    self.longtitude = [locationDict objectForKey:@"longtitude"];
    self.cityCode = [[locationDict objectForKey:@"cityCode"] integerValue];
    self.level = [[locationDict objectForKey:@"level"] integerValue];
    self.provinceName = [locationDict objectForKey:@"administrativeArea"];
    
}

/**
 *  @author 玉伯, 15-05-14 15:05:47
 *
 *  TODO:将地理位置信息转成Dict
 *
 *  @return
 *
 *  @since 1.0
 */
- (NSMutableDictionary *)locationObjToDict{
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    
    [dict setObject:self.province forKey:@"province"];
    [dict setObject:self.city forKey:@"city"];
    [dict setObject:self.subLocal forKey:@"subLocal"];
    [dict setObject:self.address forKey:@"address"];
    [dict setObject:self.latitude forKey:@"latitude"];
    [dict setObject:self.longtitude forKey:@"longtitude"];
    [dict setObject:@(self.cityCode) forKey:@"cityCode"];
    [dict setObject:@(self.level) forKey:@"level"];
    return dict;
}

- (void)setProvince:(NSString *)province{
    if (province == nil) {
        province = @"";
    }
    _province = province;
}

- (void)setCity:(NSString *)city{
    if (city == nil) {
        city = @"";
    }
    _city = city;
}

- (void)setSubLocal:(NSString *)subLocal{
    if (subLocal == nil) {
        subLocal = @"";
    }
    _subLocal = subLocal;
}

- (void)setAddress:(NSString *)address{
    if (address == nil) {
        address = @"";
    }
    _address = address;
}

- (void)setLatitude:(NSString *)latitude{
    if (latitude == nil) {
        latitude = @"";
    }
    _latitude = latitude;
}

- (void)setLongtitude:(NSString *)longtitude{
    if (longtitude == nil) {
        longtitude = @"";
    }
    _longtitude = longtitude;
}

- (void)setCityCode:(NSInteger)cityCode{
    if (cityCode <= 0) {
        cityCode = -1;
    }
    _cityCode = cityCode;
}

/**
 *  数据拷贝
 *
 *  @param _quote 拷贝的对象（把自身的数据copy给）
 */
-(void) operateCopy:(ZCAppLocationModel*)_quote
{
    _quote.province = self.province;
    _quote.city = self.city;
    _quote.subLocal = self.subLocal;
    _quote.address = self.address;
    _quote.latitude = self.latitude;
    _quote.longtitude = self.longtitude;
    _quote.cityCode = self.cityCode;
    _quote.level = self.level;
    _quote.provinceName = self.provinceName;
    _quote.provinceCode = self.provinceCode;

}


@end
