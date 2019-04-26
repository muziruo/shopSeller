//
//  homeTableViewController.h
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/23.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "homeTableViewCell.h"
#import "addCommodityViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface homeTableViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UIImageView *shopImage;
@property (weak, nonatomic) IBOutlet UILabel *shopName;
@property (weak, nonatomic) IBOutlet UILabel *consumerNumber;
@property (weak, nonatomic) IBOutlet UILabel *collectionNumber;
@property (weak, nonatomic) IBOutlet UILabel *salesVolume;

@end

NS_ASSUME_NONNULL_END
