//
//  shipOrderViewController.h
//  shopSeller
//
//  Created by 李祎喆 on 2019/5/3.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+themeUIColor.h"
#import "UIFont+themeUIFont.h"
#import "orderDetailTableViewCell.h"
#import <AVOSCloud/AVOSCloud.h>
#import <SVProgressHUD/SVProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface shipOrderViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *orderInfoTableview;
@property (weak, nonatomic) IBOutlet UIButton *shipCommodity;

@property NSDictionary *orderInfo;


@end

NS_ASSUME_NONNULL_END
