//
//  YJChatTableViewCell.h
//  友家
//
//  Created by 111111 on 15-5-30.
//  Copyright (c) 2015年 lixinjun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface YJChatTableViewCell : UITableViewCell
+(YJChatTableViewCell*)mychatCell;
-(void)setContentWithTitle:(NSString*)title andImage:(NSString*)image;
@end
