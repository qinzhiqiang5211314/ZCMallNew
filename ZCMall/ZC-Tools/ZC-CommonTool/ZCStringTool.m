//
//  MKStringTool.m
//  MEIKU
//
//  Created by hgh on 15/4/23.
//  Copyright (c) 2015年 Mrrck. All rights reserved.
//

#import "ZCStringTool.h"
//#import "EmotionBean.h"

#define THUMB_PLACEHOLD         @"_thumb.png"

@implementation ZCStringTool

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
+ (CGRect)getRectFromString:(NSString *)text withRestrictSize:(CGSize)size Font:(UIFont *)font {
    if (text.length <= 0) {
        return CGRectZero;
    }
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:text];
    [attributedString addAttribute:NSFontAttributeName value:font range:NSMakeRange(0, text.length)];
    
    return [attributedString boundingRectWithSize:size options:NSStringDrawingUsesFontLeading|NSStringDrawingUsesLineFragmentOrigin context:nil];
}


/**
 *  @author 李诚, 15-04-29 15:04:30
 *
 *  TODO:获取缩略图地址
 *
 *  @param bigURL 大图地址
 *
 *  @return 缩略图地址
 */
+ (NSString *)getSmallURLWithBigURL:(NSString *)bigURL {
    return [NSString stringWithFormat:@"%@%@", bigURL, THUMB_PLACEHOLD];
}

/**
 *  @author 李诚, 15-05-15 17:05:27
 *
 *  TODO:获取输入框去高亮部分的 长度
 *
 *  @return
 */
+ (NSInteger)getTextCountWithoutMarked:(id)object {
    NSInteger count = 0;
    
    if ([object isKindOfClass:[UITextView class]]) {
        UITextView *textView = (UITextView *)object;
        UITextRange *markedRange = [textView markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textView positionFromPosition:markedRange.start offset:0];
        
        if (!position) {
            // 没有高亮选择的字，则对已输入的文字进行字数统计
            count = [textView.text length];
        }else {
            // 有高亮选择的字符串，则对非高亮文字进行统计
            NSString *markString = [textView textInRange:markedRange];
            count = textView.text.length - markString.length;
        }
    }
    if ([object isKindOfClass:[UITextField class]]) {
        UITextField *textField = (UITextField *)object;
        UITextRange *markedRange = [textField markedTextRange];
        //获取高亮部分
        UITextPosition *position = [textField positionFromPosition:markedRange.start offset:0];
        
        if (!position) {
            // 没有高亮选择的字，则对已输入的文字进行字数统计
            count = [textField.text length];
        }else {
            // 有高亮选择的字符串，则对非高亮文字进行统计
            NSString *markString = [textField textInRange:markedRange];
            count = textField.text.length - markString.length;
        }
    }
    
    return count;
}

/**
 *  @author 李诚, 15-05-21 19:05:52
 *
 *  TODO:获取随机颜色
 *
 *  @return
 */
+ (NSMutableArray *)randomColorArr {
    NSMutableArray *color = [NSMutableArray arrayWithCapacity:0];
    
    [color addObject:RGBA(0, 179, 242, 1.0)];
    [color addObject:RGBA(79, 199, 183, 1.0)];
    [color addObject:RGBA(132, 189, 24, 1.0)];
    [color addObject:APP_FEMALE_COLOR];
    [color addObject:RGBA(150, 155, 126, 1.0)];
    [color addObject:RGBA(235, 86, 102, 1.0)];
    [color addObject:[UIColor cyanColor]];
    [color addObject:[UIColor orangeColor]];
    
    return color;
}


/**
 *  @author 李诚, 15-06-01 16:06:58
 *
 *  TOOD:判断是否为字母
 *
 *  @param string
 *
 *  @return
 */
+ (BOOL)isLetter:(NSString *)string {
    NSString * regex = @"^[A-Za-z]$";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:string];
}


#pragma mark ============== 表情 =================

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
+ (NSInteger)startPositionEmotion:(NSString *)text {
    NSInteger index = 0;
    if (text.length!=0) {
        NSString *v=[text substringFromIndex:text.length-1];
        if ([v isEqualToString:@"]"]) {
            NSInteger position = [self getEmotionLocationWithValue:[text substringToIndex:text.length-1]];
            NSString *emotion = [[text substringToIndex:text.length-1] substringFromIndex:position+1];
            //去表情文件里面查找是不是表情符号
            NSArray *array;//=[[EmotionBean shareInstance].emotionDict allValues];
            for (NSString *vv in array) {
                if ([vv isEqualToString:emotion]) {
                    index = position;
                    break;
                }
            }
        }
    }
    return index;
}

/**
 *  @author 李诚, 15-05-25 16:05:29
 *
 *  TODO:是否删除的表情
 *
 *  @return
 */
+ (BOOL)isDeleteEmotion:(id)textInput {
    if ([textInput isKindOfClass:[UITextView class]]) {
        UITextView *textView = (UITextView *)textInput;
        
        NSRange selectRange = [textView selectedRange];
        //光标位置
        NSInteger cursorLocation = selectRange.location;
        //光标定位前的字符
        NSString *selectValue = [textView.text substringToIndex:cursorLocation];
        
        if (selectValue.length==0) {
            return NO;
        }
        
        //检测光标前的 最后一个是不是表情
        NSString *v=[selectValue substringFromIndex:selectValue.length-1];
        if (![v isEqualToString:@"]"]) {
            return NO;
        }
        
        //有右边的符号,检测,有没有左边符号
        NSInteger position = [self getEmotionLocationWithValue:selectValue];
        
        if (position==-1) {
            //没有找到匹配的
            return NO;
        }
        
        //找到匹配的
        v=[selectValue substringFromIndex:position+1];
        v=[v substringToIndex:v.length-1];
        
        //去表情文件里面查找是不是表情符号
        NSArray *array;//=[[EmotionBean shareInstance].emotionDict allValues];
        for (NSString *vv in array) {
            if ([vv isEqualToString:v]) {
                //是表情
                return YES;
            }
        }
    }
    
    return NO;
}

+ (NSInteger)getEmotionLocationWithValue:(NSString *)value {
    NSInteger position=-1;
    for (NSInteger i=value.length-1; i>=0; i--) {
        NSRange range;
        range.length=1;
        range.location=i;
        NSString *v=[value substringWithRange:range];
        if ([v isEqualToString:@"["]) {
            position=i;
            break;
        }
    }
    return position;
}

/**
 *  @author 李诚, 15-05-25 17:05:12
 *
 *  TODO:删除最后一个字符
 *
 *  @param textInput
 */
+ (void)deleteLastCharacter:(id)textInput {
    if ([textInput isKindOfClass:[UITextView class]]) {
        UITextView *textView = (UITextView *)textInput;
        
        NSString *value = textView.text;
        if (value.length == 0) {
            return;
        }
        
        if (value.length>1) {
            if ([self stringContainsEmoji:[value substringFromIndex:value.length-2]]) {
                value=[value substringToIndex:value.length-2];
            }else{
                value=[value substringToIndex:value.length-1];
            }
        }else{
            value=[value substringToIndex:value.length-1];
        }
        
        textView.text=value;
    }
}

/**
 TODO:判断是否为emoji
 
 @param string
 
 @return
 
 @author 卞豪
 @since 1.0
 */
+ (BOOL)stringContainsEmoji:(NSString *)string
{
    __block BOOL returnValue = NO;
    [string enumerateSubstringsInRange:NSMakeRange(0, [string length]) options:NSStringEnumerationByComposedCharacterSequences usingBlock:
     ^(NSString *substring, NSRange substringRange, NSRange enclosingRange, BOOL *stop) {
         
         const unichar hs = [substring characterAtIndex:0];
         // surrogate pair
         if (0xd800 <= hs && hs <= 0xdbff) {
             if (substring.length > 1) {
                 const unichar ls = [substring characterAtIndex:1];
                 const int uc = ((hs - 0xd800) * 0x400) + (ls - 0xdc00) + 0x10000;
                 if (0x1d000 <= uc && uc <= 0x1f77f) {
                     returnValue = YES;
                 }
             }
         } else if (substring.length > 1) {
             const unichar ls = [substring characterAtIndex:1];
             if (ls == 0x20e3) {
                 returnValue = YES;
             }
             
         } else {
             // non surrogate
             if (0x2100 <= hs && hs <= 0x27ff) {
                 returnValue = YES;
             } else if (0x2B05 <= hs && hs <= 0x2b07) {
                 returnValue = YES;
             } else if (0x2934 <= hs && hs <= 0x2935) {
                 returnValue = YES;
             } else if (0x3297 <= hs && hs <= 0x3299) {
                 returnValue = YES;
             } else if (hs == 0xa9 || hs == 0xae || hs == 0x303d || hs == 0x3030 || hs == 0x2b55 || hs == 0x2b1c || hs == 0x2b1b || hs == 0x2b50) {
                 returnValue = YES;
             }
         }
     }];
    
    return returnValue;
}


/**
 *  @author 李诚, 15-05-25 17:05:50
 *
 *  TODO:删除表情
 *
 *  @param textInput   输入框
 *  @param fromEmotion 是否从表情键盘的删除按钮【而不是系统键盘的删除按钮】
 */
+ (void)deleteEmotionCharacter:(id)textInput fromEmotionKeyboard:(BOOL)fromEmotion {
    if ([textInput isKindOfClass:[UITextView class]]) {
        UITextView *textView = (UITextView *)textInput;
        
        NSString *selectValue;
        
        //表情起始位置
        NSInteger position;
        
        NSRange deleteRange;
        if (fromEmotion) {
            selectValue = textView.text;
            //表情起始位置
            position = [ZCStringTool getEmotionLocationWithValue:selectValue];
            deleteRange = NSMakeRange(position, selectValue.length-position);
        }else {
            NSRange selectRange = [textView selectedRange];
            //光标位置
            NSInteger cursorLocation = selectRange.location;
            //光标定位前的字符
            selectValue = [textView.text substringToIndex:cursorLocation];
            //表情起始位置
            position = [ZCStringTool getEmotionLocationWithValue:selectValue];
            
            deleteRange = NSMakeRange(position, cursorLocation-position);
        }
        
        NSMutableString *totalString = [[NSMutableString alloc] initWithString:textView.text];
        [totalString replaceCharactersInRange:deleteRange withString:@""];
        textView.text = totalString;
        
        if (!fromEmotion) {
            textView.selectedRange = NSMakeRange(position, 0);
        }
    }
}


@end
