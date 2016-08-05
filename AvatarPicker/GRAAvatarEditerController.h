//
//  GRAAvatarEditerController.h
//  AvatarPicker
//
//  Created by ZhihaoChen on 16/7/4.
//  Copyright © 2016年 BlackDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRAAvatarEditerController : UIViewController
typedef void(^getAvatarBlock)(UIImage * avatar);
@property (nonatomic, copy) getAvatarBlock getAvatar;
- (instancetype)initWithImage:(UIImage *)image;
@end
