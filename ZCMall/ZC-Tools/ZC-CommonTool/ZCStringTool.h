//
//  MKStringTool.h
//  MEIKU
//
//  Created by hgh on 15/4/23.
//  Copyright (c) 2015年 Mrrck. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZCStringTool : NSObject

/**
 *  @author 李诚, 15-04-23 17:04:35
 *
 *  TODO:获取文本的绘制size
 *
 *  @param text
 *  @param font
 *
 *  @return
 */
+ (CGRect)getRectFromString:(NSString *)text withRestrictSize:(CGSize)size Font:(UIFont *)font;

/**
 *  @author 李诚, 15-04-29 15:04:30
 *
 *  TODO:获取缩略图地址
 *
 *  @param bigURL 大图地址
 *
 *  @return 缩略图地址
 */
+ (NSString *)getSmallURLWithBigURL:(NSString *)bigURL;

/**
 *  @author 李诚, 15-05-15 17:05:27
 *
 *  TODO:获取输入框去高亮部分的 长度
 *
 *  @return
 */
+ (NSInteger)getTextCountWithoutMarked:(id)object;

/**
 *  @author 李诚, 15-05-21 19:05:52
 *
 *  TODO:获取随机颜色
 *
 *  @return
 */
+ (NSMutableArray *)randomColorArr;

/**
 *  @author 李诚, 15-06-01 16:06:58
 *
 *  TOOD:判断是否为字母
 *
 *  @param string
 *
 *  @return
 */
+ (BOOL)isLetter:(NSString *)string;


#pragma mark ============== 表情 =================
/**
 *  @author 李诚, 15-05-25 16:05:29
 *
 *  TODO:是否删除的表情
 *
 *  @return
 */
+ (BOOL)isDeleteEmotion:(id)textInput;

/**
 *  @author 李诚, 15-05-25 16:05:22
 *
 *  TODO:是表情的情况下，获取表情的起始位置
 *
 *  @param value SelectValue,光标前的字符
 *
 *  @return
 */
+ (NSInteger)getEmotionLocationWithValue:(NSString *)value;

/**
 *  @author 施峰磊, 15-07-08 15:07:18
 *
 *  TODO:最后一个表情的起始位置
 *
 *  @param text
 *
 *  @return 表情的起始位置
 *
 *  @since 1.0
 */
+ (NSInteger)startPositionEmotion:(NSString *)text;

/**
 *  @author 李诚, 15-05-25 17:05:12
 *
 *  TODO:删除最后一个字符
 *
 *  @param textInput
 */
+ (void)deleteLastCharacter:(id)textInput;

/**
 *  @author 李诚, 15-05-25 17:05:50
 *
 *  TODO:删除表情
 *
 *  @param textInput   输入框
 *  @param fromEmotion 是否从表情键盘的删除按钮【而不是系统键盘的删除按钮】
 */
+ (void)deleteEmotionCharacter:(id)textInput fromEmotionKeyboard:(BOOL)fromEmotion;

@end
