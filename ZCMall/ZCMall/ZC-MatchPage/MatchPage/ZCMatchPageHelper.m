//
//  MKMatchPageHelper.m
//  MK
//
//  Created by 李和平 on 16/6/22.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCMatchPageHelper.h"
#import "ZCMatchPageDB.h"

@interface ZCMatchPageHelper ()
{
    ZCMatchPageDB*               mMatchPageDB;
}

@end

@implementation ZCMatchPageHelper

-(ZCMatchPageDB*)mMatchPageDB
{
    if (mMatchPageDB==nil) {
        mMatchPageDB = [[ZCMatchPageDB alloc] init];
    }
    return mMatchPageDB;
}
/**
 *  更新本地赛事图
 *
 *  @param _dt <#_dt description#>
 */
-(void) updateMatchImage:(id)_dt
{
    //判断类型
    if (![_dt  isKindOfClass:[NSMutableDictionary class]]) {
        return;
    }
    NSMutableDictionary* _allDic = _dt;
    
    NSArray* _allKey = [_allDic allKeys];
    NSInteger _count = [_allKey count];
    for (NSInteger i=0; i<_count; i++) {
        NSString* _key = [_allKey objectAtIndex:i];
        NSString* _value = [_allDic objectForKey:_key];
        
        if ([[self mMatchPageDB] needUpdate:_value]) {
            //保存本地
            [self saveImage:_value Type:_key];
        }
    }

}

-(void) saveImage:(NSString*)_url Type:(NSString*)_ty
{
    //保存图片
    NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:_url]];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"lunchPic.png"]];   // 保存文件的名称
    BOOL _ye =  [UIImagePNGRepresentation([UIImage imageWithData:data])writeToFile:filePath    atomically:YES];
    if (_ye) {
        [[self mMatchPageDB] update:_url];
    }
    
}

/**
 *  返回最新赛事图
 *
 *  @return 赛事图url
 */
-(NSString*) matchImageUrl
{
    //读取路径
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES);
    NSString *filePath = [[paths objectAtIndex:0] stringByAppendingPathComponent:[NSString stringWithFormat:@"lunchPic.png"]];
    NSFileManager *fileMgr = [NSFileManager defaultManager];
    BOOL _ye = [fileMgr fileExistsAtPath:filePath];
    if (_ye) {
        return filePath;
    }
    
    return nil;

}

/**
 *  返回赛事图图片
 *
 *  @return UIimage*
 */
-(UIImage*) matchImage
{
    NSString* _path = [self matchImageUrl];
    if (_path==nil) {
        return nil;
    }
    return [UIImage imageNamed:_path];
}


@end
