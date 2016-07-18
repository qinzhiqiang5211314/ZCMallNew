//
//  LoginView.h
//  ZhongChao
//
//  Created by 秦志强 on 16/7/11.
//  Copyright © 2016年 秦志强. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^login_block)(id);
@interface LoginView : UIView

@property (nonatomic,copy)login_block blocks;
-(void)showLoginBlock:(login_block) loginBlocks;
@end
