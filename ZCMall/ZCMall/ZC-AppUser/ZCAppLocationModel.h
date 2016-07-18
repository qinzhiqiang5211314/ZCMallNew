//
//  MKAppLocationModel.h
//  MK
//
//  Created by 李和平 on 16/6/28.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCAppLocationModel : NSObject

//省份
@property (nonatomic, strong) NSString *province;
//城市
@property (nonatomic, strong) NSString *city;
//区县
@property (nonatomic, strong) NSString *subLocal;
//整体位置
@property (nonatomic, strong) NSString *address;
//纬度
@property (nonatomic, strong) NSString *latitude;
//经度
@property (nonatomic, strong) NSString *longtitude;

//城市编号
@property (nonatomic, assign) NSInteger cityCode;
//城市级别
@property (nonatomic, assign) NSInteger level;
@property (nonatomic, strong) NSString  *provinceName;
@property (nonatomic, assign) NSInteger provinceCode;


/**
 *  TODO:解析地理位置
 *
 *  @param locationDict 地理位置Dict
 *
 *  @since 1.0
 */
- (void)doParserLocation:(NSDictionary *)locationDict;

/**
 *
 *  TODO:将地理位置信息转成Dict
 *
 *  @return
 *
 *  @since 1.0
 */
- (NSMutableDictionary *)locationObjToDict;


/**
 *  数据拷贝
 *
 *  @param _quote 拷贝的对象（把自身的数据copy给）
 */
-(void) operateCopy:(ZCAppLocationModel*)_quote;


@end
