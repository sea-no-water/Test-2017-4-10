//
//  MasonryKeyBoardViewController.m
//  Test
//
//  Created by pthk on 2017/4/13.
//  Copyright © 2017年 pthk. All rights reserved.
//
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#import "MasonryKeyBoardViewController.h"
#import "Masonry.h"



@interface MasonryKeyBoardViewController ()<UITextFieldDelegate>

@property (nonatomic, strong)UIButton       * button;
@property (nonatomic, assign)CGSize           btnSize;
@property (nonatomic, strong)UITextField    * text;


@end

@implementation MasonryKeyBoardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
    [self buttonConstrains];
    [self textConstrains];
    
    
}
#pragma mark 约束
- (void)buttonConstrains
{
    [self button];
    [_button makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(200, 50));
        make.center.equalTo(self.view);
        self.btnSize = self.button.frame.size;

    }];
    
    [self.button  layoutIfNeeded];//立即渲染视图
    self.btnSize = self.button.frame.size;//block外给变量赋值

    NSLog(@"%@",NSStringFromCGRect(self.button.frame));
    NSLog(@"=====%@",NSStringFromCGSize(self.btnSize));
}

- (void)textConstrains
{
    [self text];
    [_text makeConstraints:^(MASConstraintMaker *make) {
        
//        make.left.equalTo(_button.left);
//        make.bottom.equalTo(_button.top).offset(-30);
        make.size.equalTo(CGSizeMake(200, 50));
        make.centerY.equalTo(_button.centerY).offset(-80);
        make.centerX.equalTo(_button.centerX);
    }];
    
}


#pragma mark 懒加载
- (UIButton * )button
{
    if (!_button)
    {
        UIButton * button = [[UIButton alloc] init];
        button.backgroundColor = [UIColor orangeColor];
        [button setTitle:@"这是一个按钮" forState:UIControlStateNormal];
        [button addTarget:self
                   action:@selector(buttonClick:)
         forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:button];
        _button = button;
    }
    return _button;
}

- (void)buttonClick:(UIButton * )btn
{
    self.btnSize = CGSizeMake(self.btnSize.width*2, self.btnSize.height*2);

    NSLog(@"111%@",NSStringFromCGSize(self.btnSize));
    
    [UIView animateWithDuration:2 animations:^{
        [_button updateConstraints:^(MASConstraintMaker *make) {
            
            make.size.equalTo(CGSizeMake(self.btnSize.width,self.btnSize.height));
            make.center.equalTo(self.view);
     
        }];
        
    }];


}

- (UITextField * )text
{
    if (!_text)
    {
        UITextField * text = [[UITextField alloc] init];
        text.backgroundColor = [UIColor lightGrayColor];
        text.font = [UIFont systemFontOfSize:15];
        text.layer.borderWidth = 1;
        text.layer.borderColor = [[UIColor yellowColor] CGColor];
        text.secureTextEntry = NO;
        text.borderStyle = UITextBorderStyleBezel;
//        [text setEnabled:YES];//设置是否可以输入
        text.textAlignment = NSTextAlignmentLeft;
        [self.view addSubview:text];
        _text = text;
        
    }
    
    return _text;
    
    
}





- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [_text resignFirstResponder];
    
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
