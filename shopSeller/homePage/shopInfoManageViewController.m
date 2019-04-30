//
//  shopInfoManageViewController.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/29.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "shopInfoManageViewController.h"

@interface shopInfoManageViewController ()

@property NSArray *shopDetailInfo;

@end

@implementation shopInfoManageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.shopDetailInfo = @[@"店铺名称",@"店铺介绍"];
    
    self.saveInfo.backgroundColor = UIColor.themeMainColor;
    
    self.shopInfoTableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    [self.saveInfo addTarget:self action:@selector(saveShopInfo) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}


//待测试
-(void)saveShopInfo {
//    NSString *shopNameInfo = [[NSString alloc] init];
//    NSString *shopDetailInfo = [[NSString alloc] init];
    
    UITextField *shopNameInput = [self.view viewWithTag:101];
    UITextView *shopInfoInput = [self.view viewWithTag:102];
    
    NSDictionary *params = @{@"shopId":@"5cc1218ad5de2b007361e392",@"shopName":shopNameInput.text,@"shopInfo":shopInfoInput.text};
    [AVCloud callFunctionInBackground:@"saveShopInfo" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
        if (error == nil) {
            if ([object valueForKey:@"success"]) {
                [SVProgressHUD showSuccessWithStatus:@"修改成功"];
                [SVProgressHUD dismissWithDelay:0.8];
                [self.navigationController popViewControllerAnimated:true];
            }
        }
    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.shopDetailInfo count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        addCommodityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopInfoCell"];
        
        if (!cell) {
            cell = [[addCommodityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"shopInfoCell"];
        }
        
        cell.inputTitle.text = @"店铺名称";
        cell.inputInfo.text = [self.shopInfo valueForKey:@"name"];
        cell.inputInfo.font = UIFont.normalFontLight;
        cell.inputInfo.tag = 101 + indexPath.row;
        
        return cell;
    }else if (indexPath.row == 1){
        addDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"shopDetailCell"];
        
        if (!cell) {
            cell = [[addDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"shopDetailCell"];
        }
        
        cell.inputTitle.text = @"店铺介绍";
        cell.inputInfo.text = [self.shopInfo valueForKey:@"info"];
        cell.inputInfo.font = UIFont.normalFontLight;
        cell.inputInfo.tag = 101 + indexPath.row;
        
        return cell;
    }
    return nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectZero];
}

@end
