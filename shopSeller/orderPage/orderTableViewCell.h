//
//  orderTableViewCell.h
//  shopSeller
//
//  Created by 李祎喆 on 2019/5/3.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+themeUIColor.h"
#import "UIFont+themeUIFont.h"
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface orderTableViewCell : UITableViewCell

@property UILabel *commodityName;
@property UILabel *commodityModel;

@end

NS_ASSUME_NONNULL_END
