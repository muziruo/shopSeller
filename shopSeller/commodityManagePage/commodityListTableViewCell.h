//
//  commodityListTableViewCell.h
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/29.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+themeUIColor.h"
#import "UIFont+themeUIFont.h"
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface commodityListTableViewCell : UITableViewCell

@property UILabel *commodityName;
@property UILabel *commodityStatus;

@end



@interface imageManageCell : UITableViewCell

@property UIImageView *commodityImage;

@end



@interface addInfoCell : UITableViewCell

@property UILabel *addInfo;

@end



@interface switchCell : UITableViewCell

@property UILabel *switchTitle;
@property UISwitch *switchButton;

@end

NS_ASSUME_NONNULL_END
