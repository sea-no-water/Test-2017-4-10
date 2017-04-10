//
//  ViewController.m
//  Test
//
//  Created by pthk on 2017/4/8.
//  Copyright © 2017年 pthk. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton * btn = [[UIButton alloc] init];
    btn.frame = CGRectMake(100, 100, 100, 100);
    btn.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:btn];
    
    btn.tag = 10;
    btn.selected = NO;
    
    [btn setTitle:@"这是一个按钮" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)btnClick:(UIButton *)Btn
{
    static int clickcounts = 0;
    if (Btn.selected == NO){
        
        NSLog(@"%d",clickcounts);
        [Btn setTitle:[NSString stringWithFormat:@"%ld",Btn.tag] forState:UIControlStateNormal];
        clickcounts += 1;
        Btn.selected = !Btn.selected;
        
        
    }else{
        
        NSLog(@"%d",clickcounts);
        [Btn setTitle:@"这是一个按钮" forState:UIControlStateNormal];
        clickcounts += 1;
        Btn.selected = !Btn.selected;

    }

    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
