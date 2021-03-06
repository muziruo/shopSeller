//
//  listViewController.m
//  shopUser
//
//  Created by 李祎喆 on 2019/4/18.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "listViewController.h"

@interface listViewController ()

@property NSUserDefaults *userSetting;

@end

@implementation listViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.userSetting = [NSUserDefaults standardUserDefaults];
    
    self.accountInput = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectMake(40, 20, self.view.frame.size.width - 80, 50)];
    UIView *accountLine = [[UIView alloc] initWithFrame:CGRectMake(40, self.accountInput.frame.origin.y + 50, self.accountInput.frame.size.width, 1)];
    accountLine.backgroundColor = UIColor.blackColor;
    self.accountInput.placeholder = @"手机号";
//    限制输入
    self.accountInput.keyboardType = UIKeyboardTypeNumberPad;
    self.accountInput.floatingLabelTextColor = UIColor.themeMainColor;
    
    self.passwordInput = [[JVFloatLabeledTextField alloc] initWithFrame:CGRectMake(40, accountLine.frame.origin.y + 30, self.accountInput.frame.size.width, 50)];
    UIView *passwordLine = [[UIView alloc] initWithFrame:CGRectMake(40, self.passwordInput.frame.origin.y + 50, self.accountInput.frame.size.width, 1)];
    passwordLine.backgroundColor = UIColor.blackColor;
    self.passwordInput.placeholder = @"密码";
//    限制输入
    self.passwordInput.keyboardType = UIKeyboardTypeASCIICapable;
    
    self.passwordInput.floatingLabelTextColor = UIColor.themeMainColor;
    
    self.loginButton = [[UIButton alloc] initWithFrame:CGRectMake(60, self.view.frame.size.height - 220, self.view.frame.size.width - 120, 50)];
    self.loginButton.layer.cornerRadius = 25;
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    [self.loginButton.titleLabel setFont:UIFont.normalFont];
    self.loginButton.backgroundColor = UIColor.themeMainColor;
    self.loginButton.tintColor = UIColor.whiteColor;
    [self.loginButton addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:self.accountInput];
    [self.view addSubview:self.passwordInput];
    [self.view addSubview:passwordLine];
    [self.view addSubview:accountLine];
    [self.view addSubview:self.loginButton];
    // Do any additional setup after loading the view.
}

- (UIView *)listView {
    return self.view;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

//请在此配置具体的网络登录操作
- (void)login {
    //    数据判断
    if ([self.accountInput.text  isEqual: @""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入手机号"];
        [SVProgressHUD dismissWithDelay:0.8];
        return;
    }
    if ([self.passwordInput.text  isEqual: @""]) {
        [SVProgressHUD showErrorWithStatus:@"请输入密码"];
        [SVProgressHUD dismissWithDelay:0.8];
        return;
    }
    
    
//    网络登录操作
    [AVUser logInWithMobilePhoneNumberInBackground:self.accountInput.text password:self.passwordInput.text block:^(AVUser * _Nullable user, NSError * _Nullable error) {
        if (error == nil) {

            NSDictionary *params = @{@"userId":user.objectId};
            [AVCloud callFunctionInBackground:@"ifshop" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
                if (error == nil) {
                    if ([[object valueForKey:@"success"] boolValue]) {
                        [self.userSetting setValue:[[object valueForKey:@"result"] valueForKey:@"objectId"] forKey:@"shopId"];
                        [SVProgressHUD showSuccessWithStatus:@"登录成功"];
                        [SVProgressHUD dismissWithDelay:1.0];
                        [[self getCurrentVC] dismissViewControllerAnimated:true completion:nil];
                    }else{
                        
                        NSDictionary *params = @{
                                                 @"userId":[AVUser currentUser].objectId,
                                                 @"name":@"一个新店",
                                                 @"info":@"店主还未写介绍呢"
                                                 };
                        [AVCloud callFunctionInBackground:@"createShop" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
                            if (error == nil) {
                                if ([[object valueForKey:@"success"] boolValue]) {
                                    [SVProgressHUD showSuccessWithStatus:@"登录成功"];
                                    [SVProgressHUD dismissWithDelay:1.0];
                                    [self.userSetting setValue:[[object valueForKey:@"result"] valueForKey:@"objectId"] forKey:@"shopId"];
                                    [[self getCurrentVC] dismissViewControllerAnimated:true completion:nil];
                                }
                            }else {
                                [SVProgressHUD showSuccessWithStatus:@"已注册成功"];
                                [SVProgressHUD dismissWithDelay:1.0];
                                [[self getCurrentVC] dismissViewControllerAnimated:true completion:nil];
                            }
                        }];
                        
                    }
                }else {
                    [SVProgressHUD showSuccessWithStatus:@"登录成功"];
                    [SVProgressHUD dismissWithDelay:1.0];
                    [[self getCurrentVC] dismissViewControllerAnimated:true completion:nil];
                }
            }];
        }else{
            if (error.code == 211) {
                [SVProgressHUD showErrorWithStatus:@"找不到用户"];
                [SVProgressHUD dismissWithDelay:1.0];
            }else if (error.code == 210){
                [SVProgressHUD showErrorWithStatus:@"用户名或密码错误"];
                [SVProgressHUD dismissWithDelay:1.0];
            }
        }
    }];
    
    //[self.userSetting setBool:true forKey:@"isLogin"];
    
}

- (UIViewController *)getCurrentVC {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC {
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    return currentVC;
}

@end
