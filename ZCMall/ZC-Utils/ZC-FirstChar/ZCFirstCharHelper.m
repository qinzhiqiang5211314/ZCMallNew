//
//  MKFirstCharHelper.m
//  MK
//
//  Created by 李和平 on 16/6/29.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCFirstCharHelper.h"
#import "POAPinyin.h"
//#import "MKAddressBookModel.h"

@implementation ZCFirstCharHelper

/**
 *  获取数组中所有string对象 拼音首字母_keys并返回 根据key值分类的字典
 *
 *  @param _strArray 待解析的string对象列表
 *  @param _keys     获取的所有拼音首字母
 *
 *  @return 根据key值分类的字典
 */
-(NSMutableDictionary *) pinyinFirstCharOFStrArray:(NSMutableArray*)_strArray AllKeys:(NSMutableArray*)_keys
{
    NSMutableDictionary *Buffer = [NSMutableDictionary dictionaryWithCapacity:0];
    for (NSInteger i = 0; i < _strArray.count; i++) {
        NSString *nickName = [_strArray objectAtIndex:i];
        NSString *pingname=@"";
        if (nickName.length>0) {
            if ([[nickName substringToIndex:1] integerValue]) {
                pingname=@"#";
            }else{
                pingname = [POAPinyin convert:[nickName substringToIndex:1]];
            }
        }else{
            pingname=@"#";
        }
        
        if (pingname.length>0) {
            pingname=[[pingname substringToIndex:1] uppercaseString];
        }
        
        NSMutableArray *array=[Buffer objectForKey:pingname];
        if (array==nil) array=[NSMutableArray array];
        [array addObject:[_strArray objectAtIndex:i]];
        [Buffer setObject:array forKey:pingname];
    }
    [_keys addObjectsFromArray:[Buffer allKeys]];
    [_keys sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
    return Buffer;

}


@end
