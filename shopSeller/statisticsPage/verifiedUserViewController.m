//
//  verifiedUserViewController.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/5/15.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "verifiedUserViewController.h"

@interface verifiedUserViewController ()

@property NSArray *verifiedInfoTitle;
@property NSArray *verifiedInfoTip;

@end

@implementation verifiedUserViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.verifiedInfoTitle = @[@"真实姓名",@"身份证号"];
    self.verifiedInfoTip = @[@"请输入真实姓名(必填)",@"请输入身份证号(必填)"];
    
    self.userInfoTableview.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [self.sureButton addTarget:self action:@selector(verifiedUserInfo) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectZero];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    addCommodityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"verifiedCell"];
    
    if (!cell) {
        cell = [[addCommodityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"verifiedCell"];
    }
    
    cell.inputTitle.text = self.verifiedInfoTitle[indexPath.row];
    cell.inputInfo.placeholder = self.verifiedInfoTip[indexPath.row];
    
    cell.inputInfo.tag = 101 + indexPath.row;
    
    return cell;
}

-(void)verifiedUserInfo {
    UITextField *nameInput = [self.view viewWithTag:101];
    UITextField *codeInput = [self.view viewWithTag:102];
    
    NSString *userName = nameInput.text;
    NSString *userCode = codeInput.text;
    
    if ([userName isEqualToString:@" "]) {
        [SVProgressHUD showErrorWithStatus:@"请输入姓名"];
        [SVProgressHUD dismissWithDelay:1.0];
        return;
    }
    if ([userCode isEqualToString:@" "]) {
        [SVProgressHUD showErrorWithStatus:@"请输入身份证号"];
        [SVProgressHUD dismissWithDelay:1.0];
        return;
    }
    
    NSString *codeName = [userName stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    
    NSString *appcode = @"99e8b5ac2c064ddea3c02f075964e35e";
    NSString *host = @"http://aliyunverifyidcard.haoservice.com";
    NSString *path = @"/idcard/VerifyIdcardv2";
    NSString *method = @"GET";
    //NSString *querys = @"?cardNo=330329199001020022&realName=%E5%BC%A0%E4%B8%89";
    NSString *querys = [NSString stringWithFormat:@"?cardNo=%@&realName=%@",userCode,codeName];
    NSLog(@"编码后的请求数据为%@",querys);
    //return;
    
    NSString *url = [NSString stringWithFormat:@"%@%@%@",  host,  path , querys];
    NSString *bodys = @"";
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString: url]  cachePolicy:1  timeoutInterval:  5];
    request.HTTPMethod  =  method;
    [request addValue:  [NSString  stringWithFormat:@"APPCODE %@" ,  appcode]  forHTTPHeaderField:  @"Authorization"];
    NSURLSession *requestSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [requestSession dataTaskWithRequest:request completionHandler:^(NSData * _Nullable body , NSURLResponse * _Nullable response, NSError * _Nullable error) {
       NSLog(@"Response object: %@" , response);
       NSString *bodyString = [[NSString alloc] initWithData:body encoding:NSUTF8StringEncoding];
       
        NSDictionary *infoDic = [NSJSONSerialization JSONObjectWithData:body options:NSJSONReadingMutableContainers|NSJSONReadingAllowFragments error:nil];
        
        NSLog(@"字典数据%@",infoDic);
        
        if ([[[infoDic valueForKey:@"result"] valueForKey:@"isok"] boolValue]) {
            [SVProgressHUD showSuccessWithStatus:@"认证成功"];
            [SVProgressHUD dismissWithDelay:1.0];
        }
        
        [self.navigationController popViewControllerAnimated:true];
       //打印应答中的body
       NSLog(@"Response body: %@" , bodyString);
   }];
    
    [task resume];
}

@end
