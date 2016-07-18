//
//  ZCShopingSelectBar.m
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//




#import "ZCShopingSelectBar.h"

@interface ZCShopingSelectBar ()
{
    UILabel *hjALLLabel;
    UILabel *priceALLLabel;
    UILabel *yfLabel;
}

@end

@implementation ZCShopingSelectBar
@synthesize mDelegate;


/**
 *  更新价格
 *
 *  @param _money 商品总价格
 */
-(void) modifyExpenses:(float)_money
{
    NSString *numberStr=[NSString stringWithFormat:@"合计: ¥%f",_money];
    CGSize numberCG =[numberStr sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    
    
    CGSize priceCG =[[NSString stringWithFormat:@"¥%f",_money] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    
    
    hjALLLabel.frame =CGRectMake(self.frame.size.width-numberCG.width-115, 12, 36, 15);
    priceALLLabel.frame =CGRectMake(CGRectGetMaxX(hjALLLabel.frame), 12, priceCG.width, 15);
    priceALLLabel.text=[NSString stringWithFormat:@"¥%f",_money];
    
    
    yfLabel.frame =CGRectMake(self.frame.size.width-48-115, CGRectGetMaxY(priceALLLabel.frame)+4, 48, 12);
}

-(id) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //
        UIView *dbView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, frame.size.height)];
        [self addSubview:dbView];
        
        UILabel *hxLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.frame.size.width, 1)];
        hxLabel.backgroundColor=CART_HX_COLOR;
        [dbView addSubview:hxLabel];
        UIButton *productTwoButton =[[UIButton alloc]initWithFrame:CGRectMake(15, 14, 20,20)];
        [productTwoButton setBackgroundImage:[UIImage imageNamed:@"btn_noselect@3x.png"] forState:UIControlStateNormal];
        [productTwoButton setBackgroundImage:[UIImage imageNamed:@"icon1_logistics@2x"] forState:UIControlStateSelected];
        [productTwoButton addTarget:self action:@selector(productButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [dbView addSubview:productTwoButton];
        
        UILabel *checkALLLabel=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(productTwoButton.frame)+15, 16, 34, 17)];
        checkALLLabel.text=@"全选";
        checkALLLabel.textColor=CART_TEXT_COLOR;
        checkALLLabel.font=[UIFont systemFontOfSize:17];
        [dbView addSubview:checkALLLabel];
        
        
       
        hjALLLabel=[[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-60-115, 12, 36, 15)];
        hjALLLabel.text=@"合计: ";
        hjALLLabel.textColor=CART_TEXT_COLOR;
        hjALLLabel.font=[UIFont systemFontOfSize:15];
        [dbView addSubview:hjALLLabel];
        
        priceALLLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(hjALLLabel.frame), 12, 60, 15)];
        
        priceALLLabel.textColor=[UIColor colorWithRed:228.0/255.0 green:0.0/255.0 blue:127.0/255.0 alpha:1];
        priceALLLabel.font=[UIFont systemFontOfSize:15];
        [dbView addSubview:priceALLLabel];
        
        yfLabel =[[UILabel alloc]initWithFrame:CGRectMake(self.frame.size.width-48-115, CGRectGetMaxY(priceALLLabel.frame)+4, 48, 12)];
        yfLabel.text=@"不含运费";
        yfLabel.textColor=[UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1];
        yfLabel.font=[UIFont systemFontOfSize:12];
        [dbView addSubview:yfLabel];
        
        
        UIButton *balanceButton=[[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-100, 5, 90, 40)];
        balanceButton.backgroundColor =[UIColor colorWithRed:228.0/255.0 green:0.0/255.0 blue:127.0/255.0 alpha:1];
        [balanceButton setTitle:@"结算" forState:UIControlStateNormal];
        [balanceButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [balanceButton addTarget:self action:@selector(gotoPays:) forControlEvents:UIControlEventTouchUpInside];
        balanceButton.titleLabel.font=[UIFont systemFontOfSize:18];
        balanceButton.layer.masksToBounds=YES;
        balanceButton.layer.cornerRadius=7.0;
        [dbView addSubview:balanceButton];
        
        UILabel *hxTwoLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 48, self.frame.size.width, 1)];
        hxTwoLabel.backgroundColor=CART_HX_COLOR;
        [dbView addSubview:hxTwoLabel];

        
    }
    return self;
}

-(void)productTwoButton:(UIButton*)_send
{
    BOOL _ye = [_send isSelected];
    [_send setSelected:!_ye];
    if (self.mDelegate) {
        if (!_ye) {
            [self.mDelegate selectAllAction];
            
        }else
        {
            [self.mDelegate cancelSelectAction];
        }
        
    }
}

-(void)gotoPays:(id)_send
{
    //
    
    if (self.mDelegate) {
        [self.mDelegate gotoPay];
    }
}


@end
