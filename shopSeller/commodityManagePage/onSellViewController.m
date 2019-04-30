//
//  onSellViewController.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/29.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "onSellViewController.h"

@interface onSellViewController ()

@property CGFloat topHeight;

@end

@implementation onSellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topHeight = self.navigationController.navigationBar.frame.size.height + UIApplication.sharedApplication.statusBarFrame.size.height;
    
    self.sellTableView = [[UITableView alloc] init];
    self.sellTableView.delegate = self;
    self.sellTableView.dataSource = self;
    self.sellTableView.rowHeight = UITableViewAutomaticDimension;
    [self.view addSubview:self.sellTableView];
    UIEdgeInsets tableviewPadding = UIEdgeInsetsMake(0, 0, - (self.topHeight + 70), 0);
    [self.sellTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(tableviewPadding);
    }];
    // Do any additional setup after loading the view.
}

- (UIView *)listView {
    return self.view;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    commodityListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sellCommodityCell"];
    
    if (!cell) {
        cell = [[commodityListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sellCommodityCell"];
    }
    
    cell.commodityName.text = @"商品名称";
    
    return cell;
}

@end
