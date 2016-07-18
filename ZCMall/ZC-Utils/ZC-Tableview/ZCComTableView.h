//
//  MKFindPeerTableView.h
//  MK
//
//  Created by hgh on 16/6/16.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCTableView.h"

@interface ZCComTableView : UIView
{
    ZCTableView*                    mTableView;
}

/**
 *  初始化实例
 *
 *  @param frame 大小位置
 *  @param _ye   是否带顶部刷新
 *  @param _ye   是否带底部刷新
 *
 *  @return 返回实例
 */
-(id) initWithFrame:(CGRect)frame WithRefreshHeader:(BOOL)_haveHeader WithRefreshFooter:(BOOL)_haveFooter;

/**
 *  直接刷新列表
 */
-(void) reloadData;


/**
 *  加载更多回调
 */
@property(nonatomic,copy)void(^loadMoreBlock)(void);

/**
 *  刷新回调
 */
@property(nonatomic,copy)void(^refreshBlock)(void);

@end
