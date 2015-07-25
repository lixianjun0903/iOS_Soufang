//
//  ZXAccountTool.h
//  致学干部课堂
//
//  Created by zhixue on 15/5/19.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ZXAccount.h"

@interface ZXAccountTool : NSObject
+ (void)saveAccount:(ZXAccount *)account;
+ (ZXAccount *)account;
@end
