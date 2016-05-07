//
//  WQMStarView.h
//  ImageSharer
//
//  Created by WuQingMing on 16/3/7.
//  Copyright © 2016年 WuQingMing. All rights reserved.
//
#import <UIKit/UIKit.h>

@class WQMStarView;
@protocol WQMStarViewDelegate <NSObject>
- (void)starView:(WQMStarView *)starView scroeDidChange:(CGFloat)score;
@end

@interface WQMStarView : UIView
@property (nonatomic, weak) id<WQMStarViewDelegate>delegate;
@property (nonatomic, assign) BOOL bActive;

- (instancetype)initWithFrame:(CGRect)frame;
- (void)setScore:(CGFloat)scroe;

@end
