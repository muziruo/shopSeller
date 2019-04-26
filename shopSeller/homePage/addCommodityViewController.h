//
//  addCommodityViewController.h
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/26.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+themeUIColor.h"
#import "UIFont+themeUIFont.h"
#import "addCommodityTableViewCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface addCommodityViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *addDepot;
@property (weak, nonatomic) IBOutlet UIButton *addSell;
@property (weak, nonatomic) IBOutlet UIView *selectImage;


@end

NS_ASSUME_NONNULL_END
