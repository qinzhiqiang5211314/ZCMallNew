//
//  ZCShopingTableCell.h
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "ZCComUITableCell.h"

@interface ZCShopingTableCell : ZCComUITableCell
{
    
}
+ (instancetype)cellWithTableView:(UITableView *)tableView WithSize:(CGSize)_size;

@property(nonatomic,strong)id               mData;
@property(nonatomic,copy)void(^gotoShopsBlock)(id);

@end
