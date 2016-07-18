//
//  ZCMineServer.h
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "ZCBaseService.h"


@protocol ZCBaseServiceDelegate <NSObject>

/**
 *  数据请求成功回调
 *
 *  @param _it 数据列表
 */
-(void) uiDataGetSucced:(id)_it;

@end
@interface ZCMineServer : ZCBaseService



//@property (nonatomic,assign) id<ZCMineViewDelegate> zcmDelegate;


/**
 *  获取界面数据
 */
-(void) uiDataGet;

@end
