//
//  statisticsTableViewController.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/23.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "statisticsTableViewController.h"

@interface statisticsTableViewController ()

@property UIStoryboard *mainStoryBroad;

@end

@implementation statisticsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationBar.barTintColor = UIColor.themeMainColor;
    
    self.mainStoryBroad = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        functionButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"functionCell"];
        
        if (!cell) {
            cell = [[functionButtonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"functionCell"];
        }
        
        [cell.functionButton setTitle:@"实名认证" forState:UIControlStateNormal];
        
        cell.functionButton.backgroundColor = UIColor.themeMainColor;
        
        [cell.functionButton addTarget:self action:@selector(userVerified) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }else if (indexPath.row == 1){
        functionButtonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"functionCell"];
        
        if (!cell) {
            cell = [[functionButtonCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"functionCell"];
        }
        
        [cell.functionButton addTarget:self action:@selector(userLogout) forControlEvents:UIControlEventTouchUpInside];
        
        return cell;
    }
    return nil;
}


-(void)userLogout {
    [AVUser logOut];
    loginViewController *loginView = [self.mainStoryBroad instantiateViewControllerWithIdentifier:@"loginView"];
    [self presentViewController:loginView animated:true completion:nil];
}

-(void)userVerified {
    verifiedUserViewController *verifiedView = [self.mainStoryBroad instantiateViewControllerWithIdentifier:@"userVerifiedView"];
    [self.navigationController pushViewController:verifiedView animated:true];
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
