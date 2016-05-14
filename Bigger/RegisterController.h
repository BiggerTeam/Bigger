//
//  RegisterController.h
//  Bigger
//
//  Created by Huang on 16/5/11.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SMS_SDK/SMSSDK.h>

@interface RegisterController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *PhoneNumber;
@property (weak, nonatomic) IBOutlet UILabel *RemindMessage; //提醒用户验证吗已发送至xxx-xxxx-xxxx
@property (weak, nonatomic) IBOutlet UIButton *MessageSend;
@property (weak, nonatomic) IBOutlet UITextField *IdentifyCode;

- (IBAction)Check:(id)sender;//发送验证短信
- (IBAction)Next:(id)sender;//提交验证码





@end
