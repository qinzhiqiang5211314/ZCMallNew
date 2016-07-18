//
//  UIImageView+ZC.m
//  ZCMall
//
//  Created by hgh on 16/7/15.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "UIImageView+ZC.h"
#import "UIImageView+WebCache.h"

@implementation UIImageView (ZC)

-(void)ZC_setImageWithUrl:(NSString *)url placeholderImage:(UIImage *)placeholderImage
{
    [self sd_setImageWithURL:[NSURL URLWithString:url] placeholderImage:placeholderImage];
}


@end
