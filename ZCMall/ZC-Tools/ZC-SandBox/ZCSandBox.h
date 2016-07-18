//
//  MKSandBox.h
//  MK
//
//  Created by 李和平 on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZCSandBox : NSObject
{
    
}

/**
 *  获取程序home目录路径
 *
 *  @return 沙盒home路径  nsstring*
 */
+(NSString*) homeDirectoryPth;

/**
 *  获取程序docment目录路径
 *
 *  @return 沙盒docment路径  nsstring*
 */
+(NSString*) documentPth;

/**
 *  获取程序library目录路径
 *
 *  @return 沙盒library路径  nsstring*
 */
+(NSString*) libraryPth;

/**
 *  获取程序tmp目录路径
 *
 *  @return 沙盒tmp路径  nsstring*
 */
+(NSString*) tmpPth;


/**
 *  获取程序docment目录路径
 *
 *  @param _indir 文件名
 *
 *  @return 沙盒docment路径  nsstring*
 */
+(NSString*) documentPthWithDir:(NSString*)_indir;

/**
 *  获取程序library目录路径
 *
 *  @param _indir 文件名
 *
 *  @return 沙盒library路径  nsstring*
 */
+(NSString*) libraryPthWithDir:(NSString*)_indir;

/**
 *  获取程序tmp目录路径
 *
 *  @param _indir 文件名
 *
 *  @return 沙盒tmp路径  nsstring*
 */
+(NSString*) tmpPthWithDir:(NSString*)_indir;

/**
 *  判断某一文件是否存在
 *
 *  @param _filepath 文件全路径地址
 *
 *  @return 【yes/no】对应【存在/不存在】
 */
+(BOOL) isFileExists:(NSString*)_filepath;

/**
 *  删除某一文件
 *
 *  @param _filepath 文件全路径地址
 *
 *  @return 【yes/no】对应【删除成功/删除失败】
 */
+(BOOL) deleteFile:(NSString*)_filepath;

/**
 *  返回根目录_path下所有文件名
 *
 *  @param _path 根目录
 *
 *  @return 返回所有文件名
 */
+(NSArray *)allSubpathsAtPath:(NSString *)_path;

/**
 *  获取文件数据
 *
 *  @param _path 文件全地址
 *
 *  @return 文件的数据流
 */
+(NSData *)GetDataByPath:(NSString *)_path;

/**
 *  根据文件名获取资源文件全路径
 *
 *  @param name 文件名
 *
 *  @return 资源文件全路径
 */
+(NSString*)resourcePathBy:(NSString *)name;

/**
 *  根据文件名及二级路径 获取资源文件全路径
 *
 *  @param name 资源文件名
 *  @param dir  文件夹名
 *
 *  @return 资源全路径
 */
+(NSString*)resourcePathBY:(NSString *)name inDir:(NSString*)dir;

/**
 *  获取资源路径
 *
 *  @param fileName 资源名
 *
 *  @return 资源路径
 */
+ (NSString *)getUI_IMG_Resources:(NSString *)fileName;


@end
