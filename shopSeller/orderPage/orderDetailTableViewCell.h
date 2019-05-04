//
//  orderDetailTableViewCell.h
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

@interface orderDetailTableViewCell : UITableViewCell

@property UILabel *commodityName;
@property UILabel *commodityId;
@property UILabel *commodityModel;
@property UILabel *actualPay;
@property UILabel *commodityNumber;

@property UILabel *nameTitle;
@property UILabel *idTitle;
@property UILabel *modelTitle;
@property UILabel *payTitle;
@property UILabel *numberTitle;

@end



@interface titleCell : UITableViewCell

@property UILabel *title;

@end



@interface localCell : UITableViewCell

@property UILabel *nameTitle;
@property UILabel *numberTitle;
@property UILabel *localTitle;

@property UILabel *receiptName;
@property UILabel *receiptNumber;
@property UILabel *receiptLocal;

@end

NS_ASSUME_NONNULL_END
