//
//  MKBaseNavigationBar.m
//  MK
//
//  Created by 果子 on 16/6/14.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCBaseNavigationBar.h"

@implementation ZCBaseNavigationBar

- (instancetype)init
{
    if (self = [super init]) {
        [self p_setupSubviews];
    }
    return self;
}

- (void)p_setupSubviews
{
    self.leftItemBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@""] style:UIBarButtonItemStylePlain target:self action:@selector(backAction:)];
    

}
@end
