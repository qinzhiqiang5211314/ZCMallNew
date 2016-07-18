//
//  MKMatchPageFactory.h
//  MK
//
//  Created by 李和平 on 16/6/22.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MKMatchPage.h"

@interface ZCMatchPageFactory : NSObject
{
    
}

//返回单例对象
+ (instancetype)shareDefault;
-(id<ZCMatchPage>)matchPage;

@end
