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


//普通的单行输入
@interface addCommodityTableViewCell : UITableViewCell

@property UILabel *inputTitle;
@property UITextField *inputInfo;
@property UIView *line;

@end


//输入区间，用于比较大量的信息的输入
@interface addDetailCell : UITableViewCell

@property UILabel *inputTitle;
@property UITextView *inputInfo;

@end


//功能行，一般是个按钮
@interface functionCell : UITableViewCell

@property UIButton *functionButton;
@property UIButton *deleteButton;

@end

NS_ASSUME_NONNULL_END
