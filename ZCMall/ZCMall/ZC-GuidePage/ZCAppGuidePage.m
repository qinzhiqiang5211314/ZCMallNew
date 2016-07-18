//
//  MKAppGuidePage.m
//  MK
//
//  Created by 李和平 on 16/6/22.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCAppGuidePage.h"

@implementation ZCAppGuidePage

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initContentView];
    }
    return self;
}

- (void)initContentView {
    UIScrollView *scroll = [[UIScrollView alloc] initWithFrame:self.bounds];
    scroll.showsHorizontalScrollIndicator = NO;
    scroll.showsVerticalScrollIndicator = NO;
    scroll.bounces = NO;
    scroll.pagingEnabled = YES;
    [self addSubview:scroll];
    
    NSInteger pageNum = 4;
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    for (int i = 0; i < pageNum; i++) {
        UIImageView *imgView = [[UIImageView alloc] initWithFrame:CGRectMake(width*i, 0, width, height)];
        imgView.image = [UIImage imageNamed:[NSString stringWithFormat:@"page%d.png",i+1]];
        [scroll addSubview:imgView];
        
        if (i == pageNum-1) {
            //            UIImage *image = [UIImage imageWithContentsOfFile:[MHFileTool getUI_IMG_Resources:@"guide_btn_ex.png"]];
            UIButton *btn = [[UIButton alloc] initWithFrame:imgView.bounds];
            //            [btn setTitle:@"立即体验" forState:UIControlStateNormal];
            //            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(experienceNowAction) forControlEvents:UIControlEventTouchUpInside];
            [imgView addSubview:btn];
            //            btn.titleLabel.font = DEFAULT_FONT(18);
            //            btn.layer.cornerRadius = btn.bounds.size.height/2.0;
            //            btn.layer.masksToBounds = YES;
            //            [btn setBackgroundImage:[UIImage createImageWithColor:RGBA(152, 218, 240, 0.9)] forState:0];
            imgView.userInteractionEnabled = YES;
        }
    }
    scroll.contentSize = CGSizeMake(width*pageNum, 0);
}

- (void)experienceNowAction {
    [UIView animateWithDuration:1.0 animations:^{
        self.alpha = 0.0;
        self.transform = CGAffineTransformMakeScale(1.5, 1.5);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        
        
        
    }];
}

@end
