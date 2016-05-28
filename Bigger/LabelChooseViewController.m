//
//  LabelChooseViewController.m
//  Bigger
//
//  Created by Huang on 16/5/16.
//  Copyright © 2016年 Huang. All rights reserved.
//

#import "LabelChooseViewController.h"

@interface LabelChooseViewController ()

@end

@implementation LabelChooseViewController
@synthesize phonenumber,labellist;

- (void)viewDidLoad {
    [super viewDidLoad];
    phonenumber = [NSString stringWithFormat:@"233"];
    labellist = [[NSMutableString alloc] initWithString:@""];
    
    //NSLog(@"%@",phonenumber);
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

- (IBAction)labelchooseButtonDidPress:(UIButton *)Button{
    
    if (Button.backgroundColor != [UIColor lightGrayColor]) {
        [labellist appendFormat:@"%@，",Button.titleLabel.text];
        Button.backgroundColor = [UIColor lightGrayColor];
        //NSLog(@"%@",labellist);
    }else{
        [self deleteString:Button.titleLabel.text fromString:labellist];
        Button.backgroundColor = [UIColor whiteColor];
        //NSLog(@"%@",labellist);
    }
}

- (IBAction)completeButtonDidPress:(id)sender {
    if ([labellist isEqualToString:@""]) {
        [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeBlack];
        [SVProgressHUD showInfoWithStatus:@"至少添加一个标签"];
        [self performSelector:@selector(dismiss:) withObject:nil afterDelay:1];
    }else{
        [self getAddLabelResult];
    }
}
/**
 *    删除用户不想添加的标签
 */
- (void)deleteString:(NSString *)str fromString:(NSMutableString *)mstr{
    NSRange range = [mstr rangeOfString:str];
    range.length++;
    [mstr deleteCharactersInRange:range];
}

/**
 *   从服务器获取标签添加结果
 */
-(void)getAddLabelResult{
    //1.请求管理者
    AFHTTPSessionManager *mgr = [AFHTTPSessionManager manager];
    AFSecurityPolicy *securitypolicy = [AFSecurityPolicy defaultPolicy];
    securitypolicy.allowInvalidCertificates = YES;
    mgr.securityPolicy = securitypolicy;
    
    //2.后台登录接口
    //刪除最后一个逗号
    labellist = (NSMutableString *)[labellist substringToIndex:(labellist.length-1)];
    //请求中含有中文时会报错
    NSURL *URL = [NSURL URLWithString:[[BiggerServerAPITools AddLabelUserphone:phonenumber Userlabel:labellist] stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
    
    //3.发送一个POST请求
    [mgr POST:[URL absoluteString] parameters:nil progress:^(NSProgress *uploadProgress) {
    }  success:^(NSURLSessionDataTask *operation, id responseObject){
        NSLog(@"请求成功%@", responseObject);
        //获得返回的json值，返回值只包含code
        NSDictionary *dictionary = (NSDictionary *)responseObject;
        // NSLog(@"%@",dictionary);
        //截取code值
        NSInteger result = [self getAddLabelResult:dictionary];
        
        switch (result) {
            case ACCONUTNOTEXIST:{
                NSLog(@"fail");
                //弹出失败提示框
                UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"用户不存在" preferredStyle:UIAlertControllerStyleAlert];
                UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:nil];
                [alert addAction:cancel];
                [self presentViewController:alert animated:YES completion:nil];
                break;
            }
            case ADDSUCCESS:{
                NSLog(@"success");
                //跳转到首页
                
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
//从返回判断标签添加状态
-(NSInteger)getAddLabelResult:(NSDictionary*)dictionary{
    
    NSArray *array = [NSArray arrayWithObject:dictionary[@"code"]];
    NSString *result =[[NSString stringWithFormat:@"%@",array] substringWithRange:NSMakeRange(6, 3)];
    return [result integerValue];
}
//通过dismiss方法来隐藏SVProgressHUD提示
- (IBAction)dismiss:(id)sender {
    [SVProgressHUD dismiss];
}
@end
