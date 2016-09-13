//
//  HRPlaySound.m
//  SmartCommunity
//
//  Created by Harvey Huang on 15/10/26.
//  Copyright (c) 2015年 Horizontal. All rights reserved.
//

#import "HRPlaySound.h"

@implementation HRPlaySound

- (instancetype)initSystemShake
{
    self = [super init];
    if (self) {
        sound = kSystemSoundID_Vibrate;//震动
    }
    return self;
}

- (instancetype)initSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType
{
    self = [super init];
    if (self) {
        
        NSString *path = [NSString stringWithFormat:@"/System/Library/Audio/UISounds/%@.%@",soundName,soundType];
        
//[[NSBundle bundleWithIdentifier:@"com.apple.UIKit" ]pathForResource:soundName ofType:soundType];//得到苹果框架资源UIKit.framework ，从中取出所要播放的系统声音的路径
        
        //获取自定义的声音
//        NSString *path = [[NSBundle mainBundle]pathForResource:soundName
//                                                        ofType:soundType
//                                                   inDirectory:@"/"];
        
        if (path) {
            OSStatus error = AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath:path],&sound);
            
            //获取的声音的时候，出现错误
            if (error != kAudioServicesNoError) {
                sound = 0;
            }
        }
    }
    return self;
}

- (void)play
{
    AudioServicesPlaySystemSound(sound);
}

@end
