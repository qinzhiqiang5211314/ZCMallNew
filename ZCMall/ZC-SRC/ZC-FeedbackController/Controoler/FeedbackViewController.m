//
//  FeedbackViewController.m
//  ZhongChao
//
//  Created by 秦志强 on 16/7/12.
//  Copyright © 2016年 秦志强. All rights reserved.
//

#import "FeedbackViewController.h"

@interface FeedbackViewController ()
{
    UITextView *_textView;
    UILabel *label;
}
@end

@implementation FeedbackViewController

-(void)loadHeaderView{
    [self.mNavgationBar setMTitleStr:@"意见反馈"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadHeaderView];
    self.view.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:240.0/255.0 blue:239.0/255.0 alpha:1];
    self.automaticallyAdjustsScrollViewInsets = NO;
    UIView *topView =[[UIView alloc]initWithFrame:CGRectMake(0,84, self.view.frame.size.width, 141)];
    topView.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:topView];
    _textView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0,topView.frame.size.width, 92)];
    _textView.backgroundColor = [UIColor whiteColor];
    [topView addSubview:_textView];
    
    NSString *descStr =@"请携带您的宝贵意见和建议,我们将努力改进(不少于五个字)";
    UIFont *font = [UIFont systemFontOfSize:15];
    CGSize size = CGSizeMake(_textView.frame.size.width-20,200);
    CGRect labelRect = [descStr boundingRectWithSize:size options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)  attributes:[NSDictionary dictionaryWithObject:font forKey:NSFontAttributeName] context:nil];
    
    label = [[UILabel alloc]initWithFrame:CGRectMake(10, 5, _textView.frame.size.width-20, labelRect.size.height)];
//    label.backgroundColor=[UIColor redColor];
    label.text =descStr;
    label.numberOfLines =0;
    label.lineBreakMode = NSLineBreakByCharWrapping;
    label.textColor =[UIColor colorWithRed:0.8 green:0.8 blue:0.8 alpha:1];
    label.font = [UIFont systemFontOfSize:15];
    [topView addSubview:label];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(textChanged:) name:UITextViewTextDidChangeNotification object:nil];
    
    UILabel *hxLabel =[[UILabel alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(_textView.frame), topView.frame.size.width-20, 1)];
    hxLabel.backgroundColor=[UIColor colorWithRed:239.0/255.0 green:239.0/255.0 blue:239.0/255.0 alpha:1];
    [topView addSubview:hxLabel];
    
    UITextField *_textField =[[UITextField alloc]initWithFrame:CGRectMake(10, CGRectGetMaxY(hxLabel.frame) , self.view.frame.size.width-20, 46)];
    CGRect rect = _textField.frame;
    rect.size.height = 46;
    _textField.frame = rect;
    _textField.placeholder=@"请留下您的电话号码,以便我们回复您";
    _textField.backgroundColor=[UIColor whiteColor];
    [topView addSubview:_textField];
    
    
    UIButton *_nextButton =[[UIButton alloc]initWithFrame:CGRectMake(20, CGRectGetMaxY(topView.frame)+30, APPWIDTH-40, 45)];
    [_nextButton setTitle:@"提交" forState:UIControlStateNormal];
    [_nextButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _nextButton.titleLabel.font=[UIFont systemFontOfSize:15];
    _nextButton.backgroundColor=[UIColor colorWithRed:231.0/255.0 green:75.0/255.0 blue:128.0/255.0 alpha:1];
    _nextButton.layer.cornerRadius=8.0;
    [self.view addSubview:_nextButton];
    // Do any additional setup after loading the view.
}


- (void)textChanged:(NSNotification *)notification

{
    
    if(_textView.text.length == 0)
    {
        
        label.hidden=NO;
        
    }else{
        label.hidden = YES;
    }
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
