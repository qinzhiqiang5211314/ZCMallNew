//
//  MKShareLocationController.m
//  MK
//
//  Created by 李和平 on 16/6/24.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCShareLocationController.h"
#import "ZCLocationServerTool.h"
#import <BaiduMapAPI_Map/BMKMapComponent.h>
//#import "MKAlertView.h"

#import <BaiduMapAPI_Search/BMKSearchComponent.h>



@interface ZCShareLocationController ()<BMKMapViewDelegate,ZCLocationServerDelegate, BMKGeoCodeSearchDelegate>
{
    BMKMapView*                     mView;
    
    NSString*                       mLongitude;//自己的位置
    NSString*                       mLatitue;
    
    NSString*                       mSendLongitude;//
    NSString*                       mSendLatitue;//要发送的位置或者是打开的位置
    BMKPointAnnotation*             mAnnotation;// 大头针
    UILabel *                       mLoactionLabel;
}

@end

@implementation ZCShareLocationController
@synthesize currentLocationBlock;

/**
 *  初始化参数
 *
 *  @param _longitude 参数经度
 *  @param _latitue   参数纬度
 */
-(void) initParam:(NSString*)_longitude Latitue:(NSString*)_latitue
{
    mLongitude = _longitude;
    mLatitue = _latitue;
}


-(BMKMapView*)MView
{
    if (mView==nil) {
        mView = [[BMKMapView alloc] initWithFrame:CGRectMake(0, APP_NaviH, APPSIZE.width, APPSIZE.height-APP_NaviH)];
//        mView.showsUserLocation = YES;
        [mView setMapType:BMKMapTypeStandard];
        mView.zoomLevel = 13;
    }
    
    return mView;
}

-(BMKPointAnnotation *)mAnnotation{
    if (!mAnnotation) {
        mAnnotation = [[BMKPointAnnotation alloc]init];

    }
    return mAnnotation;
}

-(UILabel *)mLoactionLabel{
    if (!mLoactionLabel) {
        mLoactionLabel = [[ UILabel alloc] initWithFrame:CGRectMake(0, APPHEIGHT - 100, APPWIDTH, 40)];
        mLoactionLabel.backgroundColor = [UIColor whiteColor];
    }
    return mLoactionLabel;
}


- (void)addLocationInfoLabel{
    
}


-(void) loadHeaderBar
{
    //
    [self.mNavgationBar setMTitleStr:@"位置信息"];
    [self.mNavgationBar setMRightBtn:nil];
    if (self.currentLocationBlock) {
        [self.mNavgationBar setMRightBtn:[[ZCNaviBarTool tools] createNavBtnByTitle:@"确定" target:self action:@selector(rightBtnClick:)]];
    }
}


-(void)rightBtnClick:(id)_sender
{
    //
    if (self.currentLocationBlock) {
        self.currentLocationBlock(mLongitude,mLatitue);
    }
    [self gotoSuperController];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (mLongitude==nil) {
        mLongitude = @"-1";
        mLatitue = @"-1";
    }
    
    

    // Do any additional setup after loading the view.
    
    /**
     *  加载导航栏
     *
     *  @return nil
     */
    [self loadHeaderBar];
    
    
    /**
     *  添加view
     *
     *  @return nil
     */
    [self.view addSubview:[self MView]];
    
    
    //获取经纬度
    [ZCLocationServerTool locationServer].mDelegate = self;
    
    
    //设置初始位置
    

    [self startFollowing];
    [[self MView] addSubview:[self mLoactionLabel]];
    
    
    //初始化大头针位置
    if ((!mAnnotation)&&self.mPinFixed) {
        //初始化位置
        CLLocationCoordinate2D _loc2d;
        _loc2d.latitude = [mLatitue floatValue];
        _loc2d.longitude = [mLongitude floatValue];
        [self addAnnotationWithLocation:_loc2d];
        [self jiemaWithLocation:_loc2d];
        
    }

}





//罗盘态
-(void)startFollowHeading
{
    NSLog(@"进入罗盘态");
    
    [self MView].showsUserLocation = NO;
    [self MView].userTrackingMode = BMKUserTrackingModeFollowWithHeading;
    [self MView].showsUserLocation = YES;
    
}
//跟随态
-(void)startFollowing
{
    NSLog(@"进入跟随态");
    
    
//    [self MView].showsUserLocation = NO;
    [self MView].userTrackingMode = BMKUserTrackingModeFollow;
    [self MView].showsUserLocation = YES;
    
}


-(void) startLocation
{
//    [self MView].showsUserLocation = NO;//先关闭显示的定位图层
    [self MView].userTrackingMode = BMKUserTrackingModeNone;//设置定位的状态
    [self MView].showsUserLocation = YES;//显示定位图层

}

-(void) stopLocation
{
    [self MView].showsUserLocation = NO;
}

-(void)viewWillAppear:(BOOL)animated {
    [[self MView] viewWillAppear];
    [self MView].delegate = self; // 此处记得不用的时候需要置nil，否则影响内存的释放
}

-(void)viewWillDisappear:(BOOL)animated {
    [[self MView] viewWillDisappear];
    [self MView].delegate = nil; // 不用时，置nil
   
}

#pragma mark----------------------------------MKLocationServerDelegate----------------------------------

/**
 *在地图View将要启动定位时，会调用此函数
 *@param mapView 地图View
 */
- (void)willStartLocatingUser
{
    NSLog(@"start locate");
}

/**
 *用户方向更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateUserHeading:(BMKUserLocation *)userLocation
{
    [[self MView] updateLocationData:userLocation];
    if ((!mAnnotation)&&!self.mPinFixed){
        
        mLongitude =[NSString stringWithFormat:@"%f",userLocation.location.coordinate.longitude];
        mLatitue =[NSString stringWithFormat:@"%f",userLocation.location.coordinate.latitude];
        [self addAnnotationWithLocation:userLocation.location.coordinate];
        [self jiemaWithLocation:userLocation.location.coordinate];
    }else
    {
        if ((!mAnnotation)&&self.mPinFixed) {
            //初始化位置
            CLLocationCoordinate2D _loc2d;
            _loc2d.latitude = [mLatitue floatValue];
            _loc2d.longitude = [mLongitude floatValue];
            [self addAnnotationWithLocation:_loc2d];
            [self jiemaWithLocation:_loc2d];

        }
    }
    
   // NSLog(@"heading is %@",userLocation.heading);
}

/**
 *用户位置更新后，会调用此函数
 *@param userLocation 新的用户位置
 */
- (void)didUpdateBMKUserLocation:(BMKUserLocation *)userLocation
{
    //    NSLog(@"didUpdateUserLocation lat %f,long %f",userLocation.location.coordinate.latitude,userLocation.location.coordinate.longitude);
    [[self MView] updateLocationData:userLocation];
    
//    if (!mAnnotation) {
//        [self addAnnotationWithLocation:userLocation.location.coordinate];
//    }
}

/**
 *在地图View停止定位后，会调用此函数
 *@param mapView 地图View
 */
- (void)didStopLocatingUser
{
    NSLog(@"stop locate");
}

/**
 *定位失败后，会调用此函数
 *@param mapView 地图View
 *@param error 错误号，参考CLError.h中定义的错误号
 */
- (void)didFailToLocateUserWithError:(NSError *)error
{
    NSLog(@"location error");
}


- (void)dealloc {
    if ([self MView]) {
        mView = nil;
        
        [ZCLocationServerTool locationServer].mDelegate= nil;
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/**
 *  @author MCMac
 *
 *  添加大头针
 */
-(void)addAnnotationWithLocation:(CLLocationCoordinate2D )userLocation{
    
    [self mAnnotation].coordinate = userLocation;
    [mView addAnnotation:mAnnotation];
}

/**
 *选中指定的标注，本版暂不支持animate效果
 *@param annotation 指定的标注
 *@param animated 本版暂不支持
 */
- (void)selectAnnotation:(id <BMKAnnotation>)annotation animated:(BOOL)animated{
    
}


- (BMKAnnotationView *)mapView:(BMKMapView *)mapView viewForAnnotation:(id <BMKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[BMKPointAnnotation class]]) {
        BMKPinAnnotationView *newAnnotationView = [[BMKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"myAnnotation"];
        newAnnotationView.pinColor = BMKPinAnnotationColorPurple;
        newAnnotationView.animatesDrop = YES;// 设置该标注点动画显示
        return newAnnotationView;
    }
    return nil;
}


- (void)mapView:(BMKMapView *)mapView onClickedMapBlank:(CLLocationCoordinate2D)coordinate{
    
    if (self.mPinFixed) {
        return;
    }
    if (mAnnotation) {
        [[self MView] removeAnnotation:[self mAnnotation]];
    }
    [self addAnnotationWithLocation:coordinate];
    [self jiemaWithLocation:coordinate];
    
}

-(void)jiemaWithLocation:(CLLocationCoordinate2D)coordinate{
    
   BMKGeoCodeSearch * _searcher =[[BMKGeoCodeSearch alloc]init];
    _searcher.delegate = self;
    
    BMKReverseGeoCodeOption *reverseGeocodeSearchOption = [[BMKReverseGeoCodeOption alloc]init];
    reverseGeocodeSearchOption.reverseGeoPoint = coordinate;
     BOOL flag = [_searcher reverseGeoCode:reverseGeocodeSearchOption];
    if(flag)
    {
      NSLog(@"反geo检索发送成功");
    }
    else
    {
      NSLog(@"反geo检索发送失败");
    }
}


/**
 *返回地址信息搜索结果
 *@param searcher 搜索对象
 *@param result 搜索结BMKGeoCodeSearch果
 *@param error 错误号，@see BMKSearchErrorCode
 */
- (void)onGetGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
    
}

/**
 *返回反地理编码搜索结果
 *@param searcher 搜索对象
 *@param result 搜索结果
 *@param error 错误号，@see BMKSearchErrorCode
 */
- (void)onGetReverseGeoCodeResult:(BMKGeoCodeSearch *)searcher result:(BMKReverseGeoCodeResult *)result errorCode:(BMKSearchErrorCode)error{
    [self mLoactionLabel].text = result.address;
}



@end
