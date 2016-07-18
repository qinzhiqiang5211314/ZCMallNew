//
//  MKDataParse.h
//  MK
//
//  Created by 李和平 on 16/6/23.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCDataParse <NSObject>


/**
 *  对象解析
 *
 *  @param _keyValues 字典
 *  @param _class     类名
 *
 *  @return 返回Class 对象实例
 */
-(id)mk_ojbectWithKeyValues:(id)_keyValues WithClass:(Class)_class;
/**
 *  对象解析
 *
 *  @param _class 类名
 *  @param _dic   @{字典的数组key：数组中dic转model}
 */
- (void)mk_objectWithClass:(Class)_class withDict:(NSDictionary *)_dic;


-(id)mk_ojbectWithKeyValues:(id)_keyValues WithClass:(Class)_class Dic:(NSDictionary *)dic;



/**
 *  @author MCMac
 *
 *  对象转JSON
 */
-(NSString *)mk_JSONWithObject:(NSObject *)_obj class:(Class)_class;

/*字符串转义字符*/
- (NSString*)toZhuanYiJson:(NSString* )strjson;

@end
