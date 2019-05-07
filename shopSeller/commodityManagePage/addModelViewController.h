//
//  addModelViewController.h
//  shopSeller
//
//  Created by 李祎喆 on 2019/5/4.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "addCommodityTableViewCell.h"
#import <AVOSCloud/AVOSCloud.h>
#import <SVProgressHUD/SVProgressHUD.h>

NS_ASSUME_NONNULL_BEGIN

@protocol addModelViewControllerDelegate <NSObject>

-(void)addedModel;

@end

@interface addModelViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic,weak) id<addModelViewControllerDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIButton *addModel;

@property NSDictionary *commodityInfo;

@property (weak, nonatomic) IBOutlet UITableView *addInfoTableview;

@property (weak, nonatomic) IBOutlet UIButton *cancel;

@property BOOL addOrEdit;

@property NSDictionary *commodityModel;



@end

NS_ASSUME_NONNULL_END
