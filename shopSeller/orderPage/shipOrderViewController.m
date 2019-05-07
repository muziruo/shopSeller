//
//  shipOrderViewController.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/5/3.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "shipOrderViewController.h"

@interface shipOrderViewController ()

@end

@implementation shipOrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.orderInfoTableview.rowHeight = UITableViewAutomaticDimension;
    
    self.shipCommodity.backgroundColor = UIColor.themeMainColor;
    
    [self.shipCommodity addTarget:self action:@selector(shipTheCommodity) forControlEvents:UIControlEventTouchUpInside];
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
//    首先是关于发货订单的信息
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            titleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
            
            if (!cell) {
                cell = [[titleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"titleCell"];
            }
            
            cell.title.text = @"货物信息";
            
            return cell;
        }else if (indexPath.row == 1){
            orderDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"infoCell"];
            
            if (!cell) {
                cell = [[orderDetailTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"infoCell"];
            }
            
            cell.commodityId.text = [[self.orderInfo valueForKey:@"commodity"] valueForKey:@"objectId"];
            cell.commodityName.text = [[self.orderInfo valueForKey:@"commodity"] valueForKey:@"name"];
            cell.commodityModel.text = [self.orderInfo valueForKey:@"commodityModel"];
            
            NSString *priceTitle = @"¥";
            NSString *priceString = [NSString stringWithFormat:@"%@",[self.orderInfo valueForKey:@"actualPay"]];
            priceTitle = [priceTitle stringByAppendingString:priceString];
            cell.actualPay.text = priceTitle;
            
            NSString *numberString = [NSString stringWithFormat:@"%@",[self.orderInfo valueForKey:@"number"]];
            cell.commodityNumber.text = numberString;
            
            return cell;
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            titleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
            
            if (!cell) {
                cell = [[titleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"titleCell"];
            }
            
            cell.title.text = @"送至";
            
            return cell;
        }else if (indexPath.row == 1){
            localCell *cell = [tableView dequeueReusableCellWithIdentifier:@"localCell"];
            
            if (!cell) {
                cell = [[localCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"localCell"];
            }
            
            cell.receiptNumber.text = [self.orderInfo valueForKey:@"receiptPhoneNumber"];
            cell.receiptName.text = [self.orderInfo valueForKey:@"receiptName"];
            cell.receiptLocal.text = [self.orderInfo valueForKey:@"receiptLocal"];
            
            return cell;
        }
    }
    
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15;
}


-(void)shipTheCommodity {
    [SVProgressHUD show];
    
    NSDictionary *params = @{@"orderId":[self.orderInfo valueForKey:@"objectId"],@"orderStatus":@2};
    [AVCloud callFunctionInBackground:@"shipOrder" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
        if (error == nil) {
            [SVProgressHUD showSuccessWithStatus:@"发货成功"];
            [SVProgressHUD dismissWithDelay:0.8];
            [self.navigationController popViewControllerAnimated:true];
        }
    }];
}

@end
