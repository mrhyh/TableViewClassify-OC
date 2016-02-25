//
//  LeftTableViewCell.h
//  BRMultilevelMeun
//
//  Created by ylgwhyh on 16/2/24.
//  Copyright © 2016年 BR. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *selectView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;


+ (instancetype)cellWithTableView:(UITableView *)tableView;

-(void)setZero;

@end
