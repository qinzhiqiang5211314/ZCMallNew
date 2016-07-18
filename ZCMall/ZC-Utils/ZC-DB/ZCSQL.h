//
//  MCSQL.h
//  MEIKU
//
//  Created by hgh on 16/5/28.
//  Copyright © 2016年 Mrrck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMResultSet.h"


@protocol ZCSQL <NSObject>

/**
 *  生成查询语句并返回查询结果
 *
 *  @param tablename     表名
 *  @param column_list   表单列关键字
 *  @param condition_map 查询条件关键字
 *
 *  @return 查询结果
 */
-(FMResultSet*) doSelectSQL:(NSString*)tablename ColumnKeys:(NSArray*)column_list Condition:(NSDictionary*)condition_map;


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
-(FMResultSet*) doSelectSQL:(NSString*)tablename ColumnKeys:(NSArray*)column_list Condition:(NSDictionary*)condition_map WithLimit:(NSString*)_limit;


/**
 *  生成更新语句并执行
 *
 *  @param tablename     表名
 *  @param value_map     表单列关键字及对应值
 *  @param condition_map 条件关键字
 *
 *  @return 是否更新成功
 */
-(BOOL) doUpdateSQL:(NSString*)tablename ColumnMap:(NSDictionary*)value_map Condition:(NSDictionary*)condition_map;

/**
 *  生成插入语句并执行
 *
 *  @param tablename 表名
 *  @param value_map 表单列关键字
 *
 *  @return 是否更新成功
 */
-(BOOL) doInsertSQL:(NSString*)tablename ColumnMap:(NSDictionary*)value_map;

/**
 *  生成删除语句并删除
 *
 *  @param tablename     表名
 *  @param condition_map 删除条件关键字
 *
 *  @return 是否删除成功
 */
-(BOOL) doDeleteSQL:(NSString*)tablename Condition:(NSDictionary*)condition_map;

/**
 *  返回是否含有该条目
 *
 *  @param tablename     表名
 *  @param column_list   列关键字
 *  @param condition_map 条件
 *
 *  @return 是否存在
 */
-(BOOL) isExit:(NSString*)tablename ColumnKeys:(NSArray*)column_list Condition:(NSDictionary*)condition_map;

/**
 *  更新表数据
 *
 *  @param sqlUpdata  sql语句
 *
 *  @return 【yes/no】对应【成功/失败】
 *///更新
-(BOOL)UpdataExe:(NSString*)sqlUpdata;

/**
 *  更新表数据
 *
 *  @param sqlUpdata sql语句
 *  @param _array    对应的数据列表
 *
 *  @return 【yes/no】对应【成功/失败】
 */
-(BOOL)UpdataExe:(NSString *)sqlUpdata WithParament:(NSArray*)_array;

/**
 *  查询数据  查询完毕要关闭
 *
 *  @param sqlQuerry sql语句
 *
 *  @return 查询结果
 *///
-(FMResultSet*)querryTable:(NSString*)sqlQuerry;

/**
 *  查询数据  查询完毕要关闭
 *
 *  @param sqlQuerry sql语句
 *  @param _array    对应的数据列表
 *
 *  @return 查询结果
 *///
-(FMResultSet*)querryTable:(NSString*)sqlQuerry WithParament:(NSArray*)_array;



@end
