//
//  MKDeviceTool.m
//  MK
//
//  Created by hgh on 16/6/20.
//  Copyright © 2016年 MCMac. All rights reserved.
//

#import "ZCDeviceTool.h"
#import <Security/Security.h>


@implementation ZCDeviceTool

//判断设备是否为iPad
+(BOOL)isiPad
{
    return (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad);
}

//是否为高清
+(BOOL)isRetina
{
    return ([UIScreen mainScreen].scale > 1.0);
}

+(BOOL)isiPhone5 {
    //判断是否为iPhone5
    return   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 1136), [[UIScreen mainScreen] currentMode].size) : NO);
}

+(BOOL)isiPhone4 {
    //判断是否为iPhone4/s
    return   ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640, 960), [[UIScreen mainScreen] currentMode].size) : NO);
}

+(BOOL)isiOS7OrLater {
    return [[[UIDevice currentDevice] systemVersion] floatValue] >= 7;
}
//获取当前设备的model
+(NSString *)deviceModel
{
    UIDevice *device=[UIDevice currentDevice];
    return device.model;
}

/**
 *  @author 李诚, 15-05-06 17:05:29
 *
 *  TODO:获取当前设备的名称 更新到IPhone 6P 和 IPad4
 *
 *  @return
 */
+ (NSString *)deviceName {
    int mib[2];
    size_t len;
    char *machine;
    
    mib[0] = CTL_HW;
    mib[1] = HW_MACHINE;
    sysctl(mib, 2, NULL, &len, NULL, 0);
    machine = malloc(len);
    sysctl(mib, 2, machine, &len, NULL, 0);
    
    NSString *platform = [NSString stringWithCString:machine encoding:NSASCIIStringEncoding];
    free(machine);
    
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 2G";
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4S";
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5c";
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5s";
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPod1,1"])   return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])   return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])   return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])   return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPod5,1"])   return @"iPod Touch 5G";
    
    if ([platform isEqualToString:@"iPad1,1"])   return @"iPad 1G";
    
    if ([platform isEqualToString:@"iPad2,1"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,2"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,3"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,4"])   return @"iPad 2";
    if ([platform isEqualToString:@"iPad2,5"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,6"])   return @"iPad Mini 1G";
    if ([platform isEqualToString:@"iPad2,7"])   return @"iPad Mini 1G";
    
    if ([platform isEqualToString:@"iPad3,1"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,2"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,3"])   return @"iPad 3";
    if ([platform isEqualToString:@"iPad3,4"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,5"])   return @"iPad 4";
    if ([platform isEqualToString:@"iPad3,6"])   return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,2"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,3"])   return @"iPad Air";
    if ([platform isEqualToString:@"iPad4,4"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,5"])   return @"iPad Mini 2G";
    if ([platform isEqualToString:@"iPad4,6"])   return @"iPad Mini 2G";
    
    if ([platform isEqualToString:@"i386"])      return @"iPhone Simulator";
    if ([platform isEqualToString:@"x86_64"])    return @"iPhone Simulator";
    
    return platform;
}

+(NSString *)systemVersion
{
    UIDevice *device=[UIDevice currentDevice];
    return device.systemVersion;
}

+(NSString *)appVersion
{
    //NSString* version = [[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString*)kCFBundleVersionKey];
    NSString *majorVersion = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    return majorVersion;
}

//判断相机是否可用(前置)
+ (BOOL)isFontCameraAvailable
{
    return [UIImagePickerController isCameraDeviceAvailable: UIImagePickerControllerCameraDeviceFront];
}

//判断相机是否可用(后置)
+ (BOOL)isRearCameraAvailable
{
    return [UIImagePickerController isCameraDeviceAvailable: UIImagePickerControllerCameraDeviceRear];
}

//获取区域标志符（非语言标志）
+(NSString *)localeIdentifier
{
    NSLocale *frLocale = [NSLocale autoupdatingCurrentLocale];
    return frLocale.localeIdentifier;
}


+ (NSString *)createNewUUID {
    
    CFUUIDRef theUUID = CFUUIDCreate(NULL);
    CFStringRef string = CFUUIDCreateString(NULL, theUUID);
    
    CFRelease(theUUID);
    
    return (__bridge NSString *)string;
    
}
//获取设备标志符  ios 5.0 后弃用
+(NSString *)deviceIdentifier{
    
//    UIDevice *myDevice=[UIDevice currentDevice];
//    NSString *v = [[UIDevice currentDevice] systemVersion];
//    if([v compare:@"6.0" options:NSNumericSearch] != NSOrderedAscending)
//    {
//        return [myDevice.identifierForVendor UUIDString];
//    }
//    
//    else
//    {
//        // getting the unique key (if present ) from keychain , assuming "your app identifier" as a key
//        NSString *retrieveuuid = [SSKeychain passwordForService:@"com.tesrio.imarry2" account:@"user"];
//        if (retrieveuuid == nil)
//        {
//            // if this is the first time app lunching , create key for device
//            retrieveuuid  = [self createNewUUID];
//            // save newly created key to Keychain
//            [SSKeychain setPassword:retrieveuuid forService:@"com.tesrio.imarry2" account:@"user"];
//            // this is the one time process
//            
//        }
//        return retrieveuuid;
//    }
    
    return @"";
    
}


//电池量
+ (float)batteryLevel
{
    return [[UIDevice currentDevice] batteryLevel];
}


#pragma mark -
+ (float) sysInfo: (uint) typeSpecifier
{
    
    size_t size = sizeof(int);
    
    int results;
    
    int mib[2] = {CTL_HW, typeSpecifier};
    
    sysctl(mib, 2, &results, &size, NULL, 0);
    
    return (NSUInteger) results * 1.0;
    
}


//cpu是用频率
+ (float) cpuFrequency
{
    
    return [self sysInfo:HW_CPU_FREQ] * 1.0;
    
}

+ (float) busFrequency
{
    
    return [self sysInfo:HW_BUS_FREQ] * 1.0;
    
}

//总内存
+ (float) totalMemory
{
    
    return [self sysInfo:HW_PHYSMEM] * 1.0;
    
    //or
    //return NSRealMemoryAvailable() * 1.0;
    
}

//用户可使用内存 ？？
+ (float) userMemory
{
    
    return [self sysInfo:HW_USERMEM] * 1.0;
    
}

+ (float) maxSocketBufferSize
{
    
    return [self sysInfo:KIPC_MAXSOCKBUF] * 1.0;
    
}

#pragma mark file system —
#pragma mark file system — ios自带方法 推荐使用

//总磁盘空间
+ (float) totalDiskSpace
{
    
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    
    return [[fattributes objectForKey:NSFileSystemSize] floatValue];
    
}

//剩余磁盘空间
+ (float) freeDiskSpace
{
    
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    
    return [[fattributes objectForKey:NSFileSystemFreeSize] floatValue];
    
}

//磁盘号
+(NSNumber *)diskNumber
{
    NSDictionary *fattributes = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:nil];
    
    return [fattributes objectForKey:NSFileSystemNumber];
}


#pragma mark file system — c方法

/*
 ..........................目录文件大小..........................
 */

//目录下所有文件大小
+(float)sizeOfDirectory:(NSString *)dir
{
    /*
     NSString* docDir = [NSString stringWithFormat:@"%@/%@", NSHomeDirectory(),dir];
     NSDirectoryEnumerator *direnum = [[NSFileManager defaultManager] enumeratorAtPath:docDir];
     */
    
    NSDirectoryEnumerator *direnum = [[NSFileManager defaultManager] enumeratorAtPath:dir];
    
    NSString *pname;
    int64_t s=0;
    while (pname = [direnum nextObject])
    {
        //TTDINFO(@"pname   %@",pname);
        NSDictionary *currentdict=[direnum fileAttributes];
        NSString *filesize=[NSString stringWithFormat:@"%@",[currentdict objectForKey:NSFileSize]];
        NSString *filetype=[currentdict objectForKey:NSFileType];
        
        if([filetype isEqualToString:NSFileTypeDirectory]) continue;
        s=s+[filesize longLongValue];
    }
    
    return s*1.0;
}


/*
 ..........................转化显示..........................
 */

//将大小转化为格式,B,L,M,G之间的转换
+ (NSString *)convertFloatSizeToString:(float)size
{
    if(size < 1024L * 1024L) {
        return [NSString stringWithFormat:@"%1.2fK", (float)size / 1024.0];
    } else if(size < 1024L * 1024L * 1024L) {
        return [NSString stringWithFormat:@"%1.2fM", (float)size / 1024.0 / 1024.0];
    } else {
        return [NSString stringWithFormat:@"%1.2fG", (float)size / 1024.0 / 1024.0 / 1024.0];
    }
    /*
     if(size < 1024L) {
     return [NSString stringWithFormat:@"%ldB", size];
     } else if(size < 1024L * 1024L) {
     return [NSString stringWithFormat:@"%1.2fK", (float)size / 1024.0];
     } else if(size < 1024L * 1024L * 1024L) {
     return [NSString stringWithFormat:@"%1.2fM", (float)size / 1024.0 / 1024.0];
     } else {
     return [NSString stringWithFormat:@"%1.2fG", (float)size / 1024.0 / 1024.0 / 1024.0];
     }
     */
}


/*
 ..........................磁盘..........................
 */

//剩余磁盘空间
+(float)getFreeDiskSpace
{
    
    NSString *str = @"~/Documents";
    
    int64_t size = 0;
    struct statfs disk_statfs;
    
    if(statfs([[str stringByExpandingTildeInPath] fileSystemRepresentation], &disk_statfs) == 0) {
        size=(int64_t)disk_statfs.f_bsize * (int64_t)disk_statfs.f_bavail;
    }
    
    return size*1.0;
}

//总磁盘空间
+(float)getTotalDiskSpace
{
    NSString *str = @"~/Documents";
    
    int64_t size = 0;
    struct statfs disk_statfs;
    
    if(statfs([[str stringByExpandingTildeInPath] fileSystemRepresentation], &disk_statfs) == 0) {
        size=(int64_t)disk_statfs.f_bsize * (int64_t)disk_statfs.f_blocks;
    }
    
    return size*1.0;
}


/*
 ..........................内存..........................
 */


+(float)freeMemory
{
    vm_statistics_data_t vmStats;
    
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    
    if(kernReturn == KERN_SUCCESS)
    {
        return vmStats.free_count * vm_page_size * 1.0;
    }
    
    return -1.0;
    
}


+(float)activeMemory
{
    vm_statistics_data_t vmStats;
    
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    
    if(kernReturn == KERN_SUCCESS)
    {
        return vmStats.active_count * vm_page_size * 1.0;
    }
    
    return -1.0;
    
}

+(float)inactiveMemory
{
    vm_statistics_data_t vmStats;
    
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    
    if(kernReturn == KERN_SUCCESS)
    {
        return vmStats.inactive_count * vm_page_size * 1.0;
    }
    
    return -1.0;
    
}


+(float)wireMemory
{
    vm_statistics_data_t vmStats;
    
    mach_msg_type_number_t infoCount = HOST_VM_INFO_COUNT;
    kern_return_t kernReturn = host_statistics(mach_host_self(), HOST_VM_INFO, (host_info_t)&vmStats, &infoCount);
    
    if(kernReturn == KERN_SUCCESS)
    {
        return vmStats.wire_count * vm_page_size * 1.0;
    }
    
    return -1.0;
    
}


@end
