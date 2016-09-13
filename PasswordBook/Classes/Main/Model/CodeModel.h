//
//  CodeModel.h
//  PasswordBook
//
//  Created by Rany on 16/9/12.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CodeModel : NSObject

@property (nonatomic ,copy) NSString *codeString;

@property (nonatomic ,copy) NSString *title;

@property (nonatomic ,copy) NSString *accountString;

+ (NSArray *)configObjectWithArray:(NSArray *)array;
@end
