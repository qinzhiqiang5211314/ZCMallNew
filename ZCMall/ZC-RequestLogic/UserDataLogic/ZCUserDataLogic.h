//
//  MKUserDataLogic.h
//  MK
//
//  Created by 李和平 on 16/6/17.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCRequestLogic.h"
#import "ZCRequestLogicModuleProtocal.h"
#import "ZCRequestLogicWithHeader.h"

//用户模块
@interface ZCAPIUser : ZCRequestLogicWithHeader<ZCRequestLogicModuleProtocal>
{
    
}


@property(nonatomic,strong)NSString*                mlogicReqMap;



@end

