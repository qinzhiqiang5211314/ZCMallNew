//
//  MKAPPUserModel.m
//  MK
//
//  Created by 李和平 on 16/6/23.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCAPPUserModel.h"
#import "ZCAppUser.h"

@interface ZCAppUserModel()
{
    
}


@end


@implementation ZCAppUserModel
@synthesize locationDto;

//

+(NSDictionary *)replacedKeyFromPropertyName{
    return @{@"companyDto":@"MKAPPCompanyModel"};
}

- (id)init {
    self = [super init];
    if (self) {
        self.realName = @"";
        self.qq = @"";
        self.weiXin = @"";
        self.sinaWeiBo = @"";
        self.nickName = @"";
        self.position = -1;
        self.gender = 0;
        self.birthDate = @"";
        self.introduce = @"";
    }
    return self;
}

/**
 *  数据拷贝
 *
 *  @param _quote 拷贝的对象（把自身的数据copy给）
 */
-(void) operateCopy:(ZCAppUserModel*)_quote
{
    if (_quote==nil) {
        _quote =  [[ZCAppUserModel alloc] init];
    }
    _quote.userId = self.userId;
    _quote.age = self.age;
    _quote.birthDate = self.birthDate;
    _quote.headPicUrl = self.headPicUrl;
    _quote.nickName = self.nickName;
    _quote.backgroundId = self.backgroundId;
    _quote.introduce = self.introduce;
    _quote.password = self.password;
    _quote.phone = self.phone;
    _quote.realName = self.realName;
    _quote.leanCloudUserName = self.leanCloudUserName;
    _quote.leanCloudId = self.leanCloudId;
    _quote.libGroupid = self.libGroupid;
    _quote.type = self.type;
    _quote.qq = self.qq;
    _quote.sinaWeiBo = self.sinaWeiBo;
    _quote.weiXin = self.weiXin;
    _quote.nameFirstChar = self.nameFirstChar;
    _quote.qRCode = self.qRCode;
    _quote.liveCity = self.liveCity;
    
    _quote.resumeId = self.resumeId;
    _quote.leanCloudSessionToken = self.leanCloudSessionToken;
    
    _quote.isFriend = self.isFriend;
    _quote.userInfoFlag = self.userInfoFlag;
    _quote.position = self.position;
    _quote.positionName = self.positionName;
    _quote.isCollect = self.isCollect;
    _quote.collectNum = self.collectNum;
    _quote.remark = self.remark;
    _quote.marryFlag = self.marryFlag;
    _quote.clientHeadPicUrl = self.clientHeadPicUrl;
    _quote.clientThumbHeadPicUrl = self.clientThumbHeadPicUrl;
    _quote.myJobUrl = self.myJobUrl;
    _quote.roleType = self.roleType;
    _quote.appearPlace = self.appearPlace;
    _quote.hobby = self.hobby;
    
}

/**
 *  数据清理
 */
-(void) clears
{
    self.userId = 0;
    self.age = 0;
    self.birthDate = nil;
    self.headPicUrl = nil;
    self.nickName = nil;
    self.backgroundId = nil;
    self.introduce = nil;
    self.password = nil;
    self.phone = nil;
    self.realName = nil;
    self.leanCloudUserName = nil;
    self.leanCloudId = nil;
    self.libGroupid = 0;
    self.type = 0;
    self.qq = nil;
    self.sinaWeiBo = nil;
    self.weiXin = nil;
    self.nameFirstChar = nil;
    self.qRCode = nil;
    self.liveCity = 0;
    
    
    
    self.locationDto = nil;
    
    self.resumeId = 0;
    self.leanCloudSessionToken = nil;
    
    self.isFriend = 0;
    self.userInfoFlag = 0;
    self.position = 0;
    self.positionName = nil;
    self.isCollect = 0;
    self.collectNum = 0;
    self.remark = nil;
    self.marryFlag = 0;
    self.clientHeadPicUrl = nil;
    self.clientThumbHeadPicUrl = nil;
    self.myJobUrl = nil;
    self.roleType = 0;
    self.appearPlace = nil;
    self.hobby = nil;

}

@end