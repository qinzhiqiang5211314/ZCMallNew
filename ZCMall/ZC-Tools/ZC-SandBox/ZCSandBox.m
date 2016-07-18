//
//  MKSandBox.m
//  MK
//
//  Created by 李和平 on 16/6/11.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCSandBox.h"

@implementation ZCSandBox

/**
 *  获取程序home目录路径
 *
 *  @return 沙盒home路径  nsstring*
 */
+(NSString*) homeDirectoryPth
{
    return NSHomeDirectory();
}

/**
 *  获取程序docment目录路径
 *
 *  @return 沙盒docment路径  nsstring*
 */
+(NSString*) documentPth
{
    NSArray *Paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path=[Paths objectAtIndex:0];
    return path;
}

/**
 *  获取程序library目录路径
 *
 *  @return 沙盒library路径  nsstring*
 */
+(NSString*) libraryPth
{
    NSArray *Paths=NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    NSString *path=[Paths objectAtIndex:0];
    return path;
}

/**
 *  获取程序tmp目录路径
 *
 *  @return 沙盒tmp路径  nsstring*
 */
+(NSString*) tmpPth
{
    return NSTemporaryDirectory();
}

/**
 *  获取程序docment目录路径
 *
 *  @param _indir 文件夹名
 *
 *  @return 沙盒docment路径  nsstring*
 */
+(NSString*) documentPthWithDir:(NSString*)_indir
{
    NSError* error;
    NSString* path = [[self documentPth] stringByAppendingPathComponent:_indir];
    if(![[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error])
    {
        NSLog(@"create dir error: %@",error.debugDescription);
    }
    return path;
}

/**
 *  获取程序library目录路径
 *
 *  @param _indir  文件夹名
 *
 *  @return 沙盒library路径  nsstring*
 */
+(NSString*) libraryPthWithDir:(NSString*)_indir
{
    NSError* error;
    NSString* path = [[self libraryPth] stringByAppendingPathComponent:_indir];
    path = [path stringByAppendingString:@"/"];
    if(![[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error])
    {
        NSLog(@"create dir error: %@",error.debugDescription);
    }
    return path;

}

/**
 *  获取程序tmp目录路径
 *
 *  @param _indir  文件夹名
 *
 *  @return 沙盒tmp路径  nsstring*
 */
+(NSString*) tmpPthWithDir:(NSString*)_indir
{
    NSError* error;
    NSString* path = [[self tmpPth] stringByAppendingPathComponent:_indir];
    if(![[NSFileManager defaultManager] createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:&error])
    {
        NSLog(@"create dir error: %@",error.debugDescription);
    }
    return path;

}


/**
 *  判断某一文件是否存在
 *
 *  @param _filepath 文件全路径地址
 *
 *  @return 【yes/no】对应【存在/不存在】
 */
+(BOOL) isFileExists:(NSString*)_filepath
{
    return [[NSFileManager defaultManager] fileExistsAtPath:_filepath];
}

/**
 *  删除某一文件
 *
 *  @param _filepath 文件全路径地址
 *
 *  @return 【yes/no】对应【删除成功/删除失败】
 */
+(BOOL) deleteFile:(NSString*)_filepath
{
    if([[NSFileManager defaultManager]fileExistsAtPath:_filepath])
    {
       return [[NSFileManager defaultManager] removeItemAtPath:_filepath error:nil];
    }

    return YES;
}

/**
 *  返回根目录_path下所有文件名
 *
 *  @param _path 根目录
 *
 *  @return 返回所有文件名
 */
+(NSArray *)allSubpathsAtPath:(NSString *)_path
{
    NSFileManager *fileManage=[NSFileManager defaultManager];
    NSArray *file=[fileManage subpathsAtPath:_path];
    return file;

}

/**
 *  获取文件数据
 *
 *  @param _path 文件全地址
 *
 *  @return 文件的数据流
 */
+(NSData *)GetDataByPath:(NSString *)_path
{
    return [[NSFileManager defaultManager] contentsAtPath:_path];
}

/**
 *  根据文件名获取资源文件全路径
 *
 *  @param name 文件名
 *
 *  @return 资源文件全路径
 */
+(NSString*)resourcePathBy:(NSString *)_name
{
    return [[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:_name];
}

/**
 *  根据文件名及二级路径 获取资源文件全路径
 *
 *  @param name 资源文件名
 *  @param dir  文件夹名
 *
 *  @return 资源全路径
 */
+(NSString*)resourcePathBY:(NSString *)_name inDir:(NSString*)_dir
{
    return [[[NSBundle mainBundle].resourcePath stringByAppendingPathComponent:_dir] stringByAppendingPathComponent:_name];
}


/**
 *  获取资源路径
 *
 *  @param fileName 资源名
 *
 *  @return 资源路径
 */
+ (NSString *)getUI_IMG_Resources:(NSString *)fileName{
    CGFloat scale = [[UIScreen mainScreen] scale];
    if (scale >= 3.0) {
        return [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@3x.png",fileName] ofType:nil];
    }else if(scale == 2.0){
        return [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@@2x.png",fileName] ofType:nil];
    }else{
        return [[NSBundle mainBundle] pathForResource:[NSString stringWithFormat:@"%@.png",fileName] ofType:nil];
    }
}



@end
