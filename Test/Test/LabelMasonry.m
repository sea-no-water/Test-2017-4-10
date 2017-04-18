//
//  LabelMasonry.m
//  Test
//
//  Created by pthk on 2017/4/17.
//  Copyright © 2017年 pthk. All rights reserved.
//

#import "LabelMasonry.h"

@interface LabelMasonry ()
@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (strong, nonatomic) UILabel *textLab;
@end

@implementation LabelMasonry

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self creatTextLabel];
    [self creatBtn];
    
}

- (void)creatTextLabel
{
    UILabel * label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor orangeColor];
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"安静发拉科技；垃圾；了啊；翻江倒海覅而获IE胡覅额无法还肺癌U币发快点发货阿福卡复活澳康达";
    label.numberOfLines = 0;
    [self.view addSubview:label];
    
    _textLab = label;
    
    [label makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view);
        make.left.equalTo(self.view);
        make.width.lessThanOrEqualTo(300);//lessThanOrEqualTo:小于等于
    }];
}
- (void)creatBtn
{
    UIButton * button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor redColor];
    button.titleLabel.font = [UIFont italicSystemFontOfSize:12];//italic:斜体字
    [button setTitle:@"更换文字" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    [button makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.view);
        make.size.equalTo(CGSizeMake(60, 40));
        make.right.offset(0);
    }];
}

- (void)btnClick:(UIButton * )btn
{
    if (btn.selected == NO)
    {
        _textLab.text = @"Hello";

    }
    else
    {
        _textLab.text = @"安静发拉科技；垃圾；了啊；翻江倒海覅而获IE胡覅额无法还肺癌U币发快点发货阿福卡复活澳康达";

    }
    btn.selected = !btn.selected;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _textLabel.text = @"123456789";
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
