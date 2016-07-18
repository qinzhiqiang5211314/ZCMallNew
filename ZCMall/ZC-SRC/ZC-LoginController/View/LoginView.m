//
//  LoginView.m
//  ZhongChao
//
//  Created by 秦志强 on 16/7/11.
//  Copyright © 2016年 秦志强. All rights reserved.
//

#import "LoginView.h"


@interface LoginView()
{
    NSArray *loginArray;
    NSArray *loginDescArray;
}
@end
@implementation LoginView


-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    
    return self;
}

-(void)createUI{
    self.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:240.0/255.0 blue:239.0/255.0 alpha:1];
    UIView *topView =[[UIView alloc]initWithFrame:CGRectMake(0, 20, self.frame.size.width,89)];
    topView.backgroundColor=[UIColor whiteColor];
    [self addSubview:topView];
    loginArray=[[NSArray alloc]initWithObjects:@"账号",@"密码", nil];
    loginDescArray=[[NSArray alloc]initWithObjects:@"请输入手机号",@"请输入密码", nil];
    for (int i=0; i<loginArray.count; i++) {
        UILabel *loginLabel =[[UILabel alloc]initWithFrame:CGRectMake(15, 0+i*45, 30, (topView.frame.size.height-1)/2)];
        loginLabel.text=loginArray[i];
        loginLabel.textColor=[UIColor colorWithRed:154.0/255.0 green:154.0/255.0 blue:154.0/255.0 alpha:1];
        loginLabel.font=[UIFont systemFontOfSize:15];
        [topView addSubview:loginLabel];
        
        UITextField *_textField =[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(loginLabel.frame)+15, 0+i*45, self.frame.size.width-60, 44)];
        CGRect rect = _textField.frame;
        rect.size.height = 44;
        _textField.frame = rect;
        _textField.placeholder=loginDescArray[i];
        _textField.backgroundColor=[UIColor whiteColor];
        [topView addSubview:_textField];
        if (i==0) {
            UILabel *hxLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, 44, self.frame.size.width-15, 1)];
            hxLabel.backgroundColor=[UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1];
            [topView addSubview:hxLabel];
        }
    }
    
    
    UIButton *_nextButton =[[UIButton alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(topView.frame)+30, self.bounds.size.width-40, 45)];
    [_nextButton setTitle:@"登录" forState:UIControlStateNormal];
    [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _nextButton.titleLabel.font=[UIFont systemFontOfSize:15];
    _nextButton.backgroundColor=[UIColor colorWithRed:231.0/255.0 green:75.0/255.0 blue:128.0/255.0 alpha:1];
    [_nextButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    _nextButton.layer.cornerRadius=8.0;
    [self addSubview:_nextButton];
    
    UIButton *_phoneRegButton=[[UIButton alloc]initWithFrame:CGRectMake(15, CGRectGetMaxY(_nextButton.frame)+20, 90, 20)];
    [_phoneRegButton setTitle:@"手机快速注册" forState:UIControlStateNormal];
    _phoneRegButton.titleLabel.font=[UIFont systemFontOfSize:15];
    [_phoneRegButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [_phoneRegButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_phoneRegButton];
    
    
    UIButton *_passButton=[[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-75, CGRectGetMaxY(_nextButton.frame)+20, 60, 20)];
    [_passButton setTitle:@"找回密码" forState:UIControlStateNormal];
    _passButton.titleLabel.font=[UIFont systemFontOfSize:15];
    [_passButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [_passButton setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self addSubview:_passButton];
}

-(void)buttonClick:(UIButton *)sender{
    if (_blocks!=nil) {
        _blocks(sender.titleLabel.text);
    }
}

-(void)showLoginBlock:(login_block) loginBlocks{
    _blocks=loginBlocks;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
