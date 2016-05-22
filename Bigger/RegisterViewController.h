//
//  RegisterViewController.h
//  Bigger
//
//  Created by Huang on 16/5/11.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SMS_SDK/SMSSDK.h>
#import "MZTimerLabel.h"
#import "RegisterSuccessViewController.h"


@interface RegisterViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *phonenumberTextField;
@property (weak, nonatomic) IBOutlet UILabel *remindmessageLabel; //提醒用户验证吗已发送至xxx-xxxx-xxxx
@property (weak, nonatomic) IBOutlet UIButton *messagesendButton;
@property (weak, nonatomic) IBOutlet UITextField *identifycodeTextField;

- (IBAction)messagesendButtonDidPress:(id)sender;//发送验证短信
- (IBAction)nextstepButtonDidPress:(id)sender;//提交验证码





@end
