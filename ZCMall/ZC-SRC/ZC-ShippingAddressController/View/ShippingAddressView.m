//
//  ShippingAddressView.m
//  ZhongChao
//
//  Created by 秦志强 on 16/7/12.
//  Copyright © 2016年 秦志强. All rights reserved.
//

#import "ShippingAddressView.h"
#import "AddressModel.h"

@interface ShippingAddressView()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_addressTableView;
    NSMutableArray *_addressArray;
    AddressModel *_model;
}
@end
@implementation ShippingAddressView

-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        _addressArray=[[NSMutableArray alloc]init];
        [self showData];
        [self createUI];
    }
    return self;
}

-(void)showData{
    for (int i=0; i<5; i++) {
        AddressModel *_addressModel=[[AddressModel alloc]init];
        _addressModel.userName=@"陆大大";
        _addressModel.userPhone=@"15651739155";
        _addressModel.userAddress=@"江苏省南京市江宁区啊实打实大师的卢卡斯阿斯顿发生反馈啦煞风景啊失联飞机阿斯利康风景";
        [_addressArray addObject:_addressModel];
    }
}

-(void)createUI{
    self.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:240.0/255.0 blue:239.0/255.0 alpha:1];
    _addressTableView =[[UITableView alloc]initWithFrame:self.bounds];
    _addressTableView.dataSource=self;
    _addressTableView.delegate=self;
    _addressTableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    [self addSubview:_addressTableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _addressArray.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId =@"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        _model=_addressArray[indexPath.row];
        UILabel *userNameLabel =[[UILabel alloc]initWithFrame:CGRectMake(10, 15, 150, 20)];
        userNameLabel.text=_model.userName;
        userNameLabel.textColor=[UIColor grayColor];
        userNameLabel.font=[UIFont systemFontOfSize:15];
        [cell.contentView addSubview:userNameLabel];
        
        UILabel *userPhoneLabel =[[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-115, 15,100, 20)];
        userPhoneLabel.text=_model.userPhone;
        userPhoneLabel.textColor=[UIColor grayColor];
        userPhoneLabel.font=[UIFont systemFontOfSize:15];
        [cell.contentView addSubview:userPhoneLabel];
        
        UIFont *font = [UIFont systemFontOfSize:15];
        CGSize size = CGSizeMake(self.frame.size.width-20,200);
        CGRect labelRect = [_model.userAddress boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
        UILabel *userAddressLabel =[[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(userPhoneLabel.frame)+10,self.frame.size.width-20, labelRect.size.height)];
        userAddressLabel.text=_model.userAddress;
        userAddressLabel.numberOfLines =0;
        userAddressLabel.lineBreakMode = NSLineBreakByCharWrapping;
        userAddressLabel.textColor=[UIColor grayColor];
        userAddressLabel.font=[UIFont systemFontOfSize:15];
        [cell.contentView addSubview:userAddressLabel];
        
        UILabel *hxLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 90, self.frame.size.width, 10)];
        hxLabel.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:240.0/255.0 blue:239.0/255.0 alpha:1];
        [cell.contentView addSubview:hxLabel];
    
    }
    
    return cell;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
