//
//  ViewController.m
//  AvatarPicker
//
//  Created by ZhihaoChen on 16/8/5.
//  Copyright © 2016年 BlackDragon. All rights reserved.
//

#import "ViewController.h"
#import "GRAAvatarEditerController.h"
#import "GRAAvatarPickerController.h"

@interface ViewController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate> {
    UIButton * btn;
    UIImageView * imageView;
}
@property (nonatomic, strong) UIAlertController * alertController;
@property (nonatomic, strong) UINavigationController * avatarNavigationController;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn.layer setMasksToBounds:YES];
    [btn.layer setCornerRadius:5.0];
    [btn setTitle:@"Click me" forState:UIControlStateNormal];
    [btn setTintColor:[UIColor whiteColor]];
    [btn setFrame:CGRectMake(375/2-75, 667/2-15+150, 75*2, 15*2)];
    [btn setBackgroundColor:[UIColor blackColor]];
    [btn addTarget:self action:@selector(buttonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    imageView = [[UIImageView alloc]initWithFrame:CGRectMake(375/2-75, 667/2-75, 150, 150)];
    imageView.layer.masksToBounds = YES;
    imageView.layer.cornerRadius = 75.0;
    [self.view addSubview:imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)buttonClicked {
    [self presentViewController:self.alertController animated:YES completion:nil];
}

- (UIAlertController *)alertController {
    if (!_alertController) {
        _alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
        UIAlertAction * cancel = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
        UIAlertAction * photo = [UIAlertAction actionWithTitle:@"拍照" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            UIImagePickerController * imagePickerController = [[UIImagePickerController alloc]init];
            imagePickerController.delegate = self;
            imagePickerController.allowsEditing = NO;
            imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePickerController.cameraDevice = UIImagePickerControllerSourceTypeCamera;
            [self presentViewController:imagePickerController animated:YES completion:nil];
        }];
        UIAlertAction * album = [UIAlertAction actionWithTitle:@"从相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            GRAAvatarPickerController * avatarPicker = [[GRAAvatarPickerController alloc]init];
            self.avatarNavigationController = [[UINavigationController alloc]initWithRootViewController:avatarPicker];
            [self.avatarNavigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
            [self.avatarNavigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
            avatarPicker.getImage = ^(UIImage * image) {
                GRAAvatarEditerController * editer = [[GRAAvatarEditerController alloc]initWithImage:image];
                editer.getAvatar = ^(UIImage * avatar) {
                    imageView.image = avatar;
                };
                [self.avatarNavigationController pushViewController:editer animated:YES];
            };
            [self presentViewController:self.avatarNavigationController animated:YES completion:nil];
        }];
        [_alertController addAction:cancel];
        [_alertController addAction:photo];
        [_alertController addAction:album];
    }
    return _alertController;
}

- (void)showAlertController {
    [self presentViewController:self.alertController animated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info {
    
    GRAAvatarEditerController * editer = [[GRAAvatarEditerController alloc]initWithImage:info[UIImagePickerControllerOriginalImage]];
    editer.getAvatar = ^(UIImage * avatar) {
        imageView.image = avatar;
    };
    //    self.avatarNavigationController = [[UINavigationController alloc]initWithRootViewController:editer];
    //    [self.avatarNavigationController.navigationBar setBackgroundImage:[[UIImage alloc] init] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    //    [self.avatarNavigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    [picker pushViewController:editer animated:YES];
    //    [self presentViewController:self.avatarNavigationController animated:YES completion:nil];
}

@end