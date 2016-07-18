//
//  MKServer.m
//  MK
//
//  Created by 李和平 on 16/6/2.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCServer.h"
#import "ZCServerCfgProtocol.h"

@interface ZCServer()
{
    
}

@property (nonatomic, weak) id<ZCServerCfgProtocol> mServerCfg;

@end

@implementation ZCServer
@synthesize mServerCfg;
@synthesize mServerEnvironmentType;
@synthesize mApiBaseUrl;
@synthesize mPublicCipherKey;
@synthesize mPrivateCipherKey;


-(instancetype)init
{
    self = [super init];
    if (self) {
        if ([self conformsToProtocol:@protocol(ZCServerCfgProtocol)]) {
            self.mServerCfg = (id<ZCServerCfgProtocol>)self;

        } else {
           //
            
        }
    }
    return self;
}

#pragma mark - getters and setters
-(void) setMServerEnvironmentType:(ZCServerEnvironment)mServerEnvironmentType_
{
    mServerEnvironmentType = mServerEnvironmentType_;
}


- (NSString *)apiBaseUrl
{
    if (mApiBaseUrl == nil) {
        switch (self.mServerEnvironmentType) {
            case MKServerEnvironment_Develop:
            {
                mApiBaseUrl = self.mServerCfg.mDevelopApiBaseUrl;
                
                break;
            }
            case MKServerEnvironment_Test:
            {
                mApiBaseUrl = self.mServerCfg.mTestApiBaseUrl;
                break;
            }
            case MKServerEnvironment_PreRelease:
            {
                mApiBaseUrl = self.mServerCfg.mPreReleaseApiBaseUrl;
                break;
            }
            case MKServerEnvironment_HotFix:
            {
                mApiBaseUrl = self.mServerCfg.mHotFixApiBaseUrl;
                break;
            }
           
            default:
                break;
        }
    }
    return mApiBaseUrl;
    
 
}


-(NSString*)mPrivateCipherKey
{
    if (mPrivateCipherKey==nil) {
        mPrivateCipherKey = @"";
    }
    return self.mPrivateCipherKey;
}

-(NSString*)mPublicCipherKey
{
    if (mPublicCipherKey==nil) {
        mPublicCipherKey = @"";
    }
    return self.mPublicCipherKey;
}

-(NSString*)mApiBaseUrl
{
    return [self apiBaseUrl];
}



@end
