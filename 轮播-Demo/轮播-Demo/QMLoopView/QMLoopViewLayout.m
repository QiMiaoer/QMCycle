//
//  QMLoopViewLayout.m
//  轮播-Demo
//
//  Created by zyx on 17/3/29.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "QMLoopViewLayout.h"

@implementation QMLoopViewLayout

- (void)prepareLayout {
    [super prepareLayout];
    
    self.itemSize = self.collectionView.bounds.size;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView.bounces = NO;
    self.collectionView.pagingEnabled = YES;
    self.collectionView.showsVerticalScrollIndicator = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
}

@end
