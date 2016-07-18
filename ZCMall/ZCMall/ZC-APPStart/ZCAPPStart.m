//
//  MKAPPStart.m
//  MK
//
//  Created by 李和平 on 16/6/27.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCAPPStart.h"


@interface ZCAPPStart()
{
    
}


@end

@implementation ZCAPPStart


/**
 *  app启动 并检测版本
 */
-(void) appDetected
{
    
//    __weak typeof(self) _weakself = self;
//    
//    //NSInteger tag = 10029;
//    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    [dic setObject:@"3" forKey:@"devType"];
//    MKAPICommon* _lg = [[MKAPICommon alloc] init];
//    
//    [_lg postRequest:@"10029" WithParam:dic Succed:^(id arg){
//        
//        [_weakself detectionOfUpdateWithDic:arg[@"clientVersion"]];
//        
//        if (_weakself.mDBDetect) {
//            [_weakself.mDBDetect dbDetect:arg[@"appDbVersion"]];
//        }
//        
//        
//        //启动页 赛事页
//        id _Dic = arg[@"startDiagramVersionMatch"];
//        NSMutableDictionary* _rdic = [[NSMutableDictionary alloc] init];
//        if (_Dic!=nil) {
//            
//            if ([_Dic isKindOfClass:[NSDictionary class]]) {
//                NSMutableArray* _array = [_Dic objectForKey:@"startDiagramList"];
//                if ([_array isKindOfClass:[NSMutableArray class]]) {
//                    NSInteger _count = [_array count];
//                    for (NSInteger i=0; i<_count; i++) {
//                        NSDictionary* _sdic = [_array objectAtIndex:i];
//                        NSNumber* _type = [_sdic objectForKey:@"specType"];
//                        NSString* _url = [_sdic objectForKey:@"clientPicUrl"];
//                        
//                        [_rdic setObject:_url forKey:[_type stringValue]];
//                    }
//                }
//                
//            }
//        }
//        
//        if (_rdic.count>0) {
//            
//            [[[MKMatchPageFactory shareDefault] matchPage] updateMatchImage:_rdic];
//           
//        }
//        
//        
//        /**
//         *  @author Mrrck
//         *
//         *  归档赛事广告信息
//         */
//        NSString *filename = [[[[MKCacheTool caches] fileCache] cachePath] stringByAppendingPathComponent:@"matchWelcomePageInfo.archive"];
//        NSMutableData *theData=[NSMutableData data];
//        NSKeyedArchiver *archiver=[[NSKeyedArchiver alloc]initForWritingWithMutableData:theData];
//        [archiver encodeObject:arg  forKey:@"MATCH_Welcome_Pages_Of_Information"];
//        [archiver finishEncoding];
//        [theData writeToFile:filename atomically:YES];
//        
//    } Error:^(NSString * _er) {
//        
//        if (_weakself.mDBDetect) {
//            [_weakself.mDBDetect dbDetect:nil];
//        }
//    }];
    

}

////检测更新 app版本
-(void)detectionOfUpdateWithDic:(NSDictionary *)dic{
    //    NSLog(@"%@",dic);
    int fource = [[dic valueForKey:@"forceUpdate"] intValue];
    if (fource == 0) {
        NSString *urlVerson = [dic  valueForKey:@"version"];
        NSString *version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *)kCFBundleVersionKey];
        
        if (![urlVerson isEqualToString:version]) {
            
//            JKAlertDialog *alertVieww = [[JKAlertDialog alloc]initWithTitle:@"新版本提示" message:[dic  valueForKey:@"remark"] andMessageAligment:NSTextAlignmentLeft mkDelegate:self cancelButtonWithTitle:@"稍后更新" otherButton:@[@"马上更新"] alertType:OrdinaryType];
//            [alertVieww show];
//            
//            self.versonDictionary = [dic  valueForKey:@"url"];
        }
    }
}
@end
