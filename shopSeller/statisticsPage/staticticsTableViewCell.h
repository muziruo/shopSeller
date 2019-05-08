//
//  staticticsTableViewCell.h
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/23.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIColor+themeUIColor.h"
#import "UIFont+themeUIFont.h"
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface staticticsTableViewCell : UITableViewCell

@property UILabel *staticticsTitle;
@property UILabel *staticticsResult;
@property UILabel *change;

@end



@interface functionButtonCell : UITableViewCell

@property UIButton *functionButton;

@end

NS_ASSUME_NONNULL_END
