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



@implementation imageManageCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.commodityImage = [[UIImageView alloc] init];
        self.commodityImage.contentMode = UIViewContentModeScaleAspectFit;
        
        [self addSubview:self.commodityImage];
        
        UIEdgeInsets imagePadding = UIEdgeInsetsMake(10, 30, -10, 0);
        [self.commodityImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(imagePadding.top);
            make.left.equalTo(self.mas_left).with.offset(imagePadding.left);
            make.bottom.equalTo(self.mas_bottom).with.offset(imagePadding.bottom);
            make.height.mas_equalTo(60);
            make.width.mas_equalTo(60);
        }];
    }
    
    return self;
}

@end





@implementation addInfoCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.addInfo = [[UILabel alloc] init];
        self.addInfo.font = UIFont.descriptionFontLight;
        self.addInfo.textColor = UIColor.themeMainColor;
        
        [self addSubview:self.addInfo];
        
        UIEdgeInsets buttonPadding = UIEdgeInsetsMake(10, 0, -10, 0);
        [self.addInfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.mas_centerX);
            make.top.equalTo(self.mas_top).with.offset(buttonPadding.top);
            make.bottom.equalTo(self.mas_bottom).with.offset(buttonPadding.bottom);
        }];
    }
    
    return self;
}

@end




@implementation switchCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.switchTitle = [[UILabel alloc] init];
        self.switchTitle.text = @"上架状态";
        self.switchTitle.font = UIFont.normalFontLight;
        
        self.switchButton = [[UISwitch alloc] init];
        self.switchButton.onTintColor = UIColor.themeMainColor;
        
        [self addSubview:self.switchTitle];
        [self addSubview:self.switchButton];
        
        UIEdgeInsets titlePadding = UIEdgeInsetsMake(20, 20, -20, 0);
        [self.switchTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(titlePadding.top);
            make.left.equalTo(self.mas_left).with.offset(titlePadding.left);
            make.bottom.equalTo(self.mas_bottom).with.offset(titlePadding.bottom);
            make.width.mas_equalTo(60);
        }];
        
        UIEdgeInsets switchPadding = UIEdgeInsetsMake(0, 0, 0, -20);
        [self.switchButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.right.equalTo(self.mas_right).with.offset(switchPadding.right);
            make.width.mas_equalTo(40);
        }];
    }
    
    return self;
}

@end
