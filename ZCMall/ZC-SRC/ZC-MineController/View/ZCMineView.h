//
//  ZCMineView.h
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void (^ZCMine_Block)(id);
@interface ZCMineView : UIView


//@property (nonatomic,assign) id<ZCMineViewDelegate> zcmDelegate;

/**
 *  数据源
 */
//@property (nonatomic,strong) NSArray *_array;

@property (nonatomic,copy) ZCMine_Block block;
-(void)showBlock:(ZCMine_Block) zcmBlock;
@end
