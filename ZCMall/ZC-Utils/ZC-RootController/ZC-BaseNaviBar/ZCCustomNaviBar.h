//
//  MKCustomNaviBar.h
//  MK
//
//  Created by hgh on 16/6/15.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ZCNaviBarProtocal.h"

@interface ZCCustomNaviBar : UIView<ZCNaviBarProtocal>
{
    
}

@property(nonatomic,assign)BOOL                 mBlur;

-(id) initWithFrame:(CGRect)frame WithNavController:(UIViewController*)_ctr;

@end
