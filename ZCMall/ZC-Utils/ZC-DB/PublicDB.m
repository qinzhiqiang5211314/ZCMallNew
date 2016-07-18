//
//  HPublicDB.m
//  ChinaDance
//
//  Created by hgh on 15-6-5.
//  Copyright (c) 2015年 hgh. All rights reserved.
//

#import "PublicDB.h"
#import "ZCDBFactory.h"

@interface PublicDB()
{
   
}

@end

@implementation PublicDB


- (id) init {
    self = [super init];
    if (self) {
        [self createTable];
    }
    return self;
}

//创建表
-(void) createTable
{
    NSString*   _tableNames = [self tableName];
    if (_tableNames==nil)
        return;
    
    //判断是否存在
    if ([self IsTableExists:_tableNames]) {
        return;
    }
    
    //创建表
    NSString* _createSql = [self createTableSql];
    BOOL res = [[[ZCSQLFactory shareDefault] mcsql] UpdataExe:_createSql];
    if (!res) {
        NSLog(@"创建表单失败");
    } else {
         NSLog(@"创建表单成功");
    }
}

-(BOOL) IsTableExists:(NSString*)_table
{
    return [[[ZCDBFactory shareDefault] mkdb] isTableOK:_table];
}

-(NSString*) tableName
{
    return nil;
}

-(NSString*) createTableSql
{
    return nil;
}


@end
