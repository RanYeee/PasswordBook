//
//  HRPlaySound.h
//  SmartCommunity
//
//  Created by Harvey Huang on 15/10/26.
//  Copyright (c) 2015年 Horizontal. All rights reserved.
//
//  播放系统铃声和震动

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>

@interface HRPlaySound : NSObject
{
   SystemSoundID sound;//系统声音的id 取值范围为：1000-2000
}

//系统 震动
- (instancetype)initSystemShake;

//初始化系统声音
- (instancetype)initSystemSoundWithName:(NSString *)soundName SoundType:(NSString *)soundType;

//播放
- (void)play;

@end
