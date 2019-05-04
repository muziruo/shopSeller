//
//  onSellViewController.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/29.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "onSellViewController.h"

@interface onSellViewController ()

@property NSArray *onSellInfo;

@property CGFloat topHeight;

@property UIStoryboard *mainStoryBroad;

@end

@implementation onSellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainStoryBroad = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.topHeight = self.navigationController.navigationBar.frame.size.height + UIApplication.sharedApplication.statusBarFrame.size.height;
    
    self.sellTableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    self.sellTableView.delegate = self;
    self.sellTableView.dataSource = self;
    
    self.sellTableView.estimatedRowHeight = 44.0f;
    self.sellTableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:self.sellTableView];
    UIEdgeInsets tableviewPadding = UIEdgeInsetsMake(0, 0, - (self.topHeight + 110), 0);
    [self.sellTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(tableviewPadding);
    }];
    
    [self getOnSellInfo];
    // Do any additional setup after loading the view.
}


-(void)getOnSellInfo {
    [AVCloud callFunctionInBackground:@"getHomeCommodity" withParameters:nil block:^(id  _Nullable object, NSError * _Nullable error) {
        if (error == nil) {
            self.onSellInfo = object;
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.sellTableView reloadData];
            }];
        }
    }];
}


- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"界面显示");
    [self getOnSellInfo];
}


//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 44;
//}


- (UIView *)listView {
    return self.view;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.onSellInfo count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    commodityListTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"sellCommodityCell"];
    
    if (!cell) {
        cell = [[commodityListTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"sellCommodityCell"];
    }
    
    if ([self.onSellInfo[indexPath.row] valueForKey:@"name"] != nil) {
        cell.commodityName.text = [self.onSellInfo[indexPath.row] valueForKey:@"name"];
    }else {
        cell.commodityName.text = @"商品名称";
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    editCommodityViewController *editView = [self.mainStoryBroad instantiateViewControllerWithIdentifier:@"editCommodityView"];
    
    editView.commodityInfo = self.onSellInfo[indexPath.row];
    
    [[self getCurrentVC].navigationController pushViewController:editView animated:true];
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

@end
