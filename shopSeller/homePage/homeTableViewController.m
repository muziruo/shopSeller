//
//  homeTableViewController.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/23.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "homeTableViewController.h"

@interface homeTableViewController ()

@property NSArray *functionName;
@property UIStoryboard *mainStoryBroad;
@property NSUserDefaults *userSetting;

@end

@implementation homeTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainStoryBroad = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.navigationController.navigationBar.barTintColor = UIColor.themeMainColor;
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    self.functionName = @[@"店铺信息管理",@"商品管理",@"评价信息",@"客户"];
    
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getShopInfo)];
    
    //[self getShopInfo];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (void)viewDidAppear:(BOOL)animated {
    if ([AVUser currentUser] == nil) {
        loginViewController *loginView = [self.mainStoryBroad instantiateViewControllerWithIdentifier:@"loginView"];
        [self presentViewController:loginView animated:true completion:nil];
    }else{
        [self.tableView.mj_header beginRefreshing];
    }
}


-(void)getShopInfo {
    
    NSDictionary *params = @{@"userId":[AVUser currentUser].objectId};
    [AVCloud callFunctionInBackground:@"getShopInfo" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
        if (error == nil) {
            if ([[object valueForKey:@"success"] boolValue]) {
                self.shopInfo = [object valueForKey:@"results"][0];
                [self.userSetting setValue:[self.shopInfo valueForKey:@"objectId"] forKey:@"shopId"];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    NSURL *imageUrl = [NSURL URLWithString:[self.shopInfo valueForKey:@"logoUrl"]];
                    [self.shopImage sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"imageReplace-s"]];
                    self.shopName.text = [self.shopInfo valueForKey:@"name"];
                    [SVProgressHUD dismiss];
                    [self.tableView.mj_header endRefreshing];
                }];
            }else {
                [SVProgressHUD showErrorWithStatus:@"未找到店铺信息，请重新登录"];
                [SVProgressHUD dismissWithDelay:2.0];
                [self.tableView.mj_header endRefreshing];
                [AVUser logOut];
                loginViewController *loginView = [self.mainStoryBroad instantiateViewControllerWithIdentifier:@"loginView"];
                [self presentViewController:loginView animated:true completion:nil];
            }
        }else {
            
        }
    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.functionName count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    homeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"functionCell"];
    
    if (!cell) {
        cell = [[homeTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"functionCell"];
    }
    
    cell.functionTitle.text = self.functionName[indexPath.row];
    cell.functionImage.image = [UIImage imageNamed:@"gongneng"];
    
    return cell;
}



- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    if (indexPath.row == 0) {
        shopInfoManageViewController *shopInfoView = [self.mainStoryBroad instantiateViewControllerWithIdentifier:@"shopInfoView"];
        shopInfoView.shopInfo = self.shopInfo;
        [self.navigationController pushViewController:shopInfoView animated:true];
    }else if (indexPath.row == 1){
        commodityListViewController *listView = [self.mainStoryBroad instantiateViewControllerWithIdentifier:@"commodityListView"];
        [self.navigationController pushViewController:listView animated:true];
    }
}



- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [[UIView alloc] initWithFrame:CGRectZero];
}



/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
