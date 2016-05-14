//
//  RegisterViewController.m
//  Bigger
//
//  Created by Huang on 16/5/11.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize phonenumberTextField,remindmessageLabel,messagesendButton,identifycodeTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)messagesendButtonDidPress:(id)sender {
  //  RemindMessage.text=@"验证吗已发送至"+
    /**
     *  @from                    v1.1.1
     *  @brief                   获取验证码(Get verification code)
     *
     *  @param method            获取验证码的方法(The method of getting verificationCode)
     *  @param phoneNumber       电话号码(The phone number)
     *  @param zone              区域号，不要加"+"号(Area code)
     *  @param customIdentifier  自定义短信模板标识 该标识需从官网http://www.mob.com上申请，审核通过后获得。(Custom model of SMS.  The identifier can get it  from http://www.mob.com  when the application had approved)
     *  @param result            请求结果回调(Results of the request)
     */
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:phonenumberTextField.text zone:@"86" customIdentifier:nil result:^(NSError *error){
        if (!error)
            NSLog(@"获取验证码成功");
        else
            NSLog(@"错误信息：%@",error);
        }];
}

- (IBAction)nextstepButtonDidPress:(id)sender {
    [SMSSDK commitVerificationCode:identifycodeTextField.text phoneNumber:phonenumberTextField.text zone:@"86" result:^(NSError *error) {
        
        if (!error) {
            NSLog(@"验证成功");
            
        }
        else
        {
            NSLog(@"错误信息:%@",error);
        }
    }];
}
////触摸背景关闭键盘。
//- (IBAction)viewAction:(id)sender {
//    [Accountname resignFirstResponder];
//}

@end
