//
//  ViewController.m
//  轮播-Demo
//
//  Created by zyx on 17/3/29.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "ViewController.h"
#import "QMLoopView.h"

@interface ViewController ()

@end

/**
 属性和成员变量的区别
 
 - 属性：提供了 getter & setter / 成员变量
 - 成员变量
 
 真正保存数据的是‘成员变量’
 */
@implementation ViewController {
    NSArray <NSURL *> *_urls;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self loadData];
    
    QMLoopView *loopView = [[QMLoopView alloc] initWithUrls:_urls];
    loopView.frame = CGRectMake(20, 20, self.view.bounds.size.width - 40, 200);
    [self.view addSubview:loopView];
}

- (void)loadData {
    NSMutableArray *arrayM = [NSMutableArray array];
    
    for (int i = 0; i < 3; i++) {
        NSString *fileName = [NSString stringWithFormat:@"%02d.png", i + 1];
        NSURL *url = [[NSBundle mainBundle] URLForResource:fileName withExtension:nil];
        
        [arrayM addObject:url];
    }
    
    _urls = [arrayM copy];
}

@end
