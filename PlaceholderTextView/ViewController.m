//
//  ViewController.m
//  PlaceholderTextView
//
//  Created by 赵进雄 on 15/2/11.
//  Copyright (c) 2015年 zhaojinxiong. All rights reserved.
//

#import "ViewController.h"
#import "PlaceholderTextView.h"

@interface ViewController ()

@property (nonatomic, retain)  PlaceholderTextView *suggestView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor yellowColor];
    
    _suggestView = [[PlaceholderTextView alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width -20, 120)];
    _suggestView.placeholder = @"请输入建议";
    _suggestView.font=[UIFont boldSystemFontOfSize:14];
    _suggestView.placeholderFont=[UIFont boldSystemFontOfSize:13];
    _suggestView.placeholderColor=[UIColor grayColor];
    _suggestView.layer.masksToBounds = YES;
    _suggestView.layer.cornerRadius = 5;
    _suggestView.layer.borderWidth=0.5;
    _suggestView.layer.borderColor=[UIColor lightGrayColor].CGColor;
    [self.view addSubview:_suggestView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
