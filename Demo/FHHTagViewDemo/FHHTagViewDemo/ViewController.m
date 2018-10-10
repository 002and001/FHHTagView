//
//  ViewController.m
//  FHHTagView
//
//  Created by 002 on 2018/10/8.
//  Copyright © 2018年 002. All rights reserved.
//

#import "ViewController.h"
#import "FHHTagView.h"
#import "FHHTag.h"
#import "UIView+FHHFrame.h"
#import "FHHTagViewControllerDemo.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    btn.layer.cornerRadius = 10.0;
    btn.clipsToBounds = YES;
    btn.fhh_centerX = self.view.fhh_width * 0.5;
    btn.fhh_centerY = self.view.fhh_height * 0.5;
    [btn setTitle:@"View Demo" forState:UIControlStateNormal];
    [self.view addSubview:btn];
    btn.backgroundColor = [UIColor blueColor];
    [btn addTarget:self action:@selector(p_jumpToFHHTagListViewController) forControlEvents:UIControlEventTouchUpInside];
}

- (void)p_jumpToFHHTagListViewController {
    FHHTagViewControllerDemo *vc = [[FHHTagViewControllerDemo alloc] init];
    [self presentViewController:vc animated:true completion:nil];
}

@end
