//
//  MKTableView.m
//  MK
//
//  Created by hgh on 16/6/12.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCTableView.h"
#import "ZCTableCFoot.h"
#import "ZCTableCHeader.h"
#import "ZCRefreshCircleFooter.h"
#import "ZCRefreshCircleHeader.h"

@interface ZCTableView()
{
    
}
//自定义table 底部
@property(nonatomic,strong)id<ZCTableFoot>          mFooter;
//自定义table 头
@property(nonatomic,strong)id<MKTableHeader>        mHeader;

@end

@implementation ZCTableView
@synthesize mFooter;
@synthesize mHeader;
@synthesize mRefreshHeader;
@synthesize mRefreshFooter;

-(void)setMRefreshFooter:(UIView<ZCRefreshProtocol> *)mRefreshFooter_
{
    self.mFooter.mRefreshFooter = mRefreshFooter_;
    mRefreshFooter = mRefreshFooter_;
}

-(void)setMRefreshHeader:(UIView<ZCRefreshProtocol> *)mRefreshHeader_
{
    self.mHeader.mRefreshHeader = mRefreshHeader_;
    mRefreshHeader = mRefreshHeader_;
}

//-(UIView<MKRefreshProtocol>*)mRefreshFooter
//{
//    if (mRefreshFooter==nil) {
//        mr
//    }
//    
//    return mRefreshFooter;
//}
//
//-(UIView<MKRefreshProtocol>*)mRefreshHeader
//{
//    if (mRefreshHeader==nil) {
//        <#statements#>
//    }
//    
//    return mRefreshHeader;
//}

-(id<ZCTableFoot>)mFooter
{
    if (mFooter==nil) {
        mFooter = [[ZCTableCFoot alloc] init];
    }
    
    return mFooter;
}

-(id<MKTableHeader>)mHeader
{
    if (mHeader==nil) {
        mHeader = [[ZCTableCHeader alloc] init];
    }
    return mHeader;
}

-(id)initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame WithRefreshHeader:NO WithRefreshFooter:NO];
}

-(id) initWithFrame:(CGRect)frame WithRefreshHeader:(BOOL)_hye WithRefreshFooter:(BOOL)_fye
{
    self = [super initWithFrame:frame];
    if (self) {
        
        __weak typeof(self) _weakself = self;
        if (_hye) {
            
            [self.mHeader plugScrollview:self];
            self.mHeader.refreshBlock = ^(void){
                //
                [_weakself refresh];
            };
            
            //
            self.mHeader.refreshEndBlock = ^(void){
                //
                
            };

        }
        
        //添加footer
        if (_fye) {
            [self.mFooter plugScrollview:self];
            self.mFooter.loadMoreBlock = ^(void){
                
                [_weakself loadmore];
            };

        }
        
    }
    
    return self;
}

-(void)refresh
{
    if (self.refreshBlock) {
        self.refreshBlock();
    }
}

-(void)loadmore
{
    if (self.loadmoreBlock) {
        self.loadmoreBlock();
    }
}

-(void) reloadData
{
    if (self.mFooter) {
        [self.mFooter stopRefresh];
    }
    
    if (self.mHeader) {
        [self.mHeader stopRefresh];
    }
    
    [super reloadData];

}

/**
 *  强制刷新
 */
-(void)forceRefrsh
{
    //
    if (self.mHeader) {
        [self.mHeader forceRefresh];
    }
    
}

@end
