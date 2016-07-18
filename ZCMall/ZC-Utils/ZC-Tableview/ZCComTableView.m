//
//  MKFindPeerTableView.m
//  MK
//
//  Created by hgh on 16/6/16.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCComTableView.h"


@interface ZCComTableView()<UITableViewDelegate,UITableViewDataSource>
{
    
}

@end


@implementation ZCComTableView


-(id) initWithFrame:(CGRect)frame
{
    return [self initWithFrame:frame WithRefreshHeader:NO WithRefreshFooter:NO];
}

-(void) reloadData
{
    [mTableView reloadData];
}

/**
 *  初始化实例
 *
 *  @param frame 大小位置
 *  @param _ye   是否带顶部刷新
 *  @param _ye   是否带底部刷新
 *
 *  @return 返回实例
 */
-(id) initWithFrame:(CGRect)frame WithRefreshHeader:(BOOL)_haveHeader WithRefreshFooter:(BOOL)_haveFooter
{
    self = [super initWithFrame:frame];
    if (self) {
        
        //
        mTableView = [[ZCTableView alloc]initWithFrame:CGRectMake(0,0,frame.size.width,frame.size.height) WithRefreshHeader:_haveHeader WithRefreshFooter:_haveFooter];
        [self addSubview:mTableView];
        mTableView.delegate = self;
        mTableView.dataSource = self;
        mTableView.separatorStyle = YES;
        mTableView.showsVerticalScrollIndicator = NO;
        mTableView.showsHorizontalScrollIndicator=NO;
        
        mTableView.tableFooterView = [UIView new];
        //mTableView.backgroundColor = [UIColor blackColor];
        
        __weak typeof(self) _weakself = self;
        
        mTableView.loadmoreBlock = ^(void){
        
            [_weakself tableviewLoadmore];
        };
        
        mTableView.refreshBlock = ^(void){
        
            [_weakself tableviewRefresh];
        };
    
        
    }
    
    return self;

}

-(void) tableviewRefresh
{
    if (self.refreshBlock) {
        self.refreshBlock();
    }
}

-(void) tableviewLoadmore
{
    if (self.loadMoreBlock) {
        self.loadMoreBlock();
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 104;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;//[_array count];
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        cell.backgroundView = nil;
        cell.textLabel.textColor = [UIColor colorWithWhite:1.0f alpha:0.95f];
        
    }
    
    //cell.backgroundColor = [self randomColor];
    return cell;
    
}



@end
