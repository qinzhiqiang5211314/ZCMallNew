//
//  MKDataPraseHelper.m
//  MK
//
//  Created by 李和平 on 16/6/23.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCDataPraseHelper.h"
#import "MJExtension.h"


@implementation ZCDataPraseHelper

/**
 *  对象解析
 *
 *  @param _keyValues 字典
 *  @param _class     类名
 *
 *  @return 返回Class 对象实例
 */

-(id)mk_ojbectWithKeyValues:(id)_keyValues WithClass:(Class)_class;
{
    return[_class mj_objectWithKeyValues:_keyValues];

}
/**
 *  对象解析
 *
 *  @param _class 类名
 *  @param _dic   @{字典的数组key：数组中dic转model}
 */
- (void)mk_objectWithClass:(Class)_class withDict:(NSDictionary *)_dic
{
    [_class mj_setupObjectClassInArray:^NSDictionary *{
        return _dic;
    }];
}

-(id)mk_ojbectWithKeyValues:(id)_keyValues WithClass:(Class)_class Dic:(NSDictionary *)dic{
    if (dic) {
        [self mk_objectWithClass:_class withDict:dic];
    }
    
    return [self mk_ojbectWithKeyValues:_keyValues WithClass:_class];
}


/**
 *  @author MCMac
 *
 *  对象转JSON
 */
-(NSString *)mk_JSONWithObject:(NSObject *)_obj class:(Class)_class{
    return _obj.mj_JSONString;
    
}


/*字符串转义字符*/
- (NSString*)toZhuanYiJson:(NSString* )strjson{
    //     NSString *unicodeStr = [NSString stringWithCString:[strjson UTF8String] encoding:NSUnicodeStringEncoding];
    NSMutableString *sb = [[NSMutableString alloc] init];
    for (int i = 0; i < strjson.length; i++)
    {
        NSString *c = [strjson substringWithRange:NSMakeRange(i, 1)];
        
        if ([c isEqualToString:@"\""]) {
            [sb appendString:@"\\\""];
        }else if ([c isEqualToString:@"\\"]) {
            [sb appendString:@"\\\\"];
        }else if ([c isEqualToString:@"/"]) {
            [sb appendString:@"\\/"];
        }else if ([c isEqualToString:@"\b"]) {
            [sb appendString:@"\\b"];
        }else if ([c isEqualToString:@"\f"]) {
            [sb appendString:@"\\f"];
        }else if ([c isEqualToString:@"\n"]) {
            [sb appendString:@"\\n"];
        }else if ([c isEqualToString:@"\r"]) {
            [sb appendString:@"\\r"];
        }else if ([c isEqualToString:@"\t"]) {
            [sb appendString:@"\\t"];
        }else {
            [sb appendString:c];
        }
    }
    
    //        char a = [encodedString characterAtIndex:i];
    //        switch (a) {
    //            case '\"':
    //                [sb appendString:@"\\\""];
    //                break;
    //            case '\\':
    //                [sb appendString:@"\\\\"];
    //                break;
    //
    //            case '/':
    //                [sb appendString:@"\\/"];
    //                break;
    //
    //            case '\b':
    //                [sb appendString:@"\\b"];
    //                break;
    //
    //            case '\f':
    //                [sb appendString:@"\\f"];
    //                break;
    //
    //            case '\n':
    //                [sb appendString:@"\\n"];
    //                break;
    //
    //            case '\r':
    //                [sb appendString:@"\\r"];
    //                break;
    //
    //            case '\t':
    //                [sb appendString:@"\\t"];
    //                break;
    //            default:{
    //                NSString *bString = [NSString stringWithFormat:@"%c", a];
    ////                NSString *sc = [NSString stringWithFormat:@"decodeURIComponent('%@')",bString];
    //
    ////                NSString *b = [bString stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    //                [sb appendString:bString];
    //            }
    //                break;
    //        }
    //    }
    return [sb copy];
}




@end
