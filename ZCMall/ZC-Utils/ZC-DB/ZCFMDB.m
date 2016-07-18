//
//  MKFMDB.m
//  MEIKU
//
//  Created by hgh on 16/5/28.
//  Copyright © 2016年 Mrrck. All rights reserved.
//

#import "ZCFMDB.h"
#//define kDefaultDBName @"wudao.sqlite"

#define kDefaultDBName @"MC_DBS_1.sqlite"

@interface ZCFMDB ()
{
    NSString * _name;
}



//数据库操作对象，当数据库被建立时，会存在次至
@property (nonatomic, readonly) FMDatabase * dataBase;  // 数据库操作对象

@end


@implementation ZCFMDB

- (void) dealloc {
    [self close];
}

- (id) init {
    self = [super init];
    if (self) {
        int state = [self initializeDBWithName:kDefaultDBName];
        if (state == -1) {
            NSLog(@"数据库初始化失败");
        } else {
            NSLog(@"数据库初始化成功");
        }
    }
    return self;
}

/**
 * @brief 初始化数据库操作
 * @param name 数据库名称
 * @return 返回数据库初始化状态， 0 为 已经存在，1 为创建成功，-1 为创建失败
 */
- (int) initializeDBWithName : (NSString *) name {
    if (!name) {
        return -1;  // 返回数据库创建失败
    }
    // 沙盒Docu目录
    NSString * docp = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask, YES) objectAtIndex:0];
    _name = [docp stringByAppendingString:[NSString stringWithFormat:@"/%@",name]];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL exist = [fileManager fileExistsAtPath:_name];
    [self connect];
    if (!exist) {
        return 0;
    } else {
        return 1;          // 返回 数据库已经存在
        
    }
    
}

/// 连接数据库
- (void) connect {
    if (!_dataBase) {
        _dataBase = [[FMDatabase alloc] initWithPath:_name];
    }
    if (![_dataBase open]) {
        NSLog(@"不能打开数据库");
    }
    
    //关闭数据库
    [_dataBase close];
}
/// 关闭连接
- (void) close {
    [_dataBase close];
    // mHandle = nil;
}

// 打开数据库
- (BOOL)open
{
    if (![_dataBase open])
    {
        [_dataBase close];
        
        return NO;
    }
    
    return YES;
}

#pragma mark 删除数据库
// 删除数据库
- (void)deleteDatabse
{
    NSError *error;
    NSFileManager * fileManager = [NSFileManager defaultManager];
    BOOL exist = [fileManager fileExistsAtPath:_name];
    if (exist) {
        [_dataBase close];
        [fileManager removeItemAtPath:_name error:&error];
        
    }
}

// 判断是否存在表
- (BOOL) isTableOK:(NSString *)tableName
{
    [self open];
    FMResultSet * set = [_dataBase executeQuery:[NSString stringWithFormat:@"select count(*) from sqlite_master where type ='table' and name = '%@'",tableName]];
    
    [set next];
    
    NSInteger count = [set intForColumnIndex:0];
    
    BOOL existTable = !!count;
    [self close];
    return existTable;
}

// 获得表的数据条数
- (NSInteger) getTableItemCount:(NSString *)tableName
{
    NSString *sqlstr = [NSString stringWithFormat:@"SELECT count(*) as 'count' FROM %@", tableName];
    FMResultSet *rs = [_dataBase executeQuery:sqlstr];
    while ([rs next])
    {
        // just print out what we've got in a number of formats.
        NSInteger count = [rs intForColumn:@"count"];
        return count;
    }
    
    return 0;
}

// 删除表
- (BOOL) deleteTable:(NSString *)tableName
{
    NSString *sqlstr = [NSString stringWithFormat:@"DROP TABLE %@", tableName];
    if (![_dataBase executeUpdate:sqlstr])
    {
        // WILog(@"Delete table error!");
        return NO;
    }
    
    return YES;
}

// 清除表
//有bug，必须先open再进行操作
- (BOOL) eraseTable:(NSString *)tableName
{
    
    NSLog(@"tablename~~~%@",tableName);
    NSString *sqlstr = [NSString stringWithFormat:@"DELETE FROM %@", tableName];
    
    //[_dataBase executeUpdate:sqlstr];
    
    if (![_dataBase executeUpdate:sqlstr])
    {
        NSLog(@"Erase table error!");
        return NO;
    }
    
    return YES;
}


// 创建表
- (BOOL) createTable:(NSString *)tableName withArguments:(NSString *)arguments
{
    NSString *sqlstr = [NSString stringWithFormat:@"CREATE TABLE %@ (%@)", tableName, arguments];
    if (![_dataBase executeUpdate:sqlstr])
        //if ([DB executeUpdate:@"create table user (name text, pass text)"] == nil)
    {
        
        return NO;
    }
    
    return YES;
}


//更新
-(BOOL)UpdataExe:(NSString*)sqlUpdata
{
    
    // sqlUpdata =  [NSString stringWithCString:[sqlUpdata UTF8String] encoding:NSUnicodeStringEncoding];
    
    if ([self open]) {
        if (![_dataBase executeUpdate:sqlUpdata])
        {
            [self close];
            return NO;
        }
        [self close];
        
    }
    
    return YES;
}

-(BOOL)UpdataExe:(NSString *)sqlUpdata WithParament:(NSArray*)_array
{
    if ([self open]) {
        if (![_dataBase executeUpdate:sqlUpdata withArgumentsInArray:_array])
        {
            [self close];
            return NO;
        }
        [self close];
        
    }
    
    return YES;
}

//查询数据
-(FMResultSet*)querryTable:(NSString*)sqlQuerry
{
    if ([self open]) {
        FMResultSet *s = [_dataBase executeQuery:sqlQuerry];
        //[self close];
        
        return s;
    }
    [self close];
    
    return nil;
    
}

/**
 *  查询数据  查询完毕要关闭
 *
 *  @param sqlQuerry sql语句
 *  @param _array    对应的数据列表
 *
 *  @return 查询结果
 *///
-(FMResultSet*)querryTable:(NSString*)sqlQuerry WithParament:(NSArray*)_array
{
    if ([self open]) {
        FMResultSet *s = [_dataBase executeQuery:sqlQuerry withArgumentsInArray:_array];
        //[self close];
        
        return s;
    }
    [self close];
    
    return nil;

}


- (BOOL) isExit:(NSString*)_sql
{
    if ([self open]) {
        FMResultSet *rs = [_dataBase executeQuery:_sql];
        while ([rs next]) {
            
            [self close];
            return YES;
        }
        
    }
    [self close];
    
    return NO;
}

/**
 * 是否存在
 *
 *  @param _sql sql
 *
 *  @return [yes/no】对应【存在/不存在】
 */
- (BOOL) isExit:(NSString*)_sql WithParament:(NSArray*)_array
{
    FMResultSet* _FMSet = [self querryTable:_sql WithParament:_array];
    if (_FMSet==nil) {
        return NO;
    }
    while ([_FMSet next]) {
    
        return YES;
    }
    
    return NO;
}


// 暂时无用
#pragma mark 获得单一数据

// 整型
- (NSInteger)getDb_Integerdata:(NSString *)tableName withFieldName:(NSString *)fieldName
{
    NSInteger result = NO;
    
    NSString *sql = [NSString stringWithFormat:@"SELECT %@ FROM %@", fieldName, tableName];
    FMResultSet *rs = [_dataBase executeQuery:sql];
    if ([rs next])
        result = [rs intForColumnIndex:0];
    [rs close];
    
    return result;
}

// 布尔型
- (BOOL)getDb_Booldata:(NSString *)tableName withFieldName:(NSString *)fieldName
{
    BOOL result;
    
    result = [self getDb_Integerdata:tableName withFieldName:fieldName];
    
    return result;
}

// 字符串型
- (NSString *)getDb_Stringdata:(NSString *)tableName withFieldName:(NSString *)fieldName
{
    NSString *result = nil;
    
    NSString *sql = [NSString stringWithFormat:@"SELECT %@ FROM %@", fieldName, tableName];
    FMResultSet *rs = [_dataBase executeQuery:sql];
    if ([rs next])
        result = [rs stringForColumnIndex:0];
    [rs close];
    
    return result;
}

// 二进制数据型
- (NSData *)getDb_Bolbdata:(NSString *)tableName withFieldName:(NSString *)fieldName
{
    NSData *result = nil;
    
    NSString *sql = [NSString stringWithFormat:@"SELECT %@ FROM %@", fieldName, tableName];
    FMResultSet *rs = [_dataBase executeQuery:sql];
    if ([rs next])
        result = [rs dataForColumnIndex:0];
    [rs close];
    
    return result;
}


@end
