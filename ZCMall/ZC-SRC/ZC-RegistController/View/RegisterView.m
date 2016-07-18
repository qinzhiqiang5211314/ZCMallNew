//
//  RegisterView.m
//  ZhongChao
//
//  Created by 秦志强 on 16/7/11.
//  Copyright © 2016年 秦志强. All rights reserved.
//

#import "RegisterView.h"

@implementation RegisterView



-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    
    return self;
}


-(void)createUI{
    self.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:240.0/255.0 blue:239.0/255.0 alpha:1];
    
    UITextField *_textField =[[UITextField alloc]initWithFrame:CGRectMake(0, 20, self.frame.size.width, 44)];
    _textField.placeholder=@"请输入手机号";
    CGRect rect = _textField.frame;
    rect.size.height = 44;
    _textField.frame = rect;
    _textField.backgroundColor=[UIColor whiteColor];
    [self addSubview:_textField];

    UIButton *_nextButton =[[UIButton alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(_textField.frame)+30, self.bounds.size.width-40, 45)];
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
