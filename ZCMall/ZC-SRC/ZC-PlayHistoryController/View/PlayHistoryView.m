//
//  PlayHistoryView.m
//  ZhongChao
//
//  Created by 秦志强 on 16/7/13.
//  Copyright © 2016年 秦志强. All rights reserved.
//

#import "PlayHistoryView.h"
#import "PlayHistoryModel.h"

@interface PlayHistoryView()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
    NSMutableArray *_array;
     NSMutableArray *_arrayMoth;
    UIView *headView;
    PlayHistoryModel *_model;
}
@end
@implementation PlayHistoryView


-(id)initWithFrame:(CGRect)frame{
    self=[super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    
    return self;
}

-(void)createUI{
    _array=[[NSMutableArray alloc]init];
    _arrayMoth=[[NSMutableArray alloc]init];
    for (int i=0; i<2; i++) {
        PlayHistoryModel *_playModel=[[PlayHistoryModel alloc]init];
        _playModel.playHistoryImage=@"asdasdasdasd";
        _playModel.playHistoryTitle=@"仙仙与小白";
        _playModel.playHistoryTime=@"观看至00:30:20";
        [_array addObject:_playModel];
    }
    
    for (int i=0; i<4; i++) {
        PlayHistoryModel *_playModel=[[PlayHistoryModel alloc]init];
        _playModel.playHistoryImage=@"asdasdasdasd";
        _playModel.playHistoryTitle=@"仙仙与小白11111";
        _playModel.playHistoryTime=@"观看至00:30:20";
        [_arrayMoth addObject:_playModel];
    }
    _tableView=[[UITableView alloc]initWithFrame:self.bounds];
    _tableView.dataSource=self;
    _tableView.delegate=self;
    _tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    [self addSubview:_tableView];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return _array.count;
    }else if (section==1){
        return _arrayMoth.count;
    }else{
        return 0;
    }
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
  
    return 40;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
            
        case 0:
            
            return @"一周之内";
            
        case 1:
            
            return @"更早";
            
        default:
            
            return @"Unknown";  
            
    }  
    
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 81;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId =@"cell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:nil];
    }
    if (indexPath.section==0) {
        _model=_array[indexPath.row];
    }else if(indexPath.section==1){
        _model=_arrayMoth[indexPath.row];
    }
    UIImageView *_imageView =[[UIImageView alloc]initWithFrame:CGRectMake(10, 11, 104.7, 59.7)];
    _imageView.backgroundColor=[UIColor redColor];
    [cell.contentView addSubview:_imageView];
    
    UILabel *nameLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_imageView.frame)+15, 13, self.frame.size.width-139, 20)];
    nameLabel.text=_model.playHistoryTitle;
    nameLabel.textColor=[UIColor blackColor];
    nameLabel.font=[UIFont systemFontOfSize:14];
    [cell.contentView addSubview:nameLabel];
    
    UIImageView *phoneImageVIew=[[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(_imageView.frame)+15, 47, 10, 19.1)];
    phoneImageVIew.backgroundColor=[UIColor yellowColor];
    [cell.contentView addSubview:phoneImageVIew];
    
    
    UILabel *timeLabel =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(phoneImageVIew.frame)+10,50.5, self.frame.size.width-139, 12)];
    timeLabel.text=_model.playHistoryTime;
    timeLabel.textColor=[UIColor blackColor];
    timeLabel.font=[UIFont systemFontOfSize:12];
    [cell.contentView addSubview:timeLabel];
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
