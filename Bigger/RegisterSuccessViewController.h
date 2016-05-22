//
//  RegisterSuccessViewController.h
//  Bigger
//
//  Created by Huang on 16/5/14.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AFNetworking.h>

@interface RegisterSuccessViewController : UIViewController
//接收
@property (strong, nonatomic) IBOutlet UITextField *phonenumberTextField;

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *repeatpasswordTextField;
//为了设置在文字之后紧接着输入，另外设置三个文本框
@property (retain, nonatomic) IBOutlet UITextField *nameTextField1;
@property (retain, nonatomic) IBOutlet UITextField *passwordTextField1;
@property (retain, nonatomic) IBOutlet UITextField *repeatpasswordTextField1;


- (IBAction)nextstepButtonDidPress:(id)sender;
@end
