//
//  RNAppMacro.h
//  PasswordBook
//
//  Created by Rany on 16/9/1.
//  Copyright © 2016年 Rany. All rights reserved.
//

#ifndef RNAppMacro_h
#define RNAppMacro_h


#endif /* RNAppMacro_h */

#import "UIView+DDAddition.h"
#import "UIColor+HRExtension.h"

#ifndef __OPTIMIZE__
# define NSLog(...) NSLog(__VA_ARGS__)
#else
# define NSLog(...) {}
#endif


#ifdef  DEBUG
#define debugLog(...)    NSLog(__VA_ARGS__)
#define debugMethod()    NSLog(@"%s", __func__)
#define debugError()     NSLog(@"Error at %s Line:%d", __func__, __LINE__)
#else
#define debugLog(...)
#define debugMethod()
#define debugError()
#endif

#define RNLog(x)    NSLog(@#x)

//G－C－D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)

#define kWindow [UIApplication sharedApplication].keyWindow

#define objectOrNull(obj) ((obj) ? (obj) : [NSNull null])
#define objectOrEmptyStr(obj) ((obj) ? (obj) : @"")

#define isNull(x)             (!x || [x isKindOfClass:[NSNull class]])
#define toInt(x)              (isNull(x) ? 0 : [x intValue])
#define isEmptyString(x)      (isNull(x) || [x isEqual:@""] || [x isEqual:@"(null)"])

#define sleep(s);             [NSThread sleepForTimeInterval:s];
#define Syn(x)                @synthesize x = _##x

#define RGBA(r,g,b,a)         [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:a]
#define RGB(r,g,b)            [UIColor colorWithRed:r/255.0 green:g/255.0 blue:b/255.0 alpha:1.0]
#define BoldSystemFont(size)  [UIFont boldSystemFontOfSize:size]
#define systemFont(size)      [UIFont systemFontOfSize:size]
#define beginAutoPool         NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init]; {
#define endAutoPool           } [pool release];
#define skipspace(c)          while (isspace(*c)) ++c
#define skipUntil(c,x)        while (x != *c) ++c
#define TheWindowHeight      ([UIDevice isAfterOS7] ? [UIScreen mainScreen].bounds.size.height : ([UIScreen mainScreen].bounds.size.height - 20))
#define IntToNumber(int)      ([NSNumber numberWithInt:int])
#define isIOS7 [[UIDevice currentDevice].systemVersion doubleValue]>=7.0?YES:NO
#define SYSTEM_VERSION        [[[UIDevice currentDevice] systemVersion] floatValue]
#define STATUSBAR_HEIGHT      [[UIApplication sharedApplication] statusBarFrame].size.height
#define NAVBAR_HEIGHT         (44.f + ((SYSTEM_VERSION >= 7) ? STATUSBAR_HEIGHT : 0))
#define FULL_WIDTH            SCREEN_WIDTH
#define FULL_HEIGHT           (SCREEN_HEIGHT - ((SYSTEM_VERSION >= 7) ? 0 : STATUSBAR_HEIGHT))
#define CONTENT_HEIGHT        (FULL_HEIGHT - NAVBAR_HEIGHT)
#define isBelowIOS9           [[UIDevice currentDevice].systemVersion doubleValue]<9.0?YES:NO

#define FileManager     ([NSFileManager defaultManager])
#define TheUserDefaults ([NSUserDefaults standardUserDefaults])
#define PhotosMessageDir ([[NSString documentPath] stringByAppendingPathComponent:@"/PhotosMessageDir/"])
#define VoiceMessageDir ([[NSString documentPath] stringByAppendingPathComponent:@"/VoiceMessageDir/"])
#define BlacklistDir    ([[NSString documentPath] stringByAppendingPathComponent:@"/BlacklistDir/"])
#define WS(self)    __weak __typeof(&*self)weakSelf = self;
#define RNWeakSelf(type)  __weak typeof(type) weak##type = type;
#define SCREEN_WIDTH  ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define IPHONE4 ([[UIScreen mainScreen] bounds].size.height == 480)
#define IS_AboveIOS7   [[[UIDevice currentDevice] systemVersion] floatValue]>=7.0?YES:NO
#define kSystemVersion [[UIDevice currentDevice]systemVersion].floatValue
