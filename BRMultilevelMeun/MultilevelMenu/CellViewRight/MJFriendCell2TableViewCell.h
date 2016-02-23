//
//  MJFriendCell2TableViewCell.h
//  03-QQ好友列表
//
//  Created by ylgwhyh on 16/2/22.
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MJFriend.h"

@interface MJFriendCell2TableViewCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

// friend是C++的关键字,不能用friend作为属性名
@property (nonatomic, strong) MJFriend *friendData;

@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
@property (strong, nonatomic) IBOutlet UIButton *indicatorBtn;


- (IBAction)indicatorBtn:(UIButton *)sender;
@end
