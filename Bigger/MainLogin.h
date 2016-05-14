//
//  MainLogin.h
//  Bigger
//
//  Created by Huang on 16/5/8.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface MainLogin : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *LogoImage;
@property (weak, nonatomic) IBOutlet UITextField *AccountTextField;
@property (weak, nonatomic) IBOutlet UITextField *PasswordTextField;
@property (weak, nonatomic) IBOutlet UIButton *Login;
@property (weak, nonatomic) IBOutlet UIButton *ForgetPassword;
@property (weak, nonatomic) IBOutlet UIButton *Register;
@property (weak, nonatomic) IBOutlet UIButton *Browse;




//整个页面的view。主要是为了设置触摸背景关闭键盘的方法。
@property (strong, nonatomic) IBOutlet UIView *views;

@end
