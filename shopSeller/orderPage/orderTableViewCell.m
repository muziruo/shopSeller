//
//  orderTableViewCell.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/5/3.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "orderTableViewCell.h"

@implementation orderTableViewCell

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
        
        self.commodityModel = [[UILabel alloc] init];
        self.commodityModel.font = UIFont.descriptionFontLight;
        
        [self addSubview:self.commodityName];
        [self addSubview:self.commodityModel];
        
        UIEdgeInsets namePadding = UIEdgeInsetsMake(10, 30, 0, -30);
        [self.commodityName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(namePadding.top);
            make.left.equalTo(self.mas_left).with.offset(namePadding.left);
            make.height.mas_equalTo(20);
        }];
        
        UIEdgeInsets modelPadding = UIEdgeInsetsMake(10, 30, -10, -30);
        [self.commodityModel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.commodityName.mas_bottom).with.offset(modelPadding.top);
            make.left.equalTo(self.mas_left).with.offset(modelPadding.left);
            make.right.equalTo(self.mas_right).with.offset(modelPadding.right);
            make.bottom.equalTo(self.mas_bottom).with.offset(modelPadding.bottom);
            make.height.mas_equalTo(20);
        }];
        
    }
    
    return self;
}

@end
