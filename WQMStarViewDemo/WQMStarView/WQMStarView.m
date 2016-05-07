//
//  WQMStarView.m
//  ImageSharer
//
//  Created by WuQingMing on 16/3/7.
//  Copyright © 2016年 WuQingMing. All rights reserved.
//

#import "WQMStarView.h"

#define STAR_COUNT  5

@interface WQMStarView ()

@property (nonatomic, strong) UIView *yellowStarView;
@property (nonatomic, strong) UIView *grayStarView;

@end

@implementation WQMStarView {
    CGFloat _score;
}

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initUI];
    }
    return self;
}

- (void)initUI {
    _score = 0;//默认为0
    _bActive = YES;
    _grayStarView = [self constructStarView:@"grayStar"];
    _yellowStarView = [self constructStarView:@"yellowStar"];
    
    [self addSubview:_yellowStarView];
    [self addSubview:_grayStarView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [self addGestureRecognizer:tapGesture];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handleGesture:)];
    [self addGestureRecognizer:panGesture];
}

- (void)handleGesture:(UITapGestureRecognizer *)gesture {
    if (_bActive) {
        CGPoint point = [gesture locationInView:self];
        self.score = point.x / self.bounds.size.width * STAR_COUNT;
    }
}

- (UIView *)constructStarView:(NSString *)imageName {
    UIView *view = [[UIView alloc] initWithFrame:self.bounds];
    view.clipsToBounds = YES;
    view.backgroundColor = [UIColor clearColor];
    
    for (NSInteger i = 0; i < STAR_COUNT; i ++) {
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:imageName]];
        imageView.frame = CGRectMake(i * self.bounds.size.width / STAR_COUNT, 0, self.bounds.size.width / STAR_COUNT, self.bounds.size.height);
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        [view addSubview:imageView];
    }
    return view;
}

- (void)setScore:(CGFloat)scroe {
    if (_score == scroe) {
        return;
    }
    
    if (scroe < 0) {
        _score = 0;
    } else if (scroe > STAR_COUNT) {
        _score = STAR_COUNT;
    } else {
        _score = scroe;
    }
    
    if (_score != 0) {
        [self bringSubviewToFront:_yellowStarView];
    }
    
    __weak UIView *starView = _yellowStarView;
    [UIView animateWithDuration:0.2 animations:^{
        starView.frame = CGRectMake(0, 0, self.bounds.size.width * _score / STAR_COUNT, self.bounds.size.height);
    }];
    
    if ([self.delegate respondsToSelector:@selector(starView:scroeDidChange:)]) {
        [self.delegate starView:self scroeDidChange:_score];
    }
}

@end

