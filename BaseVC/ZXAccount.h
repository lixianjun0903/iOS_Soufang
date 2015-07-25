//
//  ZXAccount.h
//  致学干部课堂
//
//  Created by zhixue on 15/5/19.
//  Copyright (c) 2015年 ZQZX. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZXAccount : NSObject <NSCoding>
/** 用户的昵称 */
@property (nonatomic, copy) NSString *name;
/**	用户密码 */
@property (nonatomic, strong) NSString *password;
+ (instancetype)accountWithDict:(NSDictionary *)dict;
@end
