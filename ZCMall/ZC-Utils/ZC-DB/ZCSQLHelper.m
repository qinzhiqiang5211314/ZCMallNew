//
//  MCSQLHelper.m
//  MEIKU
//
//  Created by hgh on 16/5/28.
//  Copyright © 2016年 Mrrck. All rights reserved.
//

#import "ZCSQLHelper.h"
#import "ZCDBFactory.h"

@implementation ZCSQLHelper

/**
 *  生成查询语句并返回查询结果
 *
 *  @param tablename     表名
 *  @param column_list   表单列关键字
 *  @param condition_map 查询条件关键字
 *
 *  @return 查询结果
 */
-(FMResultSet*) doSelectSQL:(NSString*)tablename ColumnKeys:(NSArray*)column_list Condition:(NSDictionary*)condition_map
{
    if (tablename == nil) {
        return nil;
    }
    NSString *sqlString = @"select";
    
    NSString *fields = @"";
    
    if (column_list == nil || [column_list count]<1) {
        fields = @" * ";
    } else {
        for (int i = 0; i<[column_list count]; i++) {
            NSString *seperator = [fields length]<1?@" ":@",";
            fields = [[fields stringByAppendingString:seperator] stringByAppendingString:[column_list objectAtIndex:i]];
        }
        
        fields = [fields stringByAppendingString:@" "];
    }
    
    sqlString = [sqlString stringByAppendingString:fields];
    sqlString = [sqlString stringByAppendingString:@"from "];
    sqlString = [sqlString stringByAppendingString:tablename];
    
    if (condition_map == nil || [condition_map count]<1) {
        return [self querryTable:sqlString];
    }
    sqlString = [sqlString stringByAppendingString:@" where "];
    
    NSString *conditions = @"";
    NSMutableArray* _varray = [[NSMutableArray alloc] init];
    
    for (int j =0; j < [[condition_map allKeys] count]; j++) {
        
        NSString *key = [[condition_map allKeys] objectAtIndex:j];
        NSString *value = [condition_map objectForKey:key];
        
        if (j==([[condition_map allKeys] count]-1)) {
            conditions = [NSString stringWithFormat:@"%@ %@ = ?",conditions,key];
        }else
            conditions = [NSString stringWithFormat:@"%@ %@ = ? and ",conditions,key];

        [_varray addObject:value];
    }
    
    sqlString = [sqlString stringByAppendingString:conditions];
    
    return [self querryTable:sqlString WithParament:_varray];

}


/**
 *  生成查询语句并返回查询结果
 *
 *  @param tablename     表名
 *  @param column_list   表单列关键字
 *  @param condition_map 查询条件关键字
 *  @param _limit 限制条件
 *
 *  @return 查询结果
 */
-(FMResultSet*) doSelectSQL:(NSString*)tablename ColumnKeys:(NSArray*)column_list Condition:(NSDictionary*)condition_map WithLimit:(NSString*)_limit
{
    if (tablename == nil) {
        return nil;
    }
    NSString *sqlString = @"select";
    
    NSString *fields = @"";
    
    if (column_list == nil || [column_list count]<1) {
        fields = @" * ";
    } else {
        for (int i = 0; i<[column_list count]; i++) {
            NSString *seperator = [fields length]<1?@" ":@",";
            fields = [[fields stringByAppendingString:seperator] stringByAppendingString:[column_list objectAtIndex:i]];
        }
        
        fields = [fields stringByAppendingString:@" "];
    }
    
    sqlString = [sqlString stringByAppendingString:fields];
    sqlString = [sqlString stringByAppendingString:@"from "];
    sqlString = [sqlString stringByAppendingString:tablename];
    
    if (condition_map == nil || [condition_map count]<1) {
        return [self querryTable:sqlString];
    }
    sqlString = [sqlString stringByAppendingString:@" where "];
    
    NSString *conditions = @"";
    NSMutableArray* _varray = [[NSMutableArray alloc] init];
    
    for (int j =0; j < [[condition_map allKeys] count]; j++) {
        
        NSString *key = [[condition_map allKeys] objectAtIndex:j];
        NSString *value = [condition_map objectForKey:key];
        
        if (j==([[condition_map allKeys] count]-1)) {
            conditions = [NSString stringWithFormat:@"%@ %@ = ?",conditions,key];
        }else
            conditions = [NSString stringWithFormat:@"%@ %@ = ? and ",conditions,key];
        
        [_varray addObject:value];
    }
    
    sqlString = [sqlString stringByAppendingString:conditions];
    
    sqlString = [sqlString stringByAppendingString:_limit];
    
    return [self querryTable:sqlString WithParament:_varray];
}

/**
 *  生成更新语句并执行
 *
 *  @param tablename     表名
 *  @param value_map     表单列关键字及对应值
 *  @param condition_map 条件关键字
 *
 *  @return 是否更新成功
 */
-(BOOL) doUpdateSQL:(NSString*)tablename ColumnMap:(NSDictionary*)value_map Condition:(NSDictionary*)condition_map
{
    if (tablename == nil || value_map == nil) {
        return NO;
    }
    NSString *sqlString = @"update ";
    
    sqlString = [sqlString stringByAppendingString:tablename];
    
    sqlString = [sqlString stringByAppendingString:@" set"];
    
    
    NSMutableArray* _varray = [[NSMutableArray alloc] init];
    for (int i = 0; i<[[value_map allKeys] count]; i++) {
        
        NSString *key = [[value_map allKeys] objectAtIndex:i];
        
        if (i==([[value_map allKeys] count]-1)) {
            sqlString = [NSString stringWithFormat:@"%@ %@ = ?",sqlString,key];
        }else
            sqlString = [NSString stringWithFormat:@"%@ %@ = ?,",sqlString,key];
        [_varray addObject:[value_map objectForKey:key]];
    }
    
    sqlString = [sqlString stringByAppendingString:@" where"];
    NSLog(@"%@",sqlString);
    
    //拼接条件
    for (int i = 0; i<[[condition_map allKeys] count]; i++) {
        
        
        NSString *key = [[condition_map allKeys] objectAtIndex:i];
        
        if (i==([[condition_map allKeys] count]-1)) {
            sqlString = [NSString stringWithFormat:@"%@ %@ = ?",sqlString,key];
        }else
            sqlString = [NSString stringWithFormat:@"%@ %@ = ? and ",sqlString,key];
        
        [_varray addObject:[condition_map objectForKey:key]];
        
    }
    
    return [self UpdataExe:sqlString WithParament:_varray];

}

/**
 *  生成插入语句并执行
 *
 *  @param tablename 表名
 *  @param value_map 表单列关键字
 *
 *  @return 是否更新成功
 */
-(BOOL) doInsertSQL:(NSString*)tablename ColumnMap:(NSDictionary*)value_map
{
    if (tablename == nil || value_map == nil) {
        return NO;
    }
    
    
    
    NSString *sqlString = @"insert into ";
    sqlString = [sqlString stringByAppendingString:tablename];
    sqlString = [sqlString stringByAppendingString:@" ("];
    
    NSString *keyString = @"";
    
    for (int i = 0 ; i<[[value_map allKeys] count]; i++) {
        NSString *seperator = [keyString length]<1?@"":@",";
        NSString *key = [[value_map allKeys] objectAtIndex:i];
        keyString = [[keyString stringByAppendingString:seperator] stringByAppendingString:key];
    }
    sqlString = [sqlString stringByAppendingString:keyString];
    sqlString = [sqlString stringByAppendingString:@") values ("];
    
    //拼问号
    NSMutableArray* _varray = [[NSMutableArray alloc] init];
    NSInteger _ct = [[value_map allKeys] count];
    for (NSInteger i=0; i<_ct; i++) {
        if (i==_ct-1) {
            sqlString = [sqlString stringByAppendingString:@" ?)"];
        }else
            sqlString = [sqlString stringByAppendingString:@" ?,"];
        
        [_varray addObject:[value_map objectForKey:[[value_map allKeys] objectAtIndex:i]]];
    }
    
    //
    return [self UpdataExe:sqlString WithParament:_varray];

}

/**
 *  生成删除语句并删除
 *
 *  @param tablename     表名
 *  @param condition_map 删除条件关键字
 *
 *  @return 是否删除成功
 */
-(BOOL) doDeleteSQL:(NSString*)tablename Condition:(NSDictionary*)condition_map
{
    if (tablename == nil) {
        return NO;
    }
    NSString *sqlString = @"delete from ";
    sqlString = [sqlString stringByAppendingString:tablename];
    
    if (condition_map == nil || [condition_map count]<1) {
        return NO;
    }
    sqlString = [sqlString stringByAppendingString:@" where "];
    
    NSString *conditions = @"";
    NSMutableArray* _varray = [[NSMutableArray alloc] init];
    
    for (int j =0; j < [[condition_map allKeys] count]; j++) {
        
        NSString *key = [[condition_map allKeys] objectAtIndex:j];
        NSString *value = [condition_map objectForKey:key];
        
        if (j==([[condition_map allKeys] count]-1)) {
            conditions = [NSString stringWithFormat:@"%@ %@ = ?",conditions,key];
        }else
            conditions = [NSString stringWithFormat:@"%@ %@ = ? and ",conditions,key];
        
        [_varray addObject:value];

    }
    
    sqlString = [sqlString stringByAppendingString:conditions];

    return [self UpdataExe:sqlString WithParament:_varray];
}

/**
 *  返回是否含有该条目
 *
 *  @param tablename     表名
 *  @param column_list   列关键字
 *  @param condition_map 条件
 *
 *  @return 是否存在
 */
-(BOOL) isExit:(NSString*)tablename ColumnKeys:(NSArray*)column_list Condition:(NSDictionary*)condition_map
{
    //
    FMResultSet* _FmSet = [self doSelectSQL:tablename ColumnKeys:column_list Condition:condition_map];
    if (_FmSet==nil) {
        return NO;
    }
    
    while ([_FmSet next]) {
        
        return YES;
    }
    
    return NO;

}

/**
 *  更新表数据
 *
 *  @param sqlUpdata  sql语句
 *
 *  @return 【yes/no】对应【成功/失败】
 *///更新
-(BOOL)UpdataExe:(NSString*)sqlUpdata
{
    return [[[ZCDBFactory shareDefault] mkdb] UpdataExe:sqlUpdata];
}

/**
 *  更新表数据
 *
 *  @param sqlUpdata sql语句
 *  @param _array    对应的数据列表
 *
 *  @return 【yes/no】对应【成功/失败】
 */
-(BOOL)UpdataExe:(NSString *)sqlUpdata WithParament:(NSArray*)_array
{
    return [[[ZCDBFactory shareDefault] mkdb] UpdataExe:sqlUpdata WithParament:_array];
}

/**
 *  查询数据  查询完毕要关闭
 *
 *  @param sqlQuerry sql语句
 *
 *  @return 查询结果
 *///
-(FMResultSet*)querryTable:(NSString*)sqlQuerry
{
    return [[[ZCDBFactory shareDefault] mkdb] querryTable:sqlQuerry];
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
    return [[[ZCDBFactory shareDefault] mkdb] querryTable:sqlQuerry WithParament:_array];
}

//
//    NSString*insertSql=@"insert into uploadDB (userId,picurl,videotitle,vid,videolocation,publishtime,dancetype,duration,videopath,danceNum) values(?,?,?,?,?,?,?,?,?,?)";
//
//
//    //conment* con=_DeskArray[i];
//
//
//    //mypic,subject,region,shoottime,dancetype,duration,pathurl
//    NSString*userId=userid;
//
//    NSString *picUrl= [mydic objectForKey:@"mypic"];
//    NSString *videotitle= [mydic objectForKey:@"subject"];
//    NSString *videolocation= [mydic objectForKey:@"region"];
//    NSString *publishtime= [self getTime:[mydic objectForKey:@"shoottime"]];
//
//    NSString* vid = [mydic objectForKey:@"vid"];
//    NSString *dancetype= [mydic objectForKey:@"typename"];
//    NSString *duration= [mydic objectForKey:@"duration"];
//    NSString *videopath= [mydic objectForKey:@"pathurl"];
//
//    CommonFunction* _cmf = [[CommonFunction alloc] init];
//    NSString* _file = [_cmf filepathTofilename:videopath];
//    videopath =_file;
//
//    NSString * danceNum=[mydic objectForKey:@"dancetype"];
//
//
//    //NSNumber *num=[NSNumber numberWithInt:groupID];
//    [datebase executeUpdate:insertSql,userId,picUrl,videotitle,vid,videolocation,publishtime,dancetype,duration,videopath,danceNum];
//}
//
//
//-(void)dddd
//{
//    //    NSString *sql=@"delete from uploadDB where videotitle=? ";
//    //    BOOL isDel=[datebase executeUpdate:sql,str];
//    //
//    //    NSString *sql=@"select picurl,videotitle,videolocation,publishtime,vid,dancetype,duration,videopath,danceNum from uploadDB  where userId=?";
//    //    FMResultSet *set= [datebase executeQuery:sql,userid];
//}

@end
