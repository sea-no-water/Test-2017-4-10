//
//  MasonryViewController.m
//  Test
//
//  Created by pthk on 2017/4/12.
//  Copyright © 2017年 pthk. All rights reserved.
//

#define MAS_SHORTHAND//对于约束参数可以省略"mas_"
#define MAS_SHORTHAND_GLOBALS//对于默认的约束参数自动装箱

#import "MasonryViewController.h"
#import "Masonry.h"
#import "MasonryKeyBoardViewController.h"
@interface MasonryViewController ()

@property (nonatomic, strong)UILabel        * header;
//登录Method
@property (nonatomic, strong)UILabel        * ZHLabel;//账号label
@property (nonatomic, strong)UILabel        * MMLabel;//密码label
@property (nonatomic, strong)UITextField    * ZHText;//账号输入
@property (nonatomic, strong)UITextField    * MMText;//密码输入
@property (nonatomic, strong)UIButton       * DLBtn;//登录按钮

@end

@implementation MasonryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor colorWithWhite:0.9 alpha:1];
    
    
    _header = [[UILabel alloc] init];
    _header.backgroundColor = [UIColor whiteColor];
    _header.text = @"Masonry约束";
    _header.textAlignment = NSTextAlignmentCenter;
    _header.font = [UIFont boldSystemFontOfSize:16];
    _header.textColor = [UIColor blackColor];
    [self.view addSubview:_header];
    
    //头条的约束
    [_header mas_makeConstraints:^(MASConstraintMaker *make) {
        //约束空间距离各个边距20
//        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(20, 20, 20, 20));
        
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.top.equalTo(self.view).offset(20);
        make.height.offset(44);
        
    }];
    //登录的Method
    [self DengLuMethod];
   
    
}

//登录Method约束
- (void)DengLuMethod
{
    //账号label
    [self ZHLabel];
    [_ZHLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_header.bottom).offset(50);
        make.left.offset(20);
        //        make.right.equalTo(_ZHText.left).offset(10);//距离输入框10
        make.height.offset(40);
        
    }];
    
    [self ZHText];
    [_ZHText mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(_header.bottom).offset(50);
        make.right.equalTo(self.view).offset(-30);
        make.width.offset(self.view.bounds.size.width*4/6);//宽度为页面的4/5
        make.left.equalTo(_ZHLabel.right).offset(10);//距离输入label10
        make.height.equalTo(_ZHLabel.height);
        
        
    }];
    
    //密码
     [self MMLabel];
    [_MMLabel makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.offset(20);
        make.height.equalTo(_ZHLabel.height);
        make.top.equalTo(_ZHLabel.bottom).offset(20);
        
    }];
    
    [self MMText];
    [_MMText makeConstraints:^(MASConstraintMaker *make) {
        
        make.right.offset(-30);
        make.left.equalTo(_MMLabel.right).offset(10);
        make.top.equalTo(_MMLabel.top);
        make.height.equalTo(_MMLabel.height);
        make.width.equalTo(_ZHText.width);
        
    }];
    
    //登录按钮
    [self DLBtn];
    [_DLBtn makeConstraints:^(MASConstraintMaker *make) {
        
        make.centerX.equalTo(self.view.centerX);
        make.width.equalTo(_MMText.width);
        make.height.equalTo(_ZHLabel.height);
        make.top.equalTo(_MMText.bottom).offset(40);
        
    }];

    
}

#pragma mark 懒加载
- (UILabel * )ZHLabel
{
    if (!_ZHLabel) {
        UILabel * label = [[UILabel alloc] init];
        label.textColor = [UIColor brownColor];
        label.text = @"账号:";
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:15];
        [self.view addSubview:label];
        _ZHLabel = label;
        
    }
    
    return _ZHLabel;
}

- (UILabel * )MMLabel
{
    if (!_MMLabel){
        
        UILabel * label = [[UILabel alloc] init];
        label.text = @"密码:";
        label.textColor = [UIColor brownColor];
        label.textAlignment = NSTextAlignmentRight;
        label.font = [UIFont systemFontOfSize:15];
        [self.view addSubview:label];
        _MMLabel = label;
    }
    return _MMLabel;
    
}

- (UITextField * )ZHText
{
    if (!_ZHText)
    {
        UITextField * text = [[UITextField alloc] init];
        text.backgroundColor = [UIColor lightGrayColor];
        text.placeholder = @"请输入账号";
        text.textAlignment = NSTextAlignmentLeft;
        text.layer.borderWidth = 1;
        text.layer.borderColor = [[UIColor orangeColor] CGColor];
        text.layer.masksToBounds = YES;
        text.layer.cornerRadius = 5;
        text.alpha = 0.6;
        text.font = [UIFont systemFontOfSize:15];
        text.textColor = [UIColor blackColor];
        text.keyboardType = UIKeyboardTypeDefault;
        [self.view addSubview:text];
        _ZHText = text;
        
    }
    return _ZHText;
    
}

- (UITextField * )MMText
{
    if (!_MMText)
    {
        UITextField * text = [[UITextField alloc] init];
        text.backgroundColor = [UIColor lightGrayColor];
        text.placeholder = @"请输入密码";
        text.textAlignment = NSTextAlignmentLeft;
        text.layer.borderWidth = 1;
        text.layer.borderColor = [[UIColor orangeColor] CGColor];
        text.layer.masksToBounds = YES;
        text.layer.cornerRadius = 5;
        text.alpha = 0.7;
        text.font = [UIFont systemFontOfSize:15];
        text.textColor = [UIColor blackColor];
        text.secureTextEntry = YES;
        [self.view addSubview:text];
        _MMText = text;
    }
    return _MMText;
}

- (UIButton *)DLBtn
{
    if (!_DLBtn)
    {
        UIButton * btn = [[UIButton alloc] init];
        btn.backgroundColor = [UIColor brownColor];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 10;
        [btn setTitle:@"登录" forState:UIControlStateNormal];
        [btn addTarget:self
                action:@selector(DLBtnClick:)
      forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        _DLBtn = btn;
    }
    return _DLBtn;
    
}

- (void)DLBtnClick:(UIButton * )DLBtn
{
    NSLog(@"登录");
    MasonryKeyBoardViewController * vc = [[MasonryKeyBoardViewController alloc] init];
    [self presentViewController:vc animated:YES completion:^{
        
        NSLog(@"进入模态页面");
        
    }];

    
    
}


//点击屏幕
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
//    [self.view endEditing:YES];
    [_ZHText resignFirstResponder];
    
    
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
