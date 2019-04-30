//
//  onSellViewController.h
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/29.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JXCategoryView/JXCategoryView.h>
#import <Masonry/Masonry.h>
#import "commodityListTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface onSellViewController : UIViewController<JXCategoryListContentViewDelegate, UITableViewDelegate, UITableViewDataSource>

@property UITableView *sellTableView;

@end

NS_ASSUME_NONNULL_END
