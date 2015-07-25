//
//  ZXAccount.m
//  致学干部课堂
//
//  Created by zhixue on 15/5/19.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import "ZXAccount.h"

@implementation ZXAccount
+ (instancetype)accountWithDict:(NSDictionary *)dict
{
    ZXAccount *account = [[self alloc] init];
    account.password = dict[@"password"];
    account.name = dict[@"name"];
    return account;
}

- (void)encodeWithCoder:(NSCoder *)encoder
{
    [encoder encodeObject:self.password forKey:@"password"];
    [encoder encodeObject:self.name forKey:@"name"];
}
- (id)initWithCoder:(NSCoder *)decoder
{
    if (self = [super init])
    {
        self.password = [decoder decodeObjectForKey:@"password"];
        self.name = [decoder decodeObjectForKey:@"name"];
    }
    return self;
}

@end
