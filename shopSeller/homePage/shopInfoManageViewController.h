//
//  shopInfoManageViewController.h
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/29.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addCommodityTableViewCell.h"
#import <AVOSCloud/AVOSCloud.h>
#import <SVProgressHUD/SVProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface shopInfoManageViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *shopInfoTableView;
@property (weak, nonatomic) IBOutlet UIButton *saveInfo;


@property NSDictionary *shopInfo;

@end

NS_ASSUME_NONNULL_END
