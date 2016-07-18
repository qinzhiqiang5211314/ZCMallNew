//
//  ZCMineView.m
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//

#import "ZCMineView.h"


@interface ZCMineView()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSArray *_topArray;
    NSArray *_cellArray;
    NSArray *_loginArray;
    UIView *headView;
}
@end
@implementation ZCMineView


-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        
        [self showData];
        [self createUI];
    }
    
    return self;
}


-(void)showData{
    _loginArray=[[NSArray alloc]initWithObjects:@"登录",@"注册", nil];
    _topArray =[[NSArray alloc]initWithObjects:@"待付款",@"待发货",@"待收货",@"待评价",@"退款", nil];
    _cellArray=[[NSArray alloc]initWithObjects:@"收货地址",@"优惠券",@"我的收藏",@"播放历史",@"浏览历史",@"意见反馈",@"关于我们", nil];
}
-(void)createUI{
   
    _tableView=[[UITableView alloc]initWithFrame:self.bounds];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    headView=[[UIView alloc]init];
    _tableView.tableHeaderView=headView;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self addSubview:_tableView];
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 352;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    headView.backgroundColor=CART_HX_COLOR;
    UIView *topView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, APPWIDTH, 210)];
    topView.backgroundColor=[UIColor redColor];
    [headView addSubview:topView];
    
    UIImageView *setUpImageView =[[UIImageView alloc]initWithFrame:CGRectMake(APPWIDTH-45, 40, 30, 30)];
    setUpImageView.image =[UIImage imageNamed:@"退款"];
    [topView addSubview:setUpImageView];
    
    UIImageView *perImageView =[[UIImageView alloc]initWithFrame:CGRectMake((APPWIDTH-100)/2, 55, 100, 100)];
    perImageView.image=[UIImage imageNamed:@"icon_defaulthead@2x"];
    [topView addSubview:perImageView];
//    68+17
    for(int i=0;i<_loginArray.count;i++){
        UIButton *_loginButton =[[UIButton alloc]initWithFrame:CGRectMake((APPWIDTH-85)/2+i*(34+17), CGRectGetMaxY(perImageView.frame)+19, 34, 18)];
        [_loginButton setTitle:_loginArray[i] forState:UIControlStateNormal];
        [_loginButton setTitleColor:[UIColor whiteColor]  forState:UIControlStateNormal];
        _loginButton.titleLabel.font=[UIFont systemFontOfSize:17];
        [_loginButton addTarget:self action:@selector(loginButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [topView addSubview:_loginButton];
    
        if (i==0) {
            UILabel *sxLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_loginButton.frame)+8, CGRectGetMaxY(perImageView.frame)+17, 1, 20)];
            sxLabel.backgroundColor=CART_HX_COLOR;
            [topView addSubview:sxLabel];
            
        }
        
    }
    
    UIButton *userButton=[[UIButton alloc]initWithFrame:CGRectMake(APPWIDTH-90, CGRectGetMaxY(perImageView.frame)+17, 75, 20)];
    userButton.backgroundColor=[UIColor clearColor];
    [userButton setTitle:@"账户管理" forState:UIControlStateNormal];
    [userButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    userButton.titleLabel.font=[UIFont systemFontOfSize:13];
    userButton.layer.borderWidth=1;
    userButton.layer.cornerRadius=8.0;
    userButton.layer.borderColor=[UIColor whiteColor].CGColor;
    [topView addSubview:userButton];
    
    UIView *dbView =[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(topView.frame)+10, APPWIDTH, 122)];
    dbView.backgroundColor=[UIColor whiteColor];
    [headView addSubview:dbView];
    
    UILabel *hxLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 45, APPWIDTH, 1)];
    hxLabel.backgroundColor=CART_HX_COLOR;
    [dbView addSubview:hxLabel];
    
    UIImageView * myOrderImageView =[[UIImageView alloc]initWithFrame:CGRectMake(17, 11,23, 23)];
    myOrderImageView.image=[UIImage imageNamed:@"我的订单"];
    [dbView addSubview:myOrderImageView];
    
    UILabel *myOrderLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(myOrderImageView.frame)+17, 0, 100, 45)];
    myOrderLabel.text=@"我的订单";
    myOrderLabel.textColor=CART_TEXT_COLOR;
    myOrderLabel.font=[UIFont systemFontOfSize:15];
    [dbView addSubview:myOrderLabel];
    
    UIImageView *backImageView =[[UIImageView alloc]initWithFrame:CGRectMake(APPWIDTH-34, 15,12, 15)];
    backImageView.image=[UIImage imageNamed:@"Slice 9@2x"];
    [dbView addSubview:backImageView];
    
    for (int i=0; i<_topArray.count; i++) {
        UIView *myOrderView =[[UIView alloc]initWithFrame:CGRectMake(0+i*APPWIDTH/5, CGRectGetMaxY(hxLabel.frame), APPWIDTH/5, 76)];
        
        [dbView addSubview:myOrderView];
        
        UIImageView *myTypeImageView =[[UIImageView alloc]initWithFrame:CGRectMake((myOrderView.frame.size.width-34)/2, 12.5, 34,34)];
        myTypeImageView.image=[UIImage imageNamed:_topArray[i]];
        [myOrderView addSubview:myTypeImageView];
        
        UILabel *myTypeLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(myTypeImageView.frame)+5, myOrderView.frame.size.width, 12)];
        myTypeLabel.textAlignment=NSTextAlignmentCenter;
        myTypeLabel.text=_topArray[i];
        myTypeLabel.textColor=CART_TEXT_COLOR;
        myTypeLabel.font=[UIFont systemFontOfSize:12];
        [myOrderView addSubview:myTypeLabel];
        
    }
    return headView;
}


-(void)loginButtonClick:(UIButton *)sender{
    if (_block!=nil) {
        _block(sender.titleLabel.text);
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (_block!=nil) {
        _block(_cellArray[indexPath.row]);
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==4) {
        return 230/5+10;
    }
   return  230/5;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _cellArray.count;
}

-(void)showBlock:(ZCMine_Block) zcmBlock{
    _block=zcmBlock;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId=@"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        UIImageView *typeImageView =[[UIImageView alloc]initWithFrame:CGRectMake(17, 12.5, 23,23)];
        typeImageView.image=[UIImage imageNamed:_cellArray[indexPath.row]];
        [cell.contentView addSubview:typeImageView];
        
        UILabel *myTypeLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(typeImageView.frame)+17, 0, 60 ,230/5)];
        myTypeLabel.textAlignment=NSTextAlignmentLeft;
        myTypeLabel.text=_cellArray[indexPath.row];
        myTypeLabel.textColor=CART_TEXT_COLOR;
        myTypeLabel.font=[UIFont systemFontOfSize:15];
        [cell.contentView addSubview:myTypeLabel];
        
        UIImageView *backImageView =[[UIImageView alloc]initWithFrame:CGRectMake(APPWIDTH-34, ((230/5)-15)/2,12, 15)];
        backImageView.image=[UIImage imageNamed:@"Slice 9@2x"];
        [cell.contentView addSubview:backImageView];
        if (indexPath.row==4) {
            UILabel *hxLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 230/5, APPWIDTH, 10)];
            hxLabel.backgroundColor=CART_HX_COLOR;
            [cell.contentView addSubview:hxLabel];
        }
        
        UILabel *hxLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(typeImageView.frame)+17, 230/5-1, APPWIDTH-17+typeImageView.frame.size.width, 1)];
        hxLabel.backgroundColor=CART_HX_COLOR;
        [cell.contentView addSubview:hxLabel];
    }
    
    return cell;
}
@end
