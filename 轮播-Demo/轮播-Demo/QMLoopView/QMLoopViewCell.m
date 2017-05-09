//
//  QMLoopViewCell.m
//  轮播-Demo
//
//  Created by zyx on 17/3/29.
//  Copyright © 2017年 其妙. All rights reserved.
//

#import "QMLoopViewCell.h"

@implementation QMLoopViewCell {
    UIImageView *_imageView;
}

// collectionViewCell 的 frame 是根据之前的 layout 已经确定好的
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        
        [self.contentView addSubview:_imageView];
    }
    return self;
}

- (void)setUrl:(NSURL *)url {
    _url = url;
    
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    _imageView.image = image;
}

@end
