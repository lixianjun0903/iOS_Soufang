//
//  ZXAccountTool.m
//  致学干部课堂
//
//  Created by zhixue on 15/5/19.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXAccountTool.h"

#define kAccountPath [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"account.archive"]

@implementation ZXAccountTool
+ (void)saveAccount:(ZXAccount *)account
{
    [NSKeyedArchiver archiveRootObject:account toFile:kAccountPath];
}
+ (ZXAccount *)account
{
    ZXAccount *account = [NSKeyedUnarchiver unarchiveObjectWithFile:kAccountPath];
    if ([account.name isEqualToString:@""] || [account.password isEqualToString:@""])
    {
        return nil;
    }
    return account;
}
@end
