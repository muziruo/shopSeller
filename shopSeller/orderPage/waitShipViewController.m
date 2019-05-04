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

@end

@implementation waitShipViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainStoryBroad = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    [self.navigationController setTitle:@"待发货订单"];
    
    self.orderTableview.rowHeight = UITableViewAutomaticDimension;
    
    [self getShipOrderInfo];
    // Do any additional setup after loading the view.
}


-(void)getShipOrderInfo {
    NSDictionary *params = @{@"shopId":@"5cc1218ad5de2b007361e392"};
    [AVCloud callFunctionInBackground:@"shopGetShipOrder" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
        if (error == nil) {
            if ([object valueForKey:@"success"]) {
                self.orderInfo = [object valueForKey:@"result"];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self.orderTableview reloadData];
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
    [self.navigationController pushViewController:orderView animated:true];
}

@end
