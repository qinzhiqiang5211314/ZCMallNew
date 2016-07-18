//
//  MKCustomNaviBarItem.m
//  MK
//
//  Created by hgh on 16/6/15.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCCustomNaviBarItem.h"



@interface ZCCustomNaviBarItem ()
{
    
}

@end

@implementation ZCCustomNaviBarItem

// label设置最小字体大小
- (void)label:(UILabel *)label setMiniFontSize:(CGFloat)fMiniSize forNumberOfLines:(NSInteger)iLines
{
    if (label)
    {
        label.adjustsFontSizeToFitWidth = YES;
        label.minimumScaleFactor = fMiniSize/label.font.pointSize;
        if ((iLines != 1) && ([[[UIDevice currentDevice] systemVersion] floatValue] < 7.0f))
        {
            label.adjustsLetterSpacingToFitWidth = YES;
        }else{}
    }else{}
}

/**
 *  返回导航栏 标题字号大小
 *
 *  @return float值
 */
-(float) titleSize
{
    return 18.0;
}

/**
 *  返回导航栏 标题颜色值
 *
 *  @return color值
 */
-(UIColor*) titleColor
{
    return [UIColor whiteColor];
}

/**
 *  返回导航栏大小
 *
 *  @return cgsize
 */
-(CGSize)barSize
{
    return CGSizeMake([[UIScreen mainScreen] bounds].size.width, 64.0);
}

/**
 *  返回导航栏 左/右按钮大小
 *
 *  @return cgsize
 */
-(CGSize)barBtnSize
{
    return CGSizeMake(44, 44.0);
}

/**
 *  返回标题view的 frame
 *
 *  @return CGRect
 */
-(CGRect)titleViewFrame
{
    return CGRectMake(65.0f, 0.0f, [[UIScreen mainScreen] bounds].size.width-65.0*2.0, 44.0f);

}

/**
 *  返回右边按钮 位置大小信息
 *
 *  @return CGRect
 */
-(CGRect)rightBtnFrame
{
    return CGRectMake([[UIScreen mainScreen] bounds].size.width-[self barBtnSize].width-5, 0.0f,[self barBtnSize].width, [self barBtnSize].height);

}



/**
 *  根据文字生成常用导航栏 按钮
 *
 *  @param strTitle 按钮显示的文字信息
 *  @param target   按钮关联事件所属对象
 *  @param action   按钮关联的事件
 *
 *  @return 生成的常用button
 */
- (UIButton *)createNavBtnByTitle:(NSString *)strTitle target:(id)target action:(SEL)action
{
    UIButton *btn = [self createNavBtnByImg:@"NaviBtn_Normal" imgHighlight:@"NaviBtn_Normal_H" target:target action:action];//[self class]
    [btn setTitle:strTitle forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    
    [self label:btn.titleLabel setMiniFontSize:8.0f forNumberOfLines:1];
    
    return btn;

}


/**
 *  根据图片生成常用导航栏按钮
 *
 *  @param strImgNormal    按钮常态时 的背景图
 *  @param strImgHighlight 按钮点击时 的背景图
 *  @param target          按钮关联事件所属的对象
 *  @param action          按钮关联的事件
 *
 *  @return 生成的button
 */
- (UIButton *)createNavBtnByImg:(NSString *)strImgNormal imgHighlight:(NSString *)strImgHighlight target:(id)target action:(SEL)action
{
    return [self createNavBtnByImg:strImgNormal imgHighlight:strImgHighlight imgSelected:strImgNormal target:target action:action];
}


/**
 *  根据图片生成常用导航栏按钮
 *
 *  @param strImgNormal    按钮常态时 的背景图
 *  @param strImgHighlight 按钮点击时 的背景图
 *  @param strImgSelected  按钮选中状态是 背景图
 *  @param target          按钮关联事件所属的对象
 *  @param action          按钮关联的事件
 *
 *  @return 生成的button
 */

- (UIButton *)createNavBtnByImg:(NSString *)strImgNormal imgHighlight:(NSString *)strImgHighlight imgSelected:(NSString *)strImgSelected target:(id)target action:(SEL)action
{
    UIImage *imgNormal = [UIImage imageNamed:strImgNormal];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:imgNormal forState:UIControlStateNormal];
    //btn.userInteractionEnabled = NO;
    //btn.highlighted = YES;
    [btn setShowsTouchWhenHighlighted:YES];
    [btn setImage:[UIImage imageNamed:strImgNormal] forState:UIControlStateNormal];
    if (strImgHighlight) {
        [btn setImage:[UIImage imageNamed:strImgHighlight] forState:UIControlStateHighlighted];
    }
    
    if (strImgSelected) {
        [btn setImage:[UIImage imageNamed:strImgSelected] forState:UIControlStateSelected];
    }

    
//    CGFloat fDeltaWidth = ([self barBtnSize].width - imgNormal.size.width)/2.0f;
//    CGFloat fDeltaHeight = ([self barBtnSize].height - imgNormal.size.height)/2.0f;
//    fDeltaWidth = (fDeltaWidth >= 2.0f) ? fDeltaWidth/2.0f : 0.0f;
//    fDeltaHeight = (fDeltaHeight >= 2.0f) ? fDeltaHeight/2.0f : 0.0f;
//    [btn setImageEdgeInsets:UIEdgeInsetsMake(fDeltaHeight, fDeltaWidth, fDeltaHeight, fDeltaWidth)];
//    
//    [btn setTitleEdgeInsets:UIEdgeInsetsMake(fDeltaHeight, -imgNormal.size.width, fDeltaHeight, fDeltaWidth)];
    
    return btn;

}


- (UIButton *)createNavBtnBytitle:(NSString *)titleStr normalImage:(NSString *)normalImageStr targe:(id)targe action:(SEL)action{
    UIImage *imgNormal = [UIImage imageNamed:normalImageStr];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    //btn.backgroundColor = [UIColor yellowColor];
    [btn addTarget:targe action:action forControlEvents:UIControlEventTouchUpInside];
    [btn setImage:imgNormal forState:UIControlStateNormal];
    //btn.userInteractionEnabled = NO;
    //btn.highlighted = YES;
    [btn setShowsTouchWhenHighlighted:YES];
//    [btn setImage:[UIImage imageNamed:strImgNormal] forState:UIControlStateNormal];
//    if (strImgHighlight) {
//        [btn setImage:[UIImage imageNamed:strImgHighlight] forState:UIControlStateHighlighted];
//    }
//    
//    if (strImgSelected) {
//        [btn setImage:[UIImage imageNamed:strImgSelected] forState:UIControlStateSelected];
//    }
    return btn;
}





@end
