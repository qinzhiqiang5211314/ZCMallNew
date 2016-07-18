//
//  MCDB.h
//  MEIKU
//
//  Created by hgh on 16/5/28.
//  Copyright © 2016年 Mrrck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMResultSet.h"

@protocol ZCDB <NSObject>

/**
 *  关闭数据库 释放
 */
- (void) close;

/**
 *  打开数据库
 *
 *  @return [yes/NO] 对应【打开/关闭】
 */
- (BOOL) open;

/**
 *  删除数据库
 */
- (void) deleteDatabse;

/**
 *  判断是否存在表
 *
 *  @param tableName 表名称
 *
 *  @return 表是否存在
 */
- (BOOL) isTableOK:(NSString *)tableName;

/**
 *  获得表的数据条数
 *
 *  @param tableName 表名称
 *
 *  @return 表数据条数
 */
- (NSInteger) getTableItemCount:(NSString *)tableName;

/**
 *  删除表-彻底删除表
 *
 *  @param tableName 表名称
 *
 *  @return 【yes/no】对应【成功/失败】
 *///
- (BOOL) deleteTable:(NSString *)tableName;

/**
 *  清除表-清数据
 *
 *  @param tableName 表名称
 *
 *  @return 【yes/no】对应【成功/失败】
 *///
- (BOOL) eraseTable:(NSString *)tableName;

/**
 * 是否存在
 *
 *  @param _sql sql
 *
 *  @return [yes/no】对应【存在/不存在】
 */
- (BOOL) isExit:(NSString*)_sql;

/**
 * 是否存在
 *
 *  @param _sql sql
 *
 *  @return [yes/no】对应【存在/不存在】
 */
- (BOOL) isExit:(NSString*)_sql WithParament:(NSArray*)_array;


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
