//
//  waitShipViewController.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/5/3.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "waitShipViewController.h"

@interface waitShipViewController ()

@property NSArray *orderInfo;
@property UIStoryboard *mainStoryBroad;
@property NSUserDefaults *userSetting;
@property NSNumber *page;

@end

@implementation waitShipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userSetting = [NSUserDefaults standardUserDefaults];
    
    self.mainStoryBroad = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.orderTableview.rowHeight = UITableViewAutomaticDimension;
    
    self.orderTableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getShipOrderInfo)];
    self.orderTableview.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(getMoreShipOrderInfo)];
    
    self.page = @1;
    
    [self.orderTableview.mj_header beginRefreshing];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated {
    
}


-(void)getShipOrderInfo {
    
    NSDictionary *params = @{
                             @"shopId":[self.userSetting valueForKey:@"shopId"],
                             @"page":@0
                             };
    [AVCloud callFunctionInBackground:@"shopGetShipOrder" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
        if (error == nil) {
            if ([object valueForKey:@"success"]) {
                self.orderInfo = [object valueForKey:@"result"];
                self.page = @1;
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self.orderTableview reloadData];
                    [self.orderTableview.mj_header endRefreshing];
                }];
            }else {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self.orderTableview reloadData];
                    [self.orderTableview.mj_header endRefreshing];
                }];
                [SVProgressHUD showErrorWithStatus:@"获取信息失败，请重新刷新"];
                [SVProgressHUD dismissWithDelay:2.0];
            }
        }else{
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.orderTableview reloadData];
                [self.orderTableview.mj_header endRefreshing];
            }];
            [SVProgressHUD showErrorWithStatus:@"获取信息失败，请重新刷新"];
            [SVProgressHUD dismissWithDelay:2.0];
        }
    }];
}



-(void)getMoreShipOrderInfo {
    
    NSDictionary *params = @{
                             @"shopId":[self.userSetting valueForKey:@"shopId"],
                             @"page":self.page
                             };
    [AVCloud callFunctionInBackground:@"shopGetShipOrder" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
        if (error == nil) {
            if ([object valueForKey:@"success"]) {
                [self.orderInfo arrayByAddingObjectsFromArray:[object valueForKey:@"result"]];
                int nextPage = self.page.intValue + 1;
                self.page = [NSNumber numberWithInt:nextPage];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self.orderTableview reloadData];
                    [self.orderTableview.mj_footer endRefreshing];
                }];
            }else {
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self.orderTableview reloadData];
                    [self.orderTableview.mj_footer endRefreshing];
                }];
                [SVProgressHUD showErrorWithStatus:@"获取信息失败，请重新刷新"];
                [SVProgressHUD dismissWithDelay:2.0];
            }
        }else{
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.orderTableview reloadData];
                [self.orderTableview.mj_footer endRefreshing];
            }];
            [SVProgressHUD showErrorWithStatus:@"获取信息失败，请重新刷新"];
            [SVProgressHUD dismissWithDelay:2.0];
        }
    }];
}




- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.orderInfo count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    orderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderCell"];
    
    if (!cell) {
        cell = [[orderTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"orderCell"];
    }
    
    cell.commodityName.text = [[self.orderInfo[indexPath.row] valueForKey:@"commodity"] valueForKey:@"name"];
    
    cell.commodityModel.text = [self.orderInfo[indexPath.row] valueForKey:@"commodityModel"];
    
    return cell;
    
    return nil;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    shipOrderViewController *orderView = [self.mainStoryBroad instantiateViewControllerWithIdentifier:@"shipView"];
    orderView.orderInfo = self.orderInfo[indexPath.row];
    [self.navigationController pushViewController:orderView animated:true];
}

@end
