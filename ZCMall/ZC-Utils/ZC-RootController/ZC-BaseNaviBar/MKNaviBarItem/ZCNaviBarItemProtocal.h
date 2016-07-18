//
//  MKNaviBarItemProtocal.h
//  MK
//
//  Created by hgh on 16/6/15.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCNaviBarItemProtocal <NSObject>

/**
 *  返回导航栏 标题字号大小
 *
 *  @return float值
 */
-(float) titleSize;

/**
 *  返回导航栏 标题颜色值
 *
 *  @return color值
 */
-(UIColor*) titleColor;

/**
 *  返回导航栏大小
 *
 *  @return cgsize
 */
-(CGSize)barSize;

/**
 *  返回导航栏 左/右按钮大小
 *
 *  @return cgsize
 */
-(CGSize)barBtnSize;

/**
 *  返回标题view的 frame
 *
 *  @return CGRect
 */
-(CGRect)titleViewFrame;

/**
 *  返回右边按钮 位置大小信息
 *
 *  @return CGRect
 */
-(CGRect)rightBtnFrame;


/**
 *  根据文字生成常用导航栏 按钮
 *
 *  @param strTitle 按钮显示的文字信息
 *  @param target   按钮关联事件所属对象
 *  @param action   按钮关联的事件
 *
 *  @return 生成的常用button
 */
- (UIButton *)createNavBtnByTitle:(NSString *)strTitle target:(id)target action:(SEL)action;


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
- (UIButton *)createNavBtnByImg:(NSString *)strImgNormal imgHighlight:(NSString *)strImgHighlight target:(id)target action:(SEL)action;


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

- (UIButton *)createNavBtnByImg:(NSString *)strImgNormal imgHighlight:(NSString *)strImgHighlight imgSelected:(NSString *)strImgSelected target:(id)target action:(SEL)action;

//-(UIView*) createNavViewWithSearchBar:();


/**
 *  @author MCMac
 *
 *  生成一个图片和title的导航按钮
 *
 *  @param titleStr       titile
 *  @param normalImageStr 图片名字
 *  @param targe          关联的对象
 *  @param action         关联事件
 *
 *  @return 生成额Button
 */
- (UIButton *)createNavBtnBytitle:(NSString *)titleStr normalImage:(NSString *)normalImageStr targe:(id)targe action:(SEL)action;



@end
