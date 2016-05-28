//
//  RegisterViewController.m
//  Bigger
//
//  Created by Huang on 16/5/11.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()<MZTimerLabelDelegate>{
    UILabel *timer_show; //倒计时Label
}


@end

@implementation RegisterViewController

@synthesize phonenumberTextField,remindmessageLabel,messagesendButton,identifycodeTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    NSString *str = [NSString stringWithFormat:@"验证"];
//    messagesendButton.titleLabel.text = str;
    
    //设置验证按钮的初始状态
    [messagesendButton setTitle:@"发送验证码" forState:UIControlStateNormal];
    messagesendButton.titleLabel.font = [UIFont systemFontOfSize:13.5];
    // messagesendButton.backgroundColor = [UIColor lightGrayColor];

    //设置短信发送提示信息初始状态
    remindmessageLabel.text = [NSString stringWithFormat:@""];
    
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

/**
 * “发送验证码”按钮点击动作
 */
- (IBAction)messagesendButtonDidPress:(id)sender {
    
    //号码为空则弹出提示框
    if([phonenumberTextField.text isEqualToString:@""]){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"手机号码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
    
    [messagesendButton setTitle:@"短信发送中" forState:UIControlStateNormal];
    messagesendButton.titleLabel.font = [UIFont systemFontOfSize:13.5];
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
        if (!error){
            //发送成功之后提醒用户“已发送”并进入倒计时
            NSLog(@"获取验证码成功");
            remindmessageLabel.text = [NSString stringWithFormat:@"验证码已发送"];
            //remindmessageLabel.text = [NSString stringWithFormat:@"验证码已发送至%@",phonenumberTextField.text];
            remindmessageLabel.textColor = [UIColor lightGrayColor];

            [self timeCount];
        }else
        {NSLog(@"错误信息：%@",error);
            [messagesendButton setTitle:@"重新发送" forState:UIControlStateNormal];
            
            //发送失败出现提示
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"验证码发送失败" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
        }
        }];
    }

//        _time = 10;//初始化倒计时时间
//        [messagesendButton setTitle:[NSString stringWithFormat:@"%ld秒后重新发送",(long)_time] forState:UIControlStateNormal];
//         messagesendButton.titleLabel.font = [UIFont systemFontOfSize:10];
//    
//        messagesendButton.enabled = NO;//按钮处于不可的点击状态
//        //messagesendButton.titleLabel.backgroundColor =[UIColor lightGrayColor];//按钮变为灰色
//        [NSTimer scheduledTimerWithTimeInterval:1.0
//                                         target:self
//                                       selector:@selector(countTime:)
//                                       userInfo:nil
//                                        repeats:(BOOL)_time];
    
}

/**
 * “下一步”按钮点击动作
 */
- (IBAction)nextstepButtonDidPress:(id)sender {
    if ([identifycodeTextField.text isEqualToString:@""]) {
        //验证码为空出现提示
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"验证码不能为空" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
    }else{
    [SMSSDK commitVerificationCode:identifycodeTextField.text phoneNumber:phonenumberTextField.text zone:@"86" result:^(NSError *error) {
        if (!error) {
            NSLog(@"验证成功");
            //跳转到二级注册界面
            [self performSegueWithIdentifier:@"gotoRegisterSuccessViewController" sender:self];
        }
        else
        {
            NSLog(@"错误信息:%@",error);
            //验证码错误出现提示
            UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"验证码错误" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancel=[UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
            [alert addAction:cancel];
            [self presentViewController:alert animated:YES completion:nil];
        }
    }];
    }
}
////触摸背景关闭键盘。
//- (IBAction)viewAction:(id)sender {
//    [Accountname resignFirstResponder];
//}



/**
 *  倒计时
 */
- (void)timeCount{
    [messagesendButton setTitle:nil forState:UIControlStateNormal];//把按钮原先的名字消掉
    timer_show = [[UILabel alloc] initWithFrame:CGRectMake(0,0,93,30)];//UILabel设置成和UIButton一样的尺寸和位置
    [messagesendButton addSubview:timer_show];//把timer_show添加到按钮上
    
    MZTimerLabel *timer_cutDown = [[MZTimerLabel alloc] initWithLabel:timer_show andTimerType:MZTimerLabelTypeTimer];//创建MZTimerLabel类的对象timer_cutDown
    [timer_cutDown setCountDownTime:60];//倒计时时间60s
    timer_cutDown.timeFormat = @"重新发送(ss)";//倒计时格式,也可以是@"HH:mm:ss SS"，时，分，秒，毫秒；想用哪个就写哪个
    timer_cutDown.timeLabel.textColor = [UIColor lightGrayColor];//倒计时字体颜色
    timer_cutDown.timeLabel.font = [UIFont systemFontOfSize:10];//倒计时字体大小
    timer_cutDown.timeLabel.textAlignment = NSTextAlignmentCenter;//剧中
    timer_cutDown.delegate = self;//设置代理，以便后面倒计时结束时调用代理
    messagesendButton.enabled = NO;//按钮禁止点击
    [timer_cutDown start];//开始计时
}
//倒计时结束后的代理方法
- (void)timerLabel:(MZTimerLabel *)timerLabel finshedCountDownTimerWithTime:(NSTimeInterval)countTime{
    [messagesendButton setTitle:@"重新发送" forState:UIControlStateNormal];//倒计时结束后按钮名称改为"重新发送"
    remindmessageLabel.text = [NSString stringWithFormat:@""];//倒计时结束后移除提示文字

    [timer_show removeFromSuperview];//移除倒计时模块
    messagesendButton.enabled = YES;//按钮可以点击
}

/**
 *跳转二级页面时将电话号码传过去
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // segue.identifier：获取连线的ID
    if ([segue.identifier isEqualToString:@"gotoRegisterSuccessViewController"]) {
        // segue.destinationViewController：获取连线时所指的界面（VC）
        RegisterSuccessViewController *receive = segue.destinationViewController;
        receive.phonenumber = self.phonenumberTextField.text;
        // 这里不需要指定跳转了，因为在按扭的事件里已经有跳转的代码
        //		[self.navigationController pushViewController:receive animated:YES];
    }
}
@end
