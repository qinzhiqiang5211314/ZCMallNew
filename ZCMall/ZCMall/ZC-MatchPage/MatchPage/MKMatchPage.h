//
//  MKMatchPage.h
//  MK
//
//  Created by 李和平 on 16/6/22.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol ZCMatchPage <NSObject>

/**
 *  更新本地赛事图
 *
 *  @param _dt <#_dt description#>
 */
-(void) updateMatchImage:(id)_dt;

/**
 *  返回最新赛事图
 *
 *  @return 赛事图url
 */
-(NSString*) matchImageUrl;

/**
 *  返回赛事图图片
 *
 *  @return UIimage*
 */
-(UIImage*) matchImage;



@end
