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

@end

@implementation onDepotViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topHeight = self.navigationController.navigationBar.frame.size.height + UIApplication.sharedApplication.statusBarFrame.size.height;
    // Do any additional setup after loading the view.
}

- (UIView *)listView {
    return self.view;
}

@end
