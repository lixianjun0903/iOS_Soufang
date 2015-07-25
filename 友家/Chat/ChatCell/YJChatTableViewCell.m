//
//  YJChatTableViewCell.m
//  友家
//
//  Created by 111111 on 15-5-30.
//  Copyright (c) 2015年 lixinjun. All rights reserved.
//

#import "YJChatTableViewCell.h"

@interface YJChatTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *logoImage;

@end
@implementation YJChatTableViewCell
-(void)setContentWithTitle:(NSString*)title andImage:(NSString*)image
{

    self.logoImage.layer.cornerRadius = 25;
    self.logoImage.layer.masksToBounds = YES;
    
}
+(YJChatTableViewCell*)mychatCell
{
    return [[[NSBundle mainBundle] loadNibNamed:@"YJChatTableViewCell" owner:self options:nil] lastObject];

}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
