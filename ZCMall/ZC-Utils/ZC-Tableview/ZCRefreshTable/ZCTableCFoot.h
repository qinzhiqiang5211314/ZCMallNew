//
//  MKTableCircleFoot.h
//  MK
//
//  Created by hgh on 16/6/13.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZCTableFoot.h"
#import "ZCRefreshView.h"
#import "ZCRefreshProtocol.h"

@interface ZCTableCFoot : ZCRefreshView<ZCTableFoot,ZCRefreshProtocol>
{
    UIScrollView*                       mScrollview;
}


@end
