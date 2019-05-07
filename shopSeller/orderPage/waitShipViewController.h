//
//  waitShipViewController.h
//  shopSeller
//
//  Created by 李祎喆 on 2019/5/3.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "orderTableViewCell.h"
#import <AVOSCloud/AVOSCloud.h>
#import "shipOrderViewController.h"
#import <MJRefresh/MJRefresh.h>

NS_ASSUME_NONNULL_BEGIN

@interface waitShipViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *orderTableview;


@end

NS_ASSUME_NONNULL_END
