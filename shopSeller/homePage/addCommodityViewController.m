//
//  addCommodityViewController.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/26.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "addCommodityViewController.h"

@interface addCommodityViewController ()

@end

@implementation addCommodityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addSell.backgroundColor = UIColor.stressColor;
    self.addDepot.backgroundColor = UIColor.themeMainColor;
    // Do any additional setup after loading the view.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            addCommodityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addInfoCell"];
            
            if (!cell) {
                cell = [[addCommodityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addInfoCell"];
            }
            
            cell.inputTitle.text = @"商品名称";
            
            return cell;
        }else if (indexPath.row == 1){
            addDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addDetailCell"];
            
            if (!cell) {
                cell = [[addDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addDetailCell"];
            }
            
            cell.inputTitle.text = @"商品介绍";
            
            return cell;
        }
    }
    return nil;
}

@end
