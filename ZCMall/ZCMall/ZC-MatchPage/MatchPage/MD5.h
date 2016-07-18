//
//  MD5.h
//  MEIKU
//
//  Created by 李和平 on 16/5/23.
//  Copyright © 2016年 Mrrck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>


@interface MD5 : NSObject
//计算NSData的MD5值
+(NSString*)getMD5WithData:(NSData*)data;

//计算字符串的MD5值，
+(NSString*)getmd5WithString:(NSString*)string;

//计算大文件的MD5值
+(NSString*)getFileMD5WithPath:(NSString*)path;

@end

