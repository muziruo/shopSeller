//
//  commodityListViewController.h
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/29.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <JXCategoryView/JXCategoryView.h>
#import "UIColor+themeUIColor.h"
#import "UIFont+themeUIFont.h"

NS_ASSUME_NONNULL_BEGIN

@interface commodityListViewController : UIViewController<JXCategoryViewDelegate, JXCategoryListContainerViewDelegate>

@property JXCategoryTitleView *myTitleView;
@property JXCategoryListContainerView *listContainerView;

@end

NS_ASSUME_NONNULL_END
