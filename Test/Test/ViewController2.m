//
//  ViewController2.m
//  Test
//
//  Created by pthk on 2017/4/10.
//  Copyright © 2017年 pthk. All rights reserved.
//

#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#import "ViewController2.h"
#import "ViewController.h"
#import "ScrollerViewController.h"
#import "Masonry.h"

@interface ViewController2 ()

@property (nonatomic, strong)UIButton * MasonrySC;//scollerView的Masonry的约束
@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    
//    [self setNavigationbar];//添加一个bar
    
    //账号label
    UILabel * ZZLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 70, 110, 30)];
    ZZLabel.textAlignment = NSTextAlignmentRight;
    [ZZLabel setText:@"账号："];
    [ZZLabel setTextColor:[UIColor brownColor]];
    [self.view addSubview:ZZLabel];
    
    //账号输入
    _ZCZH = [[UITextField alloc] initWithFrame:CGRectMake(110, 70 , 160, 30)];
    _ZCZH.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_ZCZH];

    _ZCZH.textAlignment = NSTextAlignmentCenter;
    _ZCZH.secureTextEntry = NO;
    _ZCZH.layer.masksToBounds = YES;
    _ZCZH.layer.cornerRadius = _ZCZH.frame.size.height/5;
    _ZCZH.layer.borderWidth = 1.5;
    _ZCZH.layer.borderColor = [[UIColor yellowColor] CGColor];
    _ZCZH.placeholder = @"请输入账号";
    _ZCZH.alpha = 0.6;
    _ZCZH.keyboardType = UIKeyboardTypeNumbersAndPunctuation;

    
    //密码1
    UILabel * MMLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, 110, 30)];
    [self.view addSubview:MMLabel];
    MMLabel.textAlignment = NSTextAlignmentRight;
    [MMLabel setTextColor:[UIColor brownColor]];
    [MMLabel setText:@"密码:"];
    
    //密码输入
    _ZZMM1 = [[UITextField alloc] initWithFrame:CGRectMake(110, 100, 160, 30)];
    _ZZMM1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_ZZMM1];
    _ZZMM1.textAlignment = NSTextAlignmentCenter;
    _ZZMM1.secureTextEntry = YES;
    _ZZMM1.layer.masksToBounds = YES;
    _ZZMM1.layer.cornerRadius = _ZZMM1.frame.size.height/5;
    _ZZMM1.layer.borderColor = [[UIColor yellowColor] CGColor];
    _ZZMM1.layer.borderWidth = 1.5;
    _ZZMM1.placeholder = @"请输入密码";
    _ZZMM1.alpha = 0.5;
    _ZZMM1.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    
    
    //密码2
    UILabel * MMLabel2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 130, 110, 30)];
    [self.view addSubview:MMLabel2];
    MMLabel2.textAlignment = NSTextAlignmentRight;
    [MMLabel2 setTextColor:[UIColor brownColor]];
    [MMLabel2 setText:@"确认密码:"];
    
    //密码输入
    _ZZMM2 = [[UITextField alloc] initWithFrame:CGRectMake(110, 130, 160, 30)];
    _ZZMM2.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:_ZZMM2];
    _ZZMM2.textAlignment = NSTextAlignmentCenter;
    _ZZMM2.secureTextEntry = YES;
    _ZZMM2.layer.masksToBounds = YES;
    _ZZMM2.layer.cornerRadius = _ZZMM2.frame.size.height/5;
    _ZZMM2.layer.borderColor = [[UIColor yellowColor] CGColor];
    _ZZMM2.layer.borderWidth = 1.5;
    _ZZMM2.placeholder = @"请输入密码";
    _ZZMM2.alpha = 0.5;
    _ZZMM2.keyboardType = UIKeyboardTypeNumbersAndPunctuation;
    
    //定义一个按钮“返回”
    UIButton * FH = [[UIButton alloc] initWithFrame:CGRectMake(260, 450, 50, 20)];
    [self.view addSubview:FH];
    [FH setTitle:@"返回" forState:UIControlStateNormal];
    [FH setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    [FH setTitleColor:[UIColor orangeColor] forState:UIControlStateSelected];
    [FH addTarget:self action:@selector(FHBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    //进入sc的masonry的约束
//    [self MasonrySCBtn];
    
}

//创建导航条方法
- (void)setNavigationbar{
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    UINavigationBar * navBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 20, screenRect.size.width, 44)];
    navBar.tintColor = [UIColor colorWithRed:240/255.0 green:100/255.0 blue:100/255.0 alpha:1];
    navBar.backgroundColor = [UIColor grayColor];
    //创建UINavigationItem
    UINavigationItem * item = [[UINavigationItem alloc] initWithTitle:@"创建UINavigationItem"];
    [navBar pushNavigationItem:item animated:YES];
    [self.view addSubview:navBar];
    
    //创建UIBarButton
    UIBarButtonItem * btnItem = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector(btnItemClick)];
    //设置Barbutton
    item.leftBarButtonItem = btnItem;
    [navBar setItems:[NSArray arrayWithObject:item]];
    
    
    
}

- (void)btnItemClick{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIViewController * vc = [[UIViewController alloc] init];
    window.rootViewController = vc;
    
}



//返回按钮方法
- (void)FHBtnClick:(UIButton * )FHBtn
{
    NSLog(@"返回");
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    ViewController  * vc = [[ViewController alloc] init];
    //设置跳转动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:1];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.view.window cache:YES];
    [UIView commitAnimations];
    
    window.rootViewController = vc;
    
    
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
