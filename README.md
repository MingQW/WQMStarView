# WQMStarView
自定义评分星星评分控件，可点击评分，滑动评分。
1、使用方法：实现WQMStarViewDelegate协议，用于实时获得当前评分。
2、定义控件，并设置代理
- (void)viewDidLoad {
    [super viewDidLoad];
    
    WQMStarView* starView = [[WQMStarView alloc] initWithFrame:CGRectMake(100, 100, 200, 40)];
    starView.delegate = self;
    [self.view addSubview:starView];
}

#pragma mark WQMStarViewDelegate //实时获得用户的评分
- (void)starView:(WQMStarView *)starView scroeDidChange:(CGFloat)score {
   NSlog(@"当前用户评分：%.1f", score);
}
