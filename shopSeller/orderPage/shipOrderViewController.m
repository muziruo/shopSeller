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
    
    self.shipCommodity.backgroundColor = UIColor.themeMainColor;
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}

@end
