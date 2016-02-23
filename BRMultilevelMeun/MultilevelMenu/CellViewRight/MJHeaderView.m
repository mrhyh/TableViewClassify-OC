//
//  MJHeaderView.m
//  03-QQ好友列表
//
//  Created by apple on 14-4-3.
//  Copyright (c) 2014年 itcast. All rights reserved.
//

#import "MJHeaderView.h"
#import "MJFriendGroup.h"

/**
 某个控件出不来:
 1.frame的尺寸和位置对不对
 
 2.hidden是否为YES
 
 3.有没有添加到父控件中
 
 4.alpha 是否 < 0.01
 
 5.被其他控件挡住了
 
 6.父控件的前面5个情况
 */

@interface MJHeaderView()

@property (nonatomic, weak) UILabel *countView;
@property (nonatomic, weak) UIButton *nameView;

@end

@implementation MJHeaderView

+ (instancetype)headerViewWithTableView:(UITableView *)tableView identifierWithString:(NSString *)identifier
{
    //static NSString *ID = @"header";
    NSString *ID = identifier;
    MJHeaderView *header = [tableView dequeueReusableHeaderFooterViewWithIdentifier:ID];
    if (header == nil) {
        header = [[MJHeaderView alloc] initWithReuseIdentifier:ID];
    }
    return header;
}

/**
 *  在这个初始化方法中,MJHeaderView的frame\bounds没有值
 */
- (id)initWithReuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithReuseIdentifier:reuseIdentifier]) {
        // 添加子控件
        // 1.添加按钮
         _indicatorBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_indicatorBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        // 背景图片
        [_indicatorBtn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg"] forState:UIControlStateNormal];
        [_indicatorBtn setBackgroundImage:[UIImage imageNamed:@"buddy_header_bg_highlighted"] forState:UIControlStateHighlighted];
        // 设置按钮内部的左边箭头图片
        [_indicatorBtn setImage:[UIImage imageNamed:@"arrow"] forState:UIControlStateNormal];
        [_indicatorBtn setImage:[UIImage imageNamed:@"arrow-down"] forState:UIControlStateSelected];
        [_indicatorBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        // 设置按钮的内容左对齐
        _indicatorBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        // 设置按钮的内边距
        _indicatorBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
        _indicatorBtn.contentEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
        _indicatorBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 280, 0, 0);
        //[_indicatorBtn addTarget:self action:@selector(nameViewClick:) forControlEvents:UIControlEventTouchUpInside];
        
        // 设置按钮内部的imageView的内容模式为居中
        _indicatorBtn.imageView.contentMode = UIViewContentModeCenter;
        // 超出边框的内容不需要裁剪
        _indicatorBtn.imageView.clipsToBounds = NO;
        
        [self.contentView addSubview:_indicatorBtn];
        self.nameView = _indicatorBtn;
        
        // 2.添加好友数
        UILabel *countView = [[UILabel alloc] init];
        countView.textAlignment = NSTextAlignmentRight;
        countView.textColor = [UIColor grayColor];
        [self.contentView addSubview:countView];
        self.countView = countView;
    }
    return self;
}

- (void)btnClick:(UIButton *)btn{
    NSLog(@"btnClickTag...%ld",(long)btn.tag);
    btn.selected = !btn.selected;
    
    // 1.修改组模型的标记(状态取反)
    NSLog(@"btn.tag =%ld",(long)btn.tag);
    NSLog(@"self.group.name=%@",self.group.name);
    if(btn.selected){
        self.group.opened = YES;
    }else{
        self.group.opened = NO;
        
    }
    
    
//    if (_group.opened){
//        btn.selected = YES;
//    }else {
//        btn.selected = NO;
//    }
    
    // 2.刷新表格
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickedNameView:)]) {
        [self.delegate headerViewDidClickedNameView:self];
    }

}

/**
 *  监听组名按钮的点击
 */
- (void)nameViewClick:(UIButton *)btn
{
    // 1.修改组模型的标记(状态取反)
    NSLog(@"btn.tag =%ld",(long)btn.tag);
    NSLog(@"self.group.name=%@",self.group.name);
    _group.opened = !self.group.isOpened;
    if (_group.opened){
        btn.selected = YES;
    }else {
        btn.selected = NO;
    }
//    if (self.group.opened) {
//        self.nameView.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
//    } else {
//        self.nameView.imageView.transform = CGAffineTransformMakeRotation(0);
//    }
    
    // 2.刷新表格
    if ([self.delegate respondsToSelector:@selector(headerViewDidClickedNameView:)]) {
        [self.delegate headerViewDidClickedNameView:self];
    }
}

/**
 *  当一个控件的frame发生改变的时候就会调用
 *
 *  一般在这里布局内部的子控件(设置子控件的frame)
 */
- (void)layoutSubviews
{
    // 一定要调用super的方法
    [super layoutSubviews];
    
    // 1.设置按钮的frame
    self.nameView.frame = self.bounds;
    
    // 2.设置好友数的frame
    CGFloat countY = 0;
    CGFloat countH = self.frame.size.height;
    CGFloat countW = 150;
    CGFloat countX = self.frame.size.width - 10 - countW;
    self.countView.frame = CGRectMake(countX, countY, countW, countH);
}

- (void)setGroup:(MJFriendGroup *)group
{
    _group = group;
    
    // 1.设置按钮文字(组名)
    [self.nameView setTitle:group.name forState:UIControlStateNormal];
    
    // 2.设置好友数(在线数/总数)
    self.countView.text = [NSString stringWithFormat:@"%d/%lu", group.online, (unsigned long)group.friends.count];
    self.countView.text = nil;
}



/**
 *  当一个控件被添加到父控件中就会调用
 */
- (void)didMoveToSuperview
{
//    if (self.group.opened) {
//        self.nameView.imageView.transform = CGAffineTransformMakeRotation(M_PI_2);
//    } else {
//        self.nameView.imageView.transform = CGAffineTransformMakeRotation(0);
//    }
}

/**
 *  当一个控件即将被添加到父控件中会调用
 */
//- (void)willMoveToSuperview:(UIView *)newSuperview
//{
//    
//}
@end
