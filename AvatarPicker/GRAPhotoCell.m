//
//  GRAPhotoCell.m
//  AvatarPicker
//
//  Created by ZhihaoChen on 16/7/4.
//  Copyright © 2016年 BlackDragon. All rights reserved.
//

#import "GRAPhotoCell.h"

@interface GRAPhotoCell()
@property (nonatomic, strong) UIImageView * photoView;
@end

@implementation GRAPhotoCell
- (void)setPhoto:(UIImage *)photo {
    _photo = photo;
    [self.photoView setImage:photo];
}

- (void)setLength:(CGFloat)length {
    _length = length;
    self.photoView.frame = CGRectMake(0, 0, length, length);
}

- (UIImageView *)photoView {
    if (!_photoView) {
        _photoView = [[UIImageView alloc]init];
        [_photoView setContentScaleFactor:[[UIScreen mainScreen] scale]];
        _photoView.contentMode =  UIViewContentModeScaleAspectFill;
        _photoView.autoresizingMask = UIViewAutoresizingFlexibleHeight;
        _photoView.clipsToBounds  = YES;
        [self.contentView addSubview:_photoView];
    }
    return _photoView;
}
@end
