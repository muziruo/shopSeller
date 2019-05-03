//
//  onDepotViewController.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/29.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "onDepotViewController.h"

@interface onDepotViewController ()

@property CGFloat topHeight;
@property NSArray *onDepotInfo;

@end

@implementation onDepotViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.topHeight = self.navigationController.navigationBar.frame.size.height + UIApplication.sharedApplication.statusBarFrame.size.height;
    
    self.onDepotTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.onDepotTableView.delegate = self;
    self.onDepotTableView.dataSource = self;
    
    self.onDepotTableView.estimatedRowHeight = 44.0f;
    self.onDepotTableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:self.onDepotTableView];
    
    UIEdgeInsets tableviewPadding = UIEdgeInsetsMake(0, 0, -(self.topHeight + 110), 0);
    [self.onDepotTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(tableviewPadding);
    }];
    
    [self getOnDepotInfo];
    // Do any additional setup after loading the view.
}





-(void)getOnDepotInfo {
    [AVCloud callFunctionInBackground:@"getHomeCommodity" withParameters:nil block:^(id  _Nullable object, NSError * _Nullable error) {
        if (error == nil) {
            self.onDepotInfo = object;
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.onDepotTableView reloadData];
            }];
        }
    }];
}


- (UIView *)listView {
    return self.view;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.onDepotInfo count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    commodityListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"depotCommodityCell"];
    
    if (!cell) {
        cell = [[commodityListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"depotCommodityCell"];
    }
    
    if ([self.onDepotInfo[indexPath.row] valueForKey:@"name"] != nil) {
        cell.commodityName.text = [self.onDepotInfo[indexPath.row] valueForKey:@"name"];
    }else {
        cell.commodityName.text = @"商品名称";
    }
    
    return cell;
}

@end
