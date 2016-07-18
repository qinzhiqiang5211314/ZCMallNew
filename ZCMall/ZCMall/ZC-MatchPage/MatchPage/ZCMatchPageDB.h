//
//  MKMatchPageDB.h
//  MK
//
//  Created by 李和平 on 16/6/22.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PublicDB.h"

@interface ZCMatchPageDB : PublicDB
{
    
}

/**
 *  是否需要更新
 *
 *  @param _str 图片url
 *
 *  @return 【yes/no】对应 【需要更改/不需要更改】
 */
-(BOOL) needUpdate:(NSString*)_str;

/**
 *  更新图片url
 *
 *  @param _str 图片url
 */
-(void) update:(NSString*)_str;
@end
