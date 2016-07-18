//
//  MKMatchPageDB.m
//  MK
//
//  Created by 李和平 on 16/6/22.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCMatchPageDB.h"

#import "MD5.h"

@interface ZCMatchPageDB()
{
    NSMutableDictionary*                    mMatchImageUrlMD5;
}

@end

@implementation ZCMatchPageDB

- (id) init {
    self = [super init];
    if (self) {
        
        
        __weak typeof(self)     _weakself = self;
        mMatchImageUrlMD5 = [[NSMutableDictionary alloc] init];
        
        
        // NSString* _sql = [self createSelectSQL:_tableName ColumnKeys:nil Condition:nil];
        
        FMResultSet* rs = [[[ZCSQLFactory shareDefault] mcsql] doSelectSQL:_tableName ColumnKeys:nil Condition:nil];
        
        while ([rs next]) {
            
            
            NSString* _url = [rs stringForColumn:@"_url"];
            NSString* _urlMD5 = [rs stringForColumn:@"_urlMD5"];
            
            
            [mMatchImageUrlMD5 setObject:_urlMD5 forKey:_url];
        }
        
        // [[DBSManager creatInstance] close];
        
    }
    return self;
}


//
-(BOOL) needUpdate:(NSString*)_str
{
    NSString* _md5 = [mMatchImageUrlMD5 objectForKey:_str];
    NSString* _nmd5 = [MD5 getmd5WithString:_str];
    
    if (_md5==nil) {
        
        //         [self updateDB:_str WithMD5:_nmd5];
        return YES;
    }
    
    //判断
    
    if ([_md5 isEqualToString:_nmd5]) {
        return NO;
    }
    
    //更换值
    //[self updateDB:_str WithMD5:_nmd5];
    
    return YES;
    
    
}

-(void) update:(NSString*)_str
{
    NSString* _nmd5 = [MD5 getmd5WithString:_str];
    [self updateDB:_str WithMD5:_nmd5];
}


-(void)updateDB:(NSString*)_str WithMD5:(NSString*)_md5
{
    //  NSString* _sql = [self createSelectSQL:_tableName ColumnKeys:nil Condition:@{@"_url":_str}];
    
    if ([[[ZCSQLFactory shareDefault] mcsql] isExit:_tableName ColumnKeys:nil Condition:nil]) {
        //存在数据 更新数据
        
        //        _sql = [self createUpdateSQL:_tableName ColumnMap:@{@"_urlMD5":_md5} Condition:@{@"_url":_str}];
        //
        //        [[DBSManager creatInstance] UpdataExe:_sql];
        
        [[[ZCSQLFactory shareDefault] mcsql] doUpdateSQL:_tableName ColumnMap:@{@"_urlMD5":_md5} Condition:@{@"_url":_str}];
        
        
        return;
    }
    
    //更新数据
    [[[ZCSQLFactory shareDefault] mcsql] doInsertSQL:_tableName ColumnMap:@{@"_urlMD5":_md5,@"_url":_str}];
    //    _sql = [self createInsertSQL:_tableName ColumnMap:@{@"_urlMD5":_md5,@"_url":_str}];
    //    [[DBSManager creatInstance] UpdataExe:_sql];
}


-(NSString*) tableName
{
    _tableName= @"LunchPageDB";
    return _tableName;
}

-(NSString*) createTableSql
{
    //流量监控的 FlowType 分别代表 视频 缓存类型   State 状态  0/1  关闭 / 打开
    NSString* _sql = @"CREATE TABLE LunchPageDB (uid INTEGER PRIMARY KEY AUTOINCREMENT  NOT NULL, _url VARCHAR(250), _urlMD5 VARCHAR(250))";
    return _sql;
}

+ (id)allocWithZone:(struct _NSZone *)zone
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mHandle=[super allocWithZone:zone];
    });
    return mHandle;
    
    //return [[self createInstance] init];
}

static ZCMatchPageDB* mHandle=nil;
+(ZCMatchPageDB*) shareDefault
{
    @synchronized(self){
        if (mHandle==nil) {
            //mHandle=[[[[self class] alloc]init ]autorelease];
            mHandle = [[super allocWithZone:NULL]init];
            //[mHandle initWithDbName:@"contacts"];
            
        }
    }
    
    return mHandle;
}


@end
