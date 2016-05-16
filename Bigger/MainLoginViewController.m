//
//  MainLoginViewControllor.m
//  Bigger
//
//  Created by Huang on 16/5/8.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import "MainLoginViewController.h"

@interface MainLoginViewController ()

@end

@implementation MainLoginViewController

//从返回判断登陆状态
-(NSInteger)getLoginResult:(NSDictionary*)dictionary{
    NSArray *array = [NSArray arrayWithObject:dictionary[@"code"]];
    NSString *result =[ [NSString stringWithFormat:@"%@",array] substringWithRange:NSMakeRange(6, 3)];
    return [result integerValue];
}

//从服务器获取结果
-(NSDictionary *)getAccountResult:(NSString *)accountNumber andPassword:(NSString*)password{
    NSString *finalUrl = [NSString stringWithFormat:@"http://120.24.6.232:15000/Bigger/UserLogin.action?userphone=%@&password=%@",accountNumber,password];
    NSURL *url = [NSURL URLWithString:finalUrl];
    
    // 2.封装请求
    NSURLRequest *request = [NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReturnCacheDataElseLoad timeoutInterval:10];
    
    // 3.发送请求
    NSURLResponse *response = nil;
    NSError *error = nil;
    // 该方法在iOS9.0之后被废弃
    // 下面的方法有3个参数，参数分别为NSURLRequest，NSURLResponse**，NSError**，后面两个参数之所以传地址进来是为了在执行该方法的时候在方法的内部修改参数的值。这种方法相当于让一个方法有了多个返回值
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    // 错误信息
    if(error)
    {
        NSLog(@"%@", [error localizedDescription]);
        // 此处需要解决iOS9.0之后，HTTP不能正常使用的问题，若不做任何处理，会打印“The resource could not be loaded because the App Transport Security policy requires the use of a secure connection” 错误信息。
    }
    NSError *newError = nil;
    
    NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&newError];
    // 获取对应的数据信息
        NSArray *array = dictionary[@"code"];
        return dictionary;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
       // Do any additional setup after loading the view from its nib.
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





- (IBAction)loginButtonDidPress:(id)sender {
    NSDictionary *resultDictionary = [self getAccountResult:self.phonenumberTextField.text andPassword:self.passwordTextField.text];
//    NSLog(resultDictionary);
    NSInteger result = [self getLoginResult:resultDictionary];
    
    switch (result) {
        case LOGINSUCCESS:
            NSLog(@"success");
            break;
        case WRONGPASSWORD:
            [self doErrorMessage];
            break;
        case  ILLEGALACCOUNT:
            NSLog(@"IllegalAccount");
            break;
        default:
            break;
    }
}

- (IBAction)forgetpasswordButtonDidPress:(id)sender {
    [self performSegueWithIdentifier:@"goToForgetPasswordViewController" sender:self];
}

- (IBAction)registerButtonDidPress:(id)sender {
}

- (IBAction)browseButtonDidPress:(id)sender {
}

//登录失败的弹窗
-(void)doErrorMessage{
    [HHAlertView showAlertWithStyle:HHAlertStyleError inView:self.view Title:@"登录失败" detail:@"账户或密码错误" cancelButton:nil Okbutton:@"我知道了"];
}




@end
