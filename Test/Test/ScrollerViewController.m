//
//  ScrollerViewController.m
//  Test
//
//  Created by pthk on 2017/4/15.
//  Copyright © 2017年 pthk. All rights reserved.
//
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#import "ScrollerViewController.h"
#import "Masonry.h"
#import "NextSC.h"

@interface ScrollerViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView * SC;



@end

@implementation ScrollerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatScroller];
    [self creatNextScExit];//进图另一个sc
    
    [self backButton];
    
    
    
}

#pragma mark懒加载
- (UIScrollView * )SC
{
    if (!_SC)
    {
        UIScrollView * sc       = [[UIScrollView alloc] init];
        sc.backgroundColor      = [UIColor orangeColor];
//        sc.contentSize          = CGSizeMake(320*10, 200);
//        sc.contentOffset        = CGPointMake(100, 100);
        sc.pagingEnabled        = NO;
        sc.scrollEnabled        = YES;
        sc.scrollsToTop         = YES;
        sc.showsHorizontalScrollIndicator = YES;//defaultYes
        sc.delegate             = self;
        sc.bounces              = YES;//是否有弹簧效果
//        sc.contentInset = UIEdgeInsetsMake(10, 10, 10, 10);
        
        [self.view addSubview:sc];
        
        [sc makeConstraints:^(MASConstraintMaker *make) {
            
            make.centerX.equalTo(sc.superview);
            make.top.equalTo(self.view).offset(50);
            make.size.equalTo(CGSizeMake(sc.superview.frame.size.width, sc.superview.frame.size.height-100));
            
        }];
        _SC = sc;
    }
    
    return _SC;
}

- (void)creatNextScExit
{
    UIButton * btn = [[UIButton alloc] init];
    btn.backgroundColor = [UIColor blackColor];
    [btn setTitle:@"进入另一个sc" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:btn];
    
    [btn makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(self.view);
        make.size.equalTo(CGSizeMake(200, 40));
        make.centerX.equalTo(self.view);
    }];
    
}

- (void)btnClick:(UIButton * )btn
{
    NextSC * sc = [[NextSC alloc] init];
    [self presentViewController:sc animated:YES completion:nil];
}

- (void)creatScroller
{
    [self SC];
    UIView * spview = [[UIView alloc] init];
    spview.backgroundColor = [UIColor redColor];
    [_SC addSubview:spview];
    
    [spview makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(_SC);
        make.width.equalTo(_SC);
        
    }];
    
    int count = 20;
    UIView * lastview = nil;

    for (int i = 0; i<= count; i ++)
    {
        UIView * view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithRed:(arc4random()%200/256.0)
                                               green:(arc4random()%100/256.0)
                                                blue:(arc4random()%300/256.0)
                                               alpha:1];
        [spview addSubview:view];
        
        [view makeConstraints:^(MASConstraintMaker *make) {
            
            make.left.and.right.equalTo(spview);
            make.height.equalTo(20*i);
            if (lastview)
            {
                make.top.equalTo(lastview.bottom);
                
            }else
            {
                make.top.equalTo(spview.top);
            }
            
        }];
        lastview = view;
    }
    
    [spview makeConstraints:^(MASConstraintMaker *make) {
        
        make.bottom.equalTo(lastview.bottom);
    }];
}
- (void)backButton
{
    UIButton * button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(backBtnClick:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(80, 40));
        make.top.equalTo(self.view).offset(20);
        make.left.equalTo(self.view);
        
    }];
}

- (void)backBtnClick:(UIButton * )btn
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
