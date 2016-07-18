//
//  MainCell.m
//  ChinaDance
//
//  Created by hgh on 16/4/1.
//  Copyright © 2016年 hgh. All rights reserved.
//

#import "ZCComUITableCell.h"

@interface ZCComUITableCell()<UIAlertViewDelegate>
{
    
    
}

@end

@implementation ZCComUITableCell

- (void)awakeFromNib {

    // Initialization code
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier WithSize:(CGSize)_size
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        [self uiLayout:_size];
    }
    return self;
}

- (void)uiLayout:(CGSize)_size
{
    
}




@end
