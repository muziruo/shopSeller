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
@property UIStoryboard *mainStoryBroad;
@property NSUserDefaults *userSetting;

@end

@implementation onDepotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.userSetting = [NSUserDefaults standardUserDefaults];
    
    self.mainStoryBroad = [UIStoryboard storyboardWithName:@"Main" bundle:nil];

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
    
    self.onDepotTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(getOnDepotInfo)];
    
    //[self getOnDepotInfo];
    [self.onDepotTableView.mj_header beginRefreshing];
    // Do any additional setup after loading the view.
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
    
    editCommodityViewController *editView = [self.mainStoryBroad instantiateViewControllerWithIdentifier:@"editCommodityView"];
    
    editView.commodityInfo = self.onDepotInfo[indexPath.row];
    
    //editView.delegate = self;
    
    [[self getCurrentVC].navigationController pushViewController:editView animated:true];
}


-(void)getOnDepotInfo {
    NSDictionary *params = @{
                             @"shopId":[self.userSetting valueForKey:@"shopId"],
                             @"isSell":@0
                             };
    [AVCloud callFunctionInBackground:@"shopGetCommodity" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
        if (error == nil) {
            if ([[object valueForKey:@"success"] boolValue]) {
                self.onDepotInfo = [object valueForKey:@"result"];
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self.onDepotTableView reloadData];
                    [self.onDepotTableView.mj_header endRefreshing];
                }];
            }
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


- (UIViewController *)getCurrentVC {
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    
    return currentVC;
}

- (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC {
    UIViewController *currentVC;
    
    if ([rootVC presentedViewController]) {
        // 视图是被presented出来的
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        // 根视图为UITabBarController
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        // 根视图为UINavigationController
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        // 根视图为非导航类
        currentVC = rootVC;
    }
    return currentVC;
}


- (void)refreshSellInfo {
    [self.onDepotTableView.mj_header beginRefreshing];
}

- (void)listDidAppear {
    [self.onDepotTableView.mj_header beginRefreshing];
}

@end
