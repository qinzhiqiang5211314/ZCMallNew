//
//  ZCShopingView.m
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "ZCShopingView.h"
#import "ZCShopingTableCell.h"

@interface ZCShopingView()
{
    
}

@end

@implementation ZCShopingView
@synthesize mDataSource;
@synthesize mDelegate;

-(void) setMDataSource:(NSMutableArray *)mDataSource_
{
    mDataSource = mDataSource_;
    [mTableView reloadData];
}

-(id) initWithFrame:(CGRect)frame WithRefreshHeader:(BOOL)_haveHeader WithRefreshFooter:(BOOL)_haveFooter
{
    self = [super initWithFrame:frame WithRefreshHeader:_haveHeader WithRefreshFooter:_haveFooter];
    if (self) {
        
        
    }
    
    return self;
    
}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.mDataSource.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 156;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //
    float height = [tableView rectForRowAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:indexPath.section]].size.height;

    
    static NSString *cellId = @"ZCShopingTableCell";
    ZCShopingTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        
        __weak typeof(self) _weakself = self;
        cell = [[ZCShopingTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId WithSize:CGSizeMake(tableView.frame.size.width, height)];
        cell.backgroundColor = [UIColor clearColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        cell.gotoShopsBlock= ^(id _dt){
        
            [_weakself productButtonClick:_dt];
        };

        
    }
    
    cell.mData = [self.mDataSource objectAtIndex:indexPath.row];
    
    
    return cell;

}

-(void)productButtonClick:(id)_dt{
        //
    //
    if (self.mDelegate) {
        [self.mDelegate gotoShops:_dt];
    }

}


@end
