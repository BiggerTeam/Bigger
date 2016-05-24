//
//  RegisterSuccessViewController.h
//  Bigger
//
//  Created by Huang on 16/5/14.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>
#import "BiggerServerAPITools.h"
#import <SVProgressHUD.h>


@interface RegisterSuccessViewController : UIViewController<UITextFieldDelegate>
//接收上一个界面的电话号码
@property (strong, nonatomic) IBOutlet UITextField *phonenumberTextField;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *repeatpasswordTextField;
//为了设置在文字之后紧接着输入，另外设置三个文本框
@property (strong, nonatomic) IBOutlet UITextField *nameTextField1;
@property (strong, nonatomic) IBOutlet UITextField *passwordTextField1;
@property (strong, nonatomic) IBOutlet UITextField *repeatpasswordTextField1;


- (IBAction)nextstepButtonDidPress:(id)sender;
@end
