//
//  MJFriendCell.m
//  03-QQ好友列表
//
//  Created by apple on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJFriendCell.h"
#import "MJFriend.h"

@implementation MJFriendCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *ID = @"friend";
    MJFriendCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[MJFriendCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    

    
    return cell;
}

- (void)setFriendData:(MJFriend *)friendData
{
    _friendData = friendData;
    
    self.imageView.image = [UIImage imageNamed:friendData.icon];
    self.textLabel.text = friendData.name;
    self.textLabel.textColor = friendData.isVip ? [UIColor redColor] : [UIColor blackColor];
    //self.detailTextLabel.text = friendData.intro;
}


@end
