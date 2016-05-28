//
//  RegisterSuccessViewController.m
//  Bigger
//
//  Created by Huang on 16/5/14.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import "RegisterSuccessViewController.h"

@interface RegisterSuccessViewController ()

@end

@implementation RegisterSuccessViewController
@synthesize nameTextField,passwordTextField,repeatpasswordTextField,nameTextField1,passwordTextField1,repeatpasswordTextField1,phonenumber;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //暫時的方法
    phonenumber = [NSString stringWithFormat:@"128"];
    
    // Do any additional setup after loading the view.
    
    /*设置三个文本框从文字之后紧接着输入*/
    nameTextField1 = [[UITextField alloc] initWithFrame:CGRectMake(74, 0, 460, 30)];
    [nameTextField addSubview:nameTextField1];
    nameTextField1.placeholder = @"6-12个字母或数字";
    nameTextField1.borderStyle = UITextBorderStyleNone;
    
    passwordTextField1 = [[UITextField alloc] initWithFrame:CGRectMake(74, 0, 460, 30)];
    [passwordTextField addSubview:passwordTextField1];
    passwordTextField1.borderStyle = UITextBorderStyleNone;
    passwordTextField1.delegate = self;
    
    repeatpasswordTextField1 = [[UITextField alloc] initWithFrame:CGRectMake(74, 0, 426, 30)];
    [repeatpasswordTextField addSubview:repeatpasswordTextField1];
    repeatpasswordTextField1.borderStyle = UITextBorderStyleNone;
    repeatpasswordTextField1.delegate = self;
    
    
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

- (IBAction)nextstepButtonDidPress:(id)sender {
    if ([nameTextField1.text isEqualToString:@""]||[passwordTextField1.text isEqualToString:@""]) {
        [self showWarningMessage:@"用户名或密码不能为空"];
    }else
    if (![passwordTextField1.text isEqualToString:repeatpasswordTextField1.text]) {
        [self showWarningMessage:@"密码不一致"];
    }else{
        [self getRegisterResult];
    }
    
}
/**
 *   从服务器获取注册结果
 */
-(void)getRegisterResult{
    //1.请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    AFSecurityPolicy *securitypolicy = [AFSecurityPolicy defaultPolicy];
    securitypolicy.allowInvalidCertificates = YES;
    mgr.securityPolicy = securitypolicy;
    
    //2.后台登录接口
    NSURL *URL = [NSURL URLWithString:[BiggerServerAPITools RegisterUserphone:phonenumber Password:passwordTextField1.text Username:nameTextField1.text]];
    
    //3.发送一个POST请求
    [mgr POST:[URL absoluteString] parameters:nil progress:^(NSProgress *uploadProgress) {
    }  success:^(NSURLSessionDataTask *operation, id responseObject){
        NSLog(@"请求成功%@", responseObject);
        //获得返回的json值，register的返回值只包含code
        NSDictionary *dictionary = (NSDictionary *)responseObject;
        // NSLog(@"%@",dictionary);
        //截取code值
        NSInteger result = [self getRegisterResult:dictionary];
        
        switch (result) {
            case REGISTERSUCCESS:{
                NSLog(@"success");
                //跳转到标签选择页面
                [self performSegueWithIdentifier:@"gotoLabelChooseViewController" sender:self];
                break;
            }
            case REGISTERFAIL:{
                NSLog(@"fail");
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"注册失败" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:cancel];
                [self presentViewController:alert animated:YES completion:nil];
                break;
            }
            case  PHONEALREADYEXIST:{
                NSLog(@"phonealreadyexist");
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"号码已经存在" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:cancel];
                [self presentViewController:alert animated:YES completion:nil];
                break;
            }
            default:
                break;
        }
        
        
    }failure:^(NSURLSessionDataTask *operation, NSError *error){
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"服务器请求失败" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
        [alert addAction:cancel];
        [self presentViewController:alert animated:YES completion:nil];
        NSLog(@"请求失败-%@",error);
    }];
    

}
//从返回判断注册状态
-(NSInteger)getRegisterResult:(NSDictionary*)dictionary{
    
    NSArray *array = [NSArray arrayWithObject:dictionary[@"code"]];
    NSString *result =[[NSString stringWithFormat:@"%@",array] substringWithRange:NSMakeRange(6, 3)];
    return [result integerValue];
}

/**
 *   passwordTextField1和repeatpassword的代理方法：获得焦点时提示用户名和密码是否合法
 */
-(void)textFieldDidBeginEditing:(UITextField *)textField{
    if ([passwordTextField1 isFirstResponder]) {
        //判断nameTextField1是否为空
        if ([nameTextField1.text isEqualToString:@""]) {
            [self showWarningMessage:@"用户名不能为空"];

    }else//判断passwordTextField1长度是否合法
        if (nameTextField1.text.length<6 ||nameTextField1.text.length>12) {
            [self showWarningMessage:@"昵称为6-12个字母和数字组成"];
        }
    }
        //判断password是否为空
        if ([repeatpasswordTextField1 isFirstResponder]&&[passwordTextField1.text isEqualToString:@""]) {
            [self showWarningMessage:@"密码不能为空"];
        }
    }

//通过dismiss方法来隐藏SVProgressHUD提示
- (IBAction)dismiss:(id)sender {
    [SVProgressHUD dismiss];
}

- (void)showWarningMessage:(NSString *)message{
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
    [SVProgressHUD showInfoWithStatus:message];
    [self performSelector:@selector(dismiss:) withObject:nil afterDelay:1];
}

/**
 * 跳转标签选择页面时将电话号码传过去，因为后台接口的需要
 */
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // segue.identifier：获取连线的ID
    if ([segue.identifier isEqualToString:@"gotoLabelChooseViewController"]) {
        // segue.destinationViewController：获取连线时所指的界面（VC）
        LabelChooseViewController *receive = segue.destinationViewController;
        receive.phonenumber = self.phonenumber;
        // 这里不需要指定跳转了，因为在按扭的事件里已经有跳转的代码
        //		[self.navigationController pushViewController:receive animated:YES];
    }
}
@end
