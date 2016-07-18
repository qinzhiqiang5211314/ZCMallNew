//
//  MKRefreshCircleFooter.m
//  MK
//
//  Created by 李和平 on 16/6/13.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCRefreshCircleFooter.h"

@interface ZCRefreshCircleFooter()
{
    
}

@end

@implementation ZCRefreshCircleFooter


-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
       // self.backgroundColor = [UIColor yellowColor];
        
    }
    
    return self;
}



-(NSString*) textIndicatorTextAtNomal
{
    return @"上拉可以加载最新数据";
}



@end
