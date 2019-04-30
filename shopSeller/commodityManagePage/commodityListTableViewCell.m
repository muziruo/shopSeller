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
            make.edges.equalTo(self).with.insets(namePadding);
        }];
        
    }
    
    return self;
}

@end
