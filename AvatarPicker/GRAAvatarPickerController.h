//
//  GRAAvatarPickerController.h
//  AvatarPicker
//
//  Created by ZhihaoChen on 16/7/4.
//  Copyright © 2016年 BlackDragon. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GRAAvatarPickerController : UIViewController
typedef void(^getImageBlock)(UIImage * image);
@property (nonatomic, copy) getImageBlock getImage;
@end
