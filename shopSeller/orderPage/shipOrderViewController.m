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
            
            cell.commodityId.text = @"ajofaheoiaofaoshdfsa";
            cell.commodityName.text = @"名称名称名称名称名称名称名称名称名称名称名称名称名称名称";
            cell.commodityModel.text = @"型号";
            cell.actualPay.text = @"¥2333";
            cell.commodityNumber.text = @"3";
            
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
            
            cell.receiptNumber.text = @"15908665907";
            cell.receiptName.text = @"木子";
            cell.receiptLocal.text = @"湖北省武汉市武汉理工大学余家头校区";
            
            return cell;
        }
    }
    
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15;
}

@end
