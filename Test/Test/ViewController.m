//
//  ViewController.m
//  Test
//
//  Created by pthk on 2017/4/8.
//  Copyright © 2017年 pthk. All rights reserved.
//

#import "ViewController.h"
#import "ViewController2.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //账号
    UIImageView * image = [[UIImageView alloc] initWithFrame:CGRectMake(130, 80, 60, 60)];
    image.image = [UIImage imageNamed:@""];
    image.backgroundColor = [UIColor orangeColor];
    image.layer.masksToBounds = YES;
    image.layer.cornerRadius = image.frame.size.height/2;
    image.layer.borderWidth = 1;
    image.layer.borderColor = [[UIColor orangeColor] CGColor];
    [self.view addSubview:image];
    
    UILabel * ZHLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 170, 50, 30)];
    [self.view addSubview:ZHLabel];
    ZHLabel.textAlignment = NSTextAlignmentCenter;
    [ZHLabel setText:@"账号"];
    [ZHLabel setTextColor:[UIColor brownColor]];
    
    DLZHtf = [[UITextField alloc] initWithFrame:CGRectMake(80, 170, 160, 30)];
    DLZHtf.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:DLZHtf];
    
    DLZHtf.textAlignment = NSTextAlignmentLeft;
    DLZHtf.secureTextEntry = NO;
    DLZHtf.layer.masksToBounds = YES;
    DLZHtf.layer.cornerRadius = DLZHtf.frame.size.height/5;
    DLZHtf.layer.borderColor = [[UIColor yellowColor] CGColor];
    DLZHtf.layer.borderWidth = 1.5;
    DLZHtf.placeholder = @"请输入账号";
    DLZHtf.alpha = 0.5;
    DLZHtf.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    //设置返回键为“join”
    DLZHtf.returnKeyType = UIReturnKeyJoin;
    
    //密码
    UILabel * MMLabel = [[UILabel alloc] initWithFrame:CGRectMake(25, 200, 50, 30)];
    [self.view addSubview:MMLabel];
    MMLabel.textAlignment = NSTextAlignmentCenter;
    [MMLabel setText:@"密码"];
    [MMLabel setTextColor:[UIColor brownColor]];
    
    DLMMtf = [[UITextField alloc] initWithFrame:CGRectMake(80, 200, 160, 30)];
    DLMMtf.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:DLMMtf];
    
    DLMMtf.textAlignment        = NSTextAlignmentLeft;
    DLMMtf.secureTextEntry      = YES;//保密switch
    DLMMtf.layer.masksToBounds  = YES;
    DLMMtf.layer.cornerRadius   = DLMMtf.frame.size.height/5;
    DLMMtf.layer.borderColor    = [[UIColor yellowColor] CGColor];
    DLMMtf.layer.borderWidth    = 1.5;
    DLMMtf.placeholder          = @"请输入密码";
    DLMMtf.alpha                = 0.5;
    DLMMtf.keyboardType         = UIKeyboardTypeNumbersAndPunctuation;
    //设置返回键为“join”
    DLMMtf.returnKeyType        = UIReturnKeyJoin;
    
    UIButton * DLbutton         = [[UIButton alloc] init];
    DLbutton.frame              = CGRectMake(120, 265, 80, 35);
    DLbutton.backgroundColor    = [UIColor brownColor];
    [self.view addSubview:DLbutton];
    
    [DLbutton setTitle:@"登录" forState:UIControlStateNormal];
    [DLbutton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    DLbutton.layer.masksToBounds    = YES;
    DLbutton.layer.cornerRadius     = DLbutton.frame.size.height/5;
    DLbutton.layer.borderWidth      = 1.5;
    DLbutton.layer.borderColor      = [[UIColor yellowColor] CGColor];
    
    [DLbutton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //没有账号？注册一个...；
    UIButton * zcBtn = [[UIButton alloc] initWithFrame:CGRectMake(170, 450, 150, 20)];
    [zcBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [zcBtn setTitle:@"没有账号？注册..." forState:UIControlStateNormal];
    [zcBtn addTarget:self action:@selector(zcBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:zcBtn];
    
    //更改按钮上的字体大小
    zcBtn.titleLabel.font = [UIFont systemFontOfSize:12];
    
    
}

- (void)btnClick:(UIButton *)Btn
{
    NSLog(@"登录");
    
}

- (void)zcBtnClick:(UIButton *)zcBtn{
    
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    ViewController2 * vc2 = [[ViewController2 alloc] init];
    window.rootViewController = vc2;
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
