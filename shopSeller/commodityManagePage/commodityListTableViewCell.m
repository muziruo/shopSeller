//
//  commodityListTableViewCell.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/29.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "commodityListTableViewCell.h"

@implementation commodityListTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.commodityName = [[UILabel alloc] init];
        self.commodityName.font = UIFont.normalFont;
        
//        self.commodityStatus = [[UILabel alloc] init];
//        self.commodityStatus.font = UIFont.descriptionFontLight;
        
        [self addSubview:self.commodityName];
//        [self addSubview:self.commodityStatus];
        
        UIEdgeInsets namePadding = UIEdgeInsetsMake(20, 30, -20, -30);
        [self.commodityName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.mas_left).with.offset(namePadding.left);
            make.right.equalTo(self.mas_right).with.offset(namePadding.right);
            make.top.equalTo(self.mas_top).with.offset(namePadding.top);
            make.bottom.equalTo(self.mas_bottom).with.offset(namePadding.bottom);
            //make.centerY.equalTo(self.mas_centerY);
        }];
        
    }
    
    return self;
}

@end
