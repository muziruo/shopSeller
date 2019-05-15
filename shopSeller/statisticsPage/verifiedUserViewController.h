//
//  verifiedUserViewController.h
//  shopSeller
//
//  Created by 李祎喆 on 2019/5/15.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addCommodityTableViewCell.h"
#import <SVProgressHUD/SVProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@interface verifiedUserViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *userInfoTableview;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;


@end

NS_ASSUME_NONNULL_END
