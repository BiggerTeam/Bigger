//
//  MainLoginViewController.h
//  Bigger
//
//  Created by Huang on 16/5/8.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HHAlertView.h"
#import "AFNetworking.h"

#define LOGINSUCCESS 200
#define WRONGPASSWORD 500
#define ILLEGALACCOUNT 100

@interface MainLoginViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *logoImageView;
@property (weak, nonatomic) IBOutlet UITextField *phonenumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;


- (IBAction)loginButtonDidPress:(id)sender;
- (IBAction)forgetpasswordButtonDidPress:(id)sender;
- (IBAction)registerButtonDidPress:(id)sender;
- (IBAction)browseButtonDidPress:(id)sender;

//整个页面的view。主要是为了设置触摸背景关闭键盘的方法。
@property (strong, nonatomic) IBOutlet UIView *views;

@end
