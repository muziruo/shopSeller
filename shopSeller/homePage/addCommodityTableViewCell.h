//
//  addCommodityTableViewCell.h
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/26.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+themeUIColor.h"
#import "UIFont+themeUIFont.h"
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface addCommodityTableViewCell : UITableViewCell

@property UILabel *inputTitle;
@property UITextField *inputInfo;

@end


@interface addDetailCell : UITableViewCell

@property UILabel *inputTitle;
@property UITextView *inputInfo;

@end

NS_ASSUME_NONNULL_END
