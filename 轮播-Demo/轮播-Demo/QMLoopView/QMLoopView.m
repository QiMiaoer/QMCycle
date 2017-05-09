//
//  QMLoopView.m
//  轮播-Demo
//
//  Created by zyx on 17/3/29.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "QMLoopView.h"
#import "QMLoopViewLayout.h"
#import "QMLoopViewCell.h"

NSString *const QMLoopViewCellId = @"QMLoopViewCellId";

@interface QMLoopView ()<UICollectionViewDataSource, UICollectionViewDelegate>

@end

@implementation QMLoopView {
    NSArray <NSURL *> *_urls;
}

- (instancetype)initWithUrls:(NSArray <NSURL *> *)urls
{
    self = [super initWithFrame:CGRectZero collectionViewLayout:[[QMLoopViewLayout alloc] init]];
    if (self) {
        _urls = urls;
        self.dataSource = self;
        self.delegate = self;
        [self registerClass:[QMLoopViewCell class] forCellWithReuseIdentifier:QMLoopViewCellId];
        
        // 主队列：安排任务在主线程，如果主线程当前有任务，主队列暂不调度任务
        dispatch_async(dispatch_get_main_queue(), ^{
            NSIndexPath *indexPath = [NSIndexPath indexPathForItem:_urls.count inSection:0];
            [self scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
        });
    }
    return self;
}

#pragma mark --- UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _urls.count * 100;   // 解决卡顿问题
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    QMLoopViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:QMLoopViewCellId forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor colorWithRed:arc4random_uniform(256) / 255.0 green:arc4random_uniform(256) / 255.0 blue:arc4random_uniform(256) / 255.0 alpha:1.0];
    
    cell.url = _urls[indexPath.item % _urls.count];
    
    return cell;
}

#pragma mark --- UICollectionViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger offset = scrollView.contentOffset.x / scrollView.bounds.size.width;
    
    if (offset == 0 || offset == ([self numberOfItemsInSection:0] - 1)) {
        if (offset == 0) {
            offset = _urls.count;
        } else {
            offset = _urls.count - 1;
        }
        
        scrollView.contentOffset = CGPointMake(offset * scrollView.bounds.size.width, 0);
    }
}

@end
