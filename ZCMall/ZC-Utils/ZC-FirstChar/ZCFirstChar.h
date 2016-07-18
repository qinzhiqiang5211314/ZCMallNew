//
//  MKFirstChar.h
//  MK
//
//  Created by 李和平 on 16/6/29.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCFirstChar <NSObject>

/**
 *  获取数组中所有string对象 拼音首字母_keys并返回 根据key值分类的字典
 *
 *  @param _strArray 待解析的string对象列表
 *  @param _keys     获取的所有拼音首字母
 *
 *  @return 根据key值分类的字典
 */
-(NSMutableDictionary *) pinyinFirstCharOFStrArray:(NSMutableArray*)_strArray AllKeys:(NSMutableArray*)_keys;

/**
 *  获取数组中所有string对象 拼音首字母_keys并返回 根据key值分类的字典
 *
 *  @param _modelArray 待解析的Model对象列表（这里只针对通讯录对象）
 *  @param _keys       获取的所有拼音首字母
 *  @param _tag        标识用于判断是否是备注名和昵称（1是备注名，非1是昵称）
 *
 *  @return 根据key值分类的字典
 */
-(NSMutableDictionary *) pinyinFirstCharOFModelArray:(NSMutableArray*)_modelArray AllKeys:(NSMutableArray*)_keys WithTag:(NSInteger)_tag;


@end
