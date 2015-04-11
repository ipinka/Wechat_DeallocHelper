//
//  ViewController.m
//  DeallocHelper
//
//  Created by Pinka on 15-4-10.
//  Copyright (c) 2015年 Pinka. All rights reserved.
//

#import "ViewController.h"
#import "DeallocHelper.h"

void *TestKey = &TestKey;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSString *test1 = @"2";
    [DeallocHelper attachToObject:test1 key:TestKey whenDeallocDoThis:^{
        NSLog(@"test1 dealloc");
    }];
    
    NSString *test2 = [NSString stringWithFormat:@"%d", 2];
    [DeallocHelper attachToObject:test2 key:TestKey whenDeallocDoThis:^{
        NSLog(@"test2 dealloc");
    }];
    
    NSString *test3 = [NSString stringWithFormat:@"%d", 2];
    [DeallocHelper attachToObject:test3 key:TestKey whenDeallocDoThis:^{
        NSLog(@"test3 dealloc");
    }];
    [DeallocHelper dettachObject:test3 key:TestKey];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
