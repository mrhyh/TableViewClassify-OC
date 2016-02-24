//
//  LeftTableViewCell.m
//  BRMultilevelMeun
//
//  Created by ylgwhyh on 16/2/24.
//  Copyright © 2016年 BR. All rights reserved.
//

#import "LeftTableViewCell.h"
#import "Common.h"

@implementation LeftTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    
    static NSString *ID = @"LeftTableViewCell";
    LeftTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        // 从xib中加载cell
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LeftTableViewCell" owner:nil options:nil] lastObject];
    }
    return cell;  
}

- (void)setZero{
    if ([self respondsToSelector:@selector(setLayoutMargins:)]) {
        self.layoutMargins=UIEdgeInsetsZero;
    }
    if ([self respondsToSelector:@selector(setSeparatorInset:)]) {
        self.separatorInset=UIEdgeInsetsZero;
    }
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setSelectView:(UIView *)selectView{
    _selectView = selectView;
}

- (void)setTitleLabel:(UILabel *)titleLabel{
    _titleLabel = titleLabel;
}
@end
