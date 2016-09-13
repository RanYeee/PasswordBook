
//
//  CodeModel.m
//  PasswordBook
//
//  Created by Rany on 16/9/12.
//  Copyright © 2016年 Rany. All rights reserved.
//

#import "CodeModel.h"

@implementation CodeModel

+ (NSArray *)configObjectWithArray:(NSArray *)array
{
    
    if (array) {
        
        NSMutableArray *mutableArray = [NSMutableArray array];
        
        for (BmobObject *obj in array) {
            
            CodeModel *model = [[CodeModel alloc]init];
            
            model.title = [obj objectForKey:@"title"];
            
            model.codeString = [obj objectForKey:@"codeString"];
            
            model.accountString = [obj objectForKey:@"accountString"];
            
            [mutableArray addObject:model];
            
        }
        
        return mutableArray;
        
    }else{
        
        return nil;
    }
    
}

@end
