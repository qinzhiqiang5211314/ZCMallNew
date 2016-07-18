//
//  MCSQLFactory.h
//  MEIKU
//
//  Created by hgh on 16/5/28.
//  Copyright © 2016年 Mrrck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCSQL.h"

@interface ZCSQLFactory : NSObject
{
    
}

/**
 *  单例模式
 *
 *  @return 【返回单例对象】
 */
+(ZCSQLFactory *) shareDefault;

//返回数据库
-(id<ZCSQL>)mcsql;

@end
