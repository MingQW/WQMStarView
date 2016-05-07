//
//  ViewController.m
//  WQMStarViewDemo
//
//  Created by WuQingMing on 16/5/7.
//  Copyright © 2016年 WuQingMing. All rights reserved.
//

#import "ViewController.h"
#import "WQMStarView.h"

@interface ViewController () <WQMStarViewDelegate>

@property (nonatomic, strong) UILabel *scoreLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WQMStarView* starView = [[WQMStarView alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    starView.delegate = self;
    [self.view addSubview:starView];
    
    _scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(320, 100, 40, 40)];
    [self.view addSubview:_scoreLabel];
    _scoreLabel.text = @"0";
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark WQMStarViewDelegate
- (void)starView:(WQMStarView *)starView scroeDidChange:(CGFloat)score {
    _scoreLabel.text = [NSString stringWithFormat:@"%.1f", score];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
