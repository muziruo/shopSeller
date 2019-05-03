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
#import <TZImagePickerController/TZImagePickerController.h>
//#import <SDCycleScrollView/SDCycleScrollView.h>

NS_ASSUME_NONNULL_BEGIN

@interface addCommodityViewController : UIViewController<UITableViewDelegate, UITableViewDataSource, TZImagePickerControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *addDepot;
@property (weak, nonatomic) IBOutlet UIButton *addSell;
@property (weak, nonatomic) IBOutlet UIView *selectImage;

@property (weak, nonatomic) IBOutlet UITableView *addCommodityTableview;


//@property SDCycleScrollView *pickedImage;


@end

NS_ASSUME_NONNULL_END
