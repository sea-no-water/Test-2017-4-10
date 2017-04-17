//
//  NextSC.m
//  Test
//
//  Created by pthk on 2017/4/17.
//  Copyright © 2017年 pthk. All rights reserved.
//
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#import "NextSC.h"
#import <Masonry.h>

@interface NextSC ()

@end

@implementation NextSC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    [self creatNavigationBar];
    [self creatScrollerView];
    
    [self backButton];
    
}
- (void)creatNavigationBar
{
    CGRect rect = [UIScreen mainScreen].bounds;
    UINavigationBar * bar = [[UINavigationBar alloc] init];
    bar.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:bar];
    
    [bar makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.equalTo(40);
        make.size.equalTo(CGSizeMake(rect.size.width, 50));
        make.left.and.right.equalTo(self.view);
        
    }];
    
    UINavigationItem * item = [[UINavigationItem alloc] initWithTitle:@"这是一个sc"];
    [bar pushNavigationItem:item animated:YES];
    
    [bar setItems:[NSArray arrayWithObject:item]];
    
    
}

- (void)creatScrollerView
{
    
    UIScrollView * sc = [[UIScrollView alloc] init];
    sc.contentSize = CGSizeMake(0, 500);
    sc.contentOffset = CGPointMake(0, 100);
    sc.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:sc];
    
    UIView * view = [[UIView alloc] init];
    view.backgroundColor = [UIColor redColor];
    [sc addSubview:view];
    [view makeConstraints:^(MASConstraintMaker *make) {
        
        make.top.offset(0);
        make.left.offset(0);
        make.width.equalTo(sc);
        make.height.offset(200);
    }];
    
    [sc makeConstraints:^(MASConstraintMaker *make) {
        
        make.edges.equalTo(UIEdgeInsetsMake(100, 0, 200, 0));
        
    }];

}

- (void)backButton
{
    UIButton * button = [[UIButton alloc] init];
    button.backgroundColor = [UIColor blackColor];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(btnClick:)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    [button makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.equalTo(CGSizeMake(80, 40));
        make.bottom.equalTo(self.view).offset(-10);
        make.centerX.equalTo(self.view);
        
    }];
}

- (void)btnClick:(UIButton * )btn
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
