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

@end

@implementation waitShipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userSetting = [NSUserDefaults standardUserDefaults];
    
    self.mainStoryBroad = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.orderTableview.rowHeight = UITableViewAutomaticDimension;
    
    self.orderTableview.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getShipOrderInfo)];
    // Do any additional setup after loading the view.
}


- (void)viewWillAppear:(BOOL)animated {
    [self.orderTableview.mj_header beginRefreshing];
}


-(void)getShipOrderInfo {
    NSDictionary *params = @{@"shopId":[self.userSetting valueForKey:@"shopId"]};
    [AVCloud callFunctionInBackground:@"shopGetShipOrder" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
        if (error == nil) {
            if ([object valueForKey:@"success"]) {
                self.orderInfo = [object valueForKey:@"result"];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self.orderTableview reloadData];
                    [self.orderTableview.mj_header endRefreshing];
                }];
            }
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
