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
@synthesize nameTextField,passwordTextField,repeatpasswordTextField,nameTextField1,passwordTextField1,repeatpasswordTextField1,phonenumberTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",phonenumberTextField.text);
    // Do any additional setup after loading the view.
    
    /*设置三个文本框从文字之后紧接着输入*/
    nameTextField1 = [[UITextField alloc] initWithFrame:CGRectMake(40, 0, 460, 30)];
    [nameTextField addSubview:nameTextField1];
    nameTextField1.placeholder = @"6-12个字母或数字";
    nameTextField1.borderStyle = UITextBorderStyleNone;
    
    passwordTextField1 = [[UITextField alloc] initWithFrame:CGRectMake(40, 0, 460, 30)];
    [passwordTextField addSubview:passwordTextField1];
    passwordTextField1.borderStyle = UITextBorderStyleNone;
    
    repeatpasswordTextField1 = [[UITextField alloc] initWithFrame:CGRectMake(74, 0, 426, 30)];
    [repeatpasswordTextField addSubview:repeatpasswordTextField1];
    repeatpasswordTextField1.borderStyle = UITextBorderStyleNone;
    
    
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
    
}
@end
