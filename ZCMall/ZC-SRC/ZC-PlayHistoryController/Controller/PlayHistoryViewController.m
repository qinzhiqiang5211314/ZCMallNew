//
//  PlayHistoryViewController.m
//  ZhongChao
//
//  Created by 秦志强 on 16/7/13.
//  Copyright © 2016年 秦志强. All rights reserved.
//

#import "PlayHistoryViewController.h"
#import "PlayHistoryView.h"
@interface PlayHistoryViewController ()

@end

@implementation PlayHistoryViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    /*
     *  添加导航栏
     */
    [self loadHeaderView];
    PlayHistoryView *_playHisView =[[PlayHistoryView alloc]initWithFrame:CGRectMake(0, APP_NaviH, APPWIDTH, APPHEIGHT-APP_NaviH)];
    [self.view addSubview:_playHisView];
    // Do any additional setup after loading the view.
}

-(void)loadHeaderView{
    [self.mNavgationBar setMTitleStr:@"播放历史"];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
