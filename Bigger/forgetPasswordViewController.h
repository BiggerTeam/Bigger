//
//  forgetPasswordViewController.h
//  Bigger
//
//  Created by Departures on 5/15/16.
//  Copyright © 2016 Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SMS_SDK/SMSSDK.h>

@interface forgetPasswordViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *sucessView;
@property (weak, nonatomic) IBOutlet UIView *confirmView;
@property (weak, nonatomic) IBOutlet UIView *titleView;

- (IBAction)cancelButtonDidPress:(id)sender;
- (IBAction)messageButtonDidPress:(id)sender;
- (IBAction)nextButtonDidPress:(id)sender;
- (IBAction)resetPasswordButtonDidPress:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberTextField;
@property (weak, nonatomic) IBOutlet UITextField *chaptchaTextField;
@property (weak, nonatomic) IBOutlet UITextField *confirmTextField;
//为了避免报错。。把NewPassword在这里前边加上了the
@property (weak, nonatomic) IBOutlet UITextField *theNewPasswordTextField;

@end
