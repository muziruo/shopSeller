//
//  editCommodityViewController.h
//  shopSeller
//
//  Created by 李祎喆 on 2019/5/4.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "orderDetailTableViewCell.h"
#import "commodityListTableViewCell.h"
#import "addCommodityTableViewCell.h"
#import <AVOSCloud/AVOSCloud.h>
#import <SDWebImage/SDWebImage.h>
#import "addModelViewController.h"
#import <TZImagePickerController/TZImagePickerController.h>

NS_ASSUME_NONNULL_BEGIN

@interface editCommodityViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, addModelViewControllerDelegate, TZImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UITableView *editTableview;
@property (weak, nonatomic) IBOutlet UIButton *saveInfo;

@property NSDictionary *commodityInfo;

@property NSInteger imageNumber;

@end

NS_ASSUME_NONNULL_END
