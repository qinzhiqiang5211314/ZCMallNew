//
//  ForgotPasswordView.m
//  ZhongChao
//
//  Created by 秦志强 on 16/7/11.
//  Copyright © 2016年 秦志强. All rights reserved.
//

#import "ForgotPasswordView.h"

@interface ForgotPasswordView()
{
    NSArray *forGotArray;
    NSArray *forGotDescArray;
}
@end
@implementation ForgotPasswordView



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
    forGotArray=[[NSArray alloc]initWithObjects:@"账号名",@"验证码", nil];
    forGotDescArray=[[NSArray alloc]initWithObjects:@"请输入手机号",@"请输入验证码", nil];
    for (int i=0; i<forGotArray.count; i++) {
        UILabel *loginLabel =[[UILabel alloc]initWithFrame:CGRectMake(15, 0+i*45, 45, (topView.frame.size.height-1)/2)];
        loginLabel.text=forGotArray[i];
        loginLabel.textColor=[UIColor colorWithRed:154.0/255.0 green:154.0/255.0 blue:154.0/255.0 alpha:1];
        loginLabel.font=[UIFont systemFontOfSize:15];
        [topView addSubview:loginLabel];
        
        UITextField *_textField =[[UITextField alloc]initWithFrame:CGRectMake(CGRectGetMaxX(loginLabel.frame)+15, 0+i*45, self.frame.size.width-60, 44)];
        CGRect rect = _textField.frame;
        rect.size.height = 44;
        _textField.frame = rect;
        _textField.placeholder=forGotDescArray[i];
        _textField.backgroundColor=[UIColor whiteColor];
        [topView addSubview:_textField];
        if (i==0) {
            UILabel *hxLabel=[[UILabel alloc]initWithFrame:CGRectMake(15, 44, self.frame.size.width-15, 1)];
            hxLabel.backgroundColor=[UIColor colorWithRed:249.0/255.0 green:249.0/255.0 blue:249.0/255.0 alpha:1];
            [topView addSubview:hxLabel];
            
     
        }
        
        if (i==1) {
            UIButton *getCodeButton =[[UIButton alloc]initWithFrame:CGRectMake(self.frame.size.width-105, 55.5, 90, 23)];
            [getCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
            [getCodeButton setTitleColor:[UIColor colorWithRed:151.0/255.0 green:151.0/255.0 blue:151.0/255.0 alpha:1] forState:UIControlStateNormal];
            getCodeButton.titleLabel.font=[UIFont systemFontOfSize:12];
            getCodeButton.layer.borderWidth=1;
            getCodeButton.layer.masksToBounds=YES;
            getCodeButton.layer.cornerRadius=5.0;
            getCodeButton.layer.borderColor=[UIColor colorWithRed:151.0/255.0 green:151.0/255.0 blue:151.0/255.0 alpha:1] .CGColor;
            [topView addSubview:getCodeButton];
        }
    }
    
    
    
    UIButton *_nextButton =[[UIButton alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(topView.frame)+30, self.bounds.size.width-40, 45)];
    [_nextButton setTitle:@"下一步" forState:UIControlStateNormal];
    [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _nextButton.titleLabel.font=[UIFont systemFontOfSize:15];
    _nextButton.backgroundColor=[UIColor colorWithRed:231.0/255.0 green:75.0/255.0 blue:128.0/255.0 alpha:1];
    _nextButton.layer.cornerRadius=8.0;
    [self addSubview:_nextButton];
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
