//
//  MKTableCircleHeader.h
//  MK
//
//  Created by hgh on 16/6/13.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZCTableHeader.h"
#import "ZCRefreshView.h"
#import "ZCRefreshProtocol.h"


@interface ZCTableCHeader : ZCRefreshView<MKTableHeader>
{
    UIScrollView*                       mScrollview;
}



@end
