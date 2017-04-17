//
//  NextSc.m
//  Test
//
//  Created by pthk on 2017/4/15.
//  Copyright © 2017年 pthk. All rights reserved.
//
#define MAS_SHORTHAND
#define MAS_SHORTHAND_GLOBALS

#import "NextSc.h"
#import <Masonry.h>

@interface NextSc ()

@end

@implementation NextSc

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor lightGrayColor];
    
    [self creatNavigationBar];
    
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
    sc.contentSize = CGSizeMake(0, 0);
    sc.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:sc];
    
    UIView * view = [[UIView alloc] init];
    
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    
    
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
