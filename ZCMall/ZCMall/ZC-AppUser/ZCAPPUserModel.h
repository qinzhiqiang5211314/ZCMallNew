//
//  MKAPPUserModel.h
//  MK
//
//  Created by 李和平 on 16/6/23.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ZCAppLocationModel.h"


@interface ZCAppUserModel : NSObject

@property (nonatomic, assign) NSInteger         userId;

//年龄
@property (nonatomic, assign) NSInteger          age;
//生日
@property (nonatomic, strong) NSString          *birthDate;
//头像
@property (nonatomic, strong) NSString          *headPicUrl;
//昵称
@property (nonatomic, strong) NSString          *nickName;
//背景图路径
@property (nonatomic, strong) NSString          *backgroundId;
//个性签名
@property (nonatomic, strong) NSString          *introduce;
//性别
@property (nonatomic, assign) NSInteger         gender;
//密码
@property (nonatomic, strong) NSString          *password;
//手机phone
@property (nonatomic, strong) NSString          *phone;
//真实姓名
@property (nonatomic, strong) NSString          *realName;
//LeanCloud 登录名称
@property (nonatomic, strong) NSString          *leanCloudUserName;
//LeanCloud用户主健
@property (nonatomic, strong) NSString          *leanCloudId;
//默认库群id
@property (nonatomic, assign) NSInteger         libGroupid;
//用户类型  1 从业者  2 经营者 3 爱好者
@property (nonatomic, assign) NSInteger         type;
//qq
@property (nonatomic, strong) NSString          *qq;
//新浪微博
@property (nonatomic, strong) NSString          *sinaWeiBo;
//微信
@property (nonatomic, strong) NSString          *weiXin;
//
@property (nonatomic, strong) NSString          *nameFirstChar;
//二维码标示
@property (nonatomic, strong) NSString          *qRCode;

//居住城市代号
@property (nonatomic, assign) NSInteger          liveCity;

//定位城市信息
@property (nonatomic, strong) ZCAppLocationModel* locationDto;

//简历id
@property (nonatomic, assign) NSInteger         resumeId;
//用户的SessionToken
@property (nonatomic, strong) NSString          *leanCloudSessionToken;
//好友关系，0不是好友1是好友。
@property (nonatomic, assign)NSInteger          isFriend;
//`userInfoFlag` tinyint(1) DEFAULT '1' COMMENT '用户是否完善信息标识 0:未完善 1:已完善',
@property (nonatomic, assign) NSInteger         userInfoFlag;

//职位
@property (nonatomic, assign) NSInteger         position;
@property (nonatomic, strong) NSString          *positionName;
//是否被收藏、赞
@property (nonatomic, assign) NSInteger         isCollect;

@property (nonatomic, assign) NSInteger         collectNum;
//个人简介
@property (nonatomic, strong) NSString          *remark;

@property (nonatomic, assign) NSInteger          marryFlag;

@property (nonatomic, strong) NSString          *clientHeadPicUrl;
@property (nonatomic, strong) NSString          * clientThumbHeadPicUrl;

//我的求职
@property (nonatomic, copy) NSString *myJobUrl;

/**
 创建我的版的权限！=1的时候可以创建
 */
@property (nonatomic, assign) NSInteger roleType;

/**
 常出没地
 */
@property (nonatomic, strong) NSString *appearPlace;

/**
 兴趣爱好
 */
@property (nonatomic, strong) NSString *hobby;


/**
 *  数据拷贝
 *
 *  @param _quote 拷贝的对象（把自身的数据copy给）
 */
-(void) operateCopy:(ZCAppUserModel*)_quote;

/**
 *  数据清理
 */
-(void) clears;


@end

