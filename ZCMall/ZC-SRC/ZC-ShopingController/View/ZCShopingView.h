//
//  ZCShopingView.h
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCComTableView.h"


@protocol ZCShopingViewDelegate <NSObject>

/**
 *  进入旗舰店
 *
 *  @param _it 地铺信息
 */
-(void) gotoShops:(id)_it;

@end

@interface ZCShopingView : ZCComTableView
{
    
}

@property(nonatomic,assign)id<ZCShopingViewDelegate>    mDelegate;
/**
 *  数据源
 */
@property(nonatomic,strong)NSMutableArray*              mDataSource;


@end
