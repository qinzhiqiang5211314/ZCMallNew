//
//  ZCShopingServer.m
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "ZCShopingServer.h"
#import "ZCShoppingModel.h"

@implementation ZCShopingServer
@synthesize mDelegate;

/**
 *  获取界面数据
 */
-(void) uiDataGet
{
    //网络请求
    
    
    
    //测试数据
    
    NSMutableArray* _array=[[NSMutableArray alloc]init];
    for (int i=0; i<3; i++) {
        ZCShoppingModel *_shoppingModel=[[ZCShoppingModel alloc]init];
        _shoppingModel.productTitle=@"爱他美奶粉专卖店";
        _shoppingModel.productName=@"爱他美奶粉一段";
        _shoppingModel.productType=@"一段";
        _shoppingModel.productNumber=@"1";
        _shoppingModel.productDesc=@"250ML";
        _shoppingModel.producSubhead=@"买十罐送一罐 多买多送";
        _shoppingModel.producPrice=@"1.799,00";
        _shoppingModel.producImg=@"pic2@2x";
        [_array addObject:_shoppingModel];
    }

    if (self.mDelegate) {
        [self.mDelegate uiDataGetSucced:_array];
    }
}


@end
