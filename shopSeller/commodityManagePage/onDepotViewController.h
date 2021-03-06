//
//  onDepotViewController.h
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/29.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JXCategoryView/JXCategoryView.h>
#import "commodityListTableViewCell.h"
#import <AVOSCloud/AVOSCloud.h>
#import <Masonry/Masonry.h>
#import "editCommodityViewController.h"
#import <MJRefresh/MJRefresh.h>

NS_ASSUME_NONNULL_BEGIN

@interface onDepotViewController : UIViewController<JXCategoryListContentViewDelegate, UITableViewDelegate, UITableViewDataSource, editCommodityViewControllerdelegate>

@property UITableView *onDepotTableView;

@end

NS_ASSUME_NONNULL_END
