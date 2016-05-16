//
//  forgetPasswordViewController.m
//  Bigger
//
//  Created by Departures on 5/15/16.
//  Copyright © 2016 Huang. All rights reserved.
//

#import "forgetPasswordViewController.h"

@implementation forgetPasswordViewController
-(void)viewDidLoad{
    [super viewDidLoad];
    self.sucessView.hidden = YES;
    self.titleView.hidden = NO;
    self.confirmView.hidden = NO;
}



- (IBAction)cancelButtonDidPress:(id)sender {
    [self performSegueWithIdentifier:@"backToMainLoginViewController" sender:self];
}

- (IBAction)messageButtonDidPress:(id)sender {
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
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:_phoneNumberTextField.text zone:@"86" customIdentifier:nil result:^(NSError *error){
        if (!error)
            NSLog(@"获取验证码成功");
        else
            NSLog(@"错误信息：%@",error);
    }];

    
}

- (IBAction)nextButtonDidPress:(id)sender {
    [SMSSDK commitVerificationCode:_chaptchaTextField.text phoneNumber:_phoneNumberTextField.text zone:@"86" result:^(NSError *error) {
        
        if (!error) {
            NSLog(@"验证成功");
            [self performSegueWithIdentifier:@"ToSuccessViewController" sender:self];
        }
        else
        {
            NSLog(@"错误信息:%@",error);
            //测试用
            [self performSegueWithIdentifier:@"ToSuccessViewController" sender:self];
            
        }
    }];

}

- (IBAction)resetPasswordButtonDidPress:(id)sender {
}
@end
