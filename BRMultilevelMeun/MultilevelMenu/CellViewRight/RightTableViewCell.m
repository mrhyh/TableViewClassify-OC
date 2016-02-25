//
//  MJFriendCell2TableViewCell.m
//  03-QQ好友列表
//
//  Created by ylgwhyh on 16/2/22.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import "RightTableViewCell.h"

@implementation RightTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"friend";
    RightTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"RightTableViewCell" owner:nil options:nil] lastObject];
    }
    
    return cell;
}

- (void)setFriendData:(MJFriend *)friendData{
    
    _friendData = friendData;
    
    _nameLabel.text = friendData.name;
//    _nameLabel.textColor = friendData.isVip ? [UIColor redColor] : [UIColor blackColor];
}

- (void)setNameLabel:(UILabel *)nameLabel{
    _nameLabel = nameLabel;
}

- (IBAction)indicatorBtn:(UIButton *)sender {
    NSLog(@"indicatorBtn...%ld",(long)sender.tag);
    sender.selected = !sender.selected;
}
@end
