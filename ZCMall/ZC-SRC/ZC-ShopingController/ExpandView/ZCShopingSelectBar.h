//
//  ZCShopingSelectBar.h
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ZCShopingSelectBarDelegate <NSObject>

/**
 *  全选
 */
-(void) selectAllAction;

/**
 *  取消选择
 */
-(void) cancelSelectAction;

/**
 *  去结算
 */
-(void) gotoPay;

@end

@interface ZCShopingSelectBar : UIView
{
    
}

@property(nonatomic,assign)id<ZCShopingSelectBarDelegate>   mDelegate;

/**
 *  更新价格
 *
 *  @param _money 商品总价格
 */
-(void) modifyExpenses:(float)_money;

@end
