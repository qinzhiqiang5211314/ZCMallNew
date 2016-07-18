//
//  ZCShopingTableCell.m
//  ZCMall
//
//  Created by hgh on 16/7/16.
//  Copyright © 2016年 FHHY. All rights reserved.
//




#import "ZCShopingTableCell.h"
#import "ZCShoppingModel.h"

@interface ZCShopingTableCell()
{
    UIButton *productButton;
    UILabel *titleLabe;
    UIView *productView;
    UILabel *hxLabel;
    UILabel *proNameLabel;
    UILabel *typeLabel;
    UILabel *priceLabel;
    UILabel *numberLabel;
    
}

@end

@implementation ZCShopingTableCell
@synthesize mData;
@synthesize gotoShopsBlock;

+ (instancetype)cellWithTableView:(UITableView *)tableView WithSize:(CGSize)_size
{
    static NSString *cellId = @"ZCShopingTableCell";
    ZCShopingTableCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell) {
        
        cell = [[ZCShopingTableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId WithSize:_size];
        
    }
    return cell;
}

- (void)uiLayout:(CGSize)_size
{
    //
    
    productButton =[[UIButton alloc]initWithFrame:CGRectMake(15, 13, 20,20)];
    [productButton setBackgroundImage:[UIImage imageNamed:@"btn_noselect@3x.png"] forState:UIControlStateNormal];
    [productButton setBackgroundImage:[UIImage imageNamed:@"icon1_logistics@2x"] forState:UIControlStateSelected];
    [productButton addTarget:self action:@selector(productButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:productButton];
    
    
    titleLabe=[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxY(productButton.frame)+15, 15, 40, 15)];
    titleLabe.textColor=CART_TEXT_COLOR;
    titleLabe.font=[UIFont systemFontOfSize:15];
    [self.contentView addSubview:titleLabe];
    
    
    
    
    UIImageView *backImagView =[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(titleLabe.frame)+10, 15, 15, 15.0/(24/30))];
    backImagView.image=[UIImage imageNamed:@"Slice 9@2x"];
    [self.contentView addSubview:backImagView];
    
    UIButton *editorButton =[[UIButton alloc]initWithFrame:CGRectMake(APPWIDTH-43, 15, 28, 14)];
    [editorButton setTitle:@"编辑" forState:UIControlStateNormal];
    [editorButton setTitleColor:CART_TEXT_COLOR forState:UIControlStateNormal];
    editorButton.titleLabel.font=[UIFont systemFontOfSize:14];
    [self.contentView addSubview:editorButton];
    
    hxLabel =[[UILabel alloc]initWithFrame:CGRectMake(0, 44, APPWIDTH, 1)];
    hxLabel.backgroundColor=CART_HX_COLOR;
    [self.contentView addSubview:hxLabel];
    
    
    
    UIButton *productTwoButton =[[UIButton alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(hxLabel.frame)+30, 20,20)];
    [productTwoButton setBackgroundImage:[UIImage imageNamed:@"btn_noselect@3x.png"] forState:UIControlStateNormal];
    [productTwoButton setBackgroundImage:[UIImage imageNamed:@"icon1_logistics@2x"] forState:UIControlStateSelected];
    [productTwoButton addTarget:self action:@selector(productButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:productTwoButton];
    
    productView =[[UIView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(productTwoButton.frame)+15, CGRectGetMaxY(hxLabel.frame)+5, 90, 90)];
    productView.layer.borderColor=CART_HX_COLOR.CGColor;
    productView.layer.borderWidth=0.5;
    [self.contentView addSubview:productView];
    
    UIImageView *productImageView =[[UIImageView alloc]initWithFrame:productView.bounds];
    productImageView.image =[UIImage imageNamed:@"pic2@2x"];
    [productView addSubview:productImageView];
    

    
    proNameLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(productView.frame)+15,  CGRectGetMaxY(hxLabel.frame)+5, APPWIDTH-155, 30)];
    proNameLabel.numberOfLines = 0;
    proNameLabel.textColor=CART_TEXT_COLOR;
    proNameLabel.font=[UIFont systemFontOfSize:15];
    proNameLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [self.contentView addSubview:proNameLabel];
    
    
    typeLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(productView.frame)+15, CGRectGetMaxY(proNameLabel.frame)+10, APPWIDTH-155, 15)];
    
    typeLabel.textColor=[UIColor colorWithRed:155.0/255.0 green:155.0/255.0 blue:155.0/255.0 alpha:1];
    typeLabel.font=[UIFont systemFontOfSize:13];
    [self.contentView addSubview:typeLabel];
    
    
    priceLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(productView.frame)+15, CGRectGetMaxY(typeLabel.frame)+10,100, 15)];
    
    priceLabel.textColor=[UIColor colorWithRed:228.0/255.0 green:0.0/255.0 blue:127.0/255.0 alpha:1];
    priceLabel.font=[UIFont systemFontOfSize:17];
    [self.contentView addSubview:priceLabel];
    
    
    
    numberLabel =[[UILabel alloc]initWithFrame:CGRectMake(-30-15, CGRectGetMaxY(typeLabel.frame)+10,30, 15)];
    numberLabel.textColor=CART_TEXT_COLOR;
    numberLabel.font=[UIFont systemFontOfSize:15];
    [self.contentView addSubview:numberLabel];
    
    
    UIView *dbView =[[UIView alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(productView.frame)+5, APPWIDTH, 10)];
    dbView.backgroundColor=CART_HX_COLOR;
    [self.contentView addSubview:dbView];

}

-(void)setMData:(id)mData_
{
    //
    mData = mData_;
    //
    ZCShoppingModel*_model = mData;
    
    
    CGSize productTitleCG =[_model.productTitle sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
    titleLabe.frame = CGRectMake(CGRectGetMaxY(productButton.frame)+15, 15, productTitleCG.width, 15);
    titleLabe.text=_model.productTitle;;

    NSString *produtDescStr =[NSString stringWithFormat:@"%@ %@ %@",_model.productName,_model.productDesc,_model.producSubhead];
    
    UIFont *font = [UIFont systemFontOfSize:15];
    CGSize size = CGSizeMake(APPWIDTH-155,200);
    CGRect labelRect = [produtDescStr boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
    proNameLabel.frame = CGRectMake(CGRectGetMaxX(productView.frame)+15,  CGRectGetMaxY(hxLabel.frame)+5, APPWIDTH-155, 30);
    proNameLabel.text=produtDescStr;
    
    typeLabel.frame = CGRectMake(CGRectGetMaxX(productView.frame)+15, CGRectGetMaxY(proNameLabel.frame)+10, APPWIDTH-155, 15);
    typeLabel.text=[NSString stringWithFormat:@"分类 :%@",_model.productType];
    
    priceLabel.frame = CGRectMake(CGRectGetMaxX(productView.frame)+15, CGRectGetMaxY(typeLabel.frame)+10,100, 15);
    priceLabel.text=[NSString stringWithFormat:@"¥ %@",_model.producPrice];
    
    
    //
    NSString *numberStr=[NSString stringWithFormat:@"x %@",_model.productNumber];
    CGSize numberCG =[numberStr sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15]}];
    
    
    numberLabel.frame = CGRectMake(APPWIDTH-numberCG.width-15, CGRectGetMaxY(typeLabel.frame)+10,numberCG.width, 15);
    numberLabel.text=numberStr;
    
}

-(void)productButtonClick:(UIButton*)_sender
{
    if (self.gotoShopsBlock) {
        self.gotoShopsBlock(self.mData);
    }
}


@end
