//
//  addCommodityTableViewCell.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/26.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "addCommodityTableViewCell.h"

@implementation addCommodityTableViewCell

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
        self.inputTitle = [[UILabel alloc] init];
        self.inputTitle.font = UIFont.normalFontLight;
        //self.inputTitle.textAlignment = NSTextLayoutOrientationVertical;
        
        self.inputInfo = [[UITextField alloc] init];
        self.inputInfo.font = UIFont.normalFontLight;
        
        self.line = [[UIView alloc] init];
        self.line.backgroundColor = UIColor.themeMainColor;
        
//
        [self addSubview:self.inputInfo];
        [self addSubview:self.inputTitle];
        [self addSubview:self.line];
        
//
        UIEdgeInsets titlePadding = UIEdgeInsetsMake(20, 20, -20, 0);
        [self.inputTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(titlePadding.top);
            make.left.equalTo(self.mas_left).with.offset(titlePadding.left);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(60);
            make.centerY.equalTo(self.mas_centerY);
            make.bottom.equalTo(self.mas_bottom).with.offset(titlePadding.bottom);
        }];
        
        UIEdgeInsets infoPadding = UIEdgeInsetsMake(10, 20, -20, -20);
        [self.inputInfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.inputTitle.mas_right).with.offset(infoPadding.left);
            make.right.equalTo(self.mas_right).with.offset(infoPadding.right);
            make.centerY.equalTo(self.mas_centerY);
            make.height.mas_equalTo(30);
        }];
        
        [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.inputInfo.mas_bottom);
            make.left.equalTo(self.inputInfo.mas_left);
            make.right.equalTo(self.inputInfo.mas_right);
            make.height.mas_equalTo(1);
        }];
    }
    
    return self;
}

@end






@implementation addDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.inputTitle = [[UILabel alloc] init];
        self.inputTitle.font = UIFont.normalFontLight;
        
        self.inputInfo = [[UITextView alloc] init];
        self.inputInfo.font = UIFont.normalFontLight;
        self.inputInfo.layer.borderWidth = 1;
        self.inputInfo.layer.borderColor = UIColor.themeMainColor.CGColor;
        self.inputInfo.layer.cornerRadius = 5;
        
        //
        [self addSubview:self.inputInfo];
        [self addSubview:self.inputTitle];
        
        //
        UIEdgeInsets titlePadding = UIEdgeInsetsMake(20, 20, -20, 0);
        [self.inputTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(titlePadding.top);
            make.left.equalTo(self.mas_left).with.offset(titlePadding.left);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(60);
            //make.bottom.equalTo(self.mas_bottom).with.offset(titlePadding.bottom);
        }];
        
        UIEdgeInsets infoPadding = UIEdgeInsetsMake(10, 20, -20, -20);
        [self.inputInfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.inputTitle.mas_right).with.offset(infoPadding.left);
            make.right.equalTo(self.mas_right).with.offset(infoPadding.right);
            make.centerY.equalTo(self.mas_centerY);
            make.height.mas_equalTo(100);
            make.bottom.equalTo(self.mas_bottom).with.offset(infoPadding.bottom);
        }];
    }
    
    return self;
}

@end





@implementation functionCell

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.functionButton = [[UIButton alloc] init];
        self.functionButton.titleLabel.font = UIFont.descriptionFontLight;
        self.functionButton.backgroundColor = UIColor.themeMainColor;
        self.functionButton.titleLabel.textColor = UIColor.whiteColor;
        self.functionButton.layer.cornerRadius = 10;
        
        self.deleteButton = [[UIButton alloc] init];
        self.deleteButton.titleLabel.font = UIFont.descriptionFontLight;
        self.deleteButton.backgroundColor = UIColor.stressColor;
        self.deleteButton.titleLabel.textColor = UIColor.whiteColor;
        self.deleteButton.layer.cornerRadius = 10;
        
        [self addSubview:self.functionButton];
        [self addSubview:self.deleteButton];
        
        UIEdgeInsets buttonPadding = UIEdgeInsetsMake(10, 40, -10, 0);
        [self.functionButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(110);
            make.top.equalTo(self.mas_top).with.offset(buttonPadding.top);
            make.left.equalTo(self.mas_left).with.offset(buttonPadding.left);
            make.bottom.equalTo(self.mas_bottom).with.offset(buttonPadding.bottom);
            //make.edges.equalTo(self).with.insets(buttonPadding);
        }];
        
        UIEdgeInsets deletePadding = UIEdgeInsetsMake(10, 0, -10, -40);
        [self.deleteButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.mas_equalTo(20);
            make.width.mas_equalTo(110);
            make.top.equalTo(self.mas_top).with.offset(deletePadding.top);
            make.right.equalTo(self.mas_right).with.offset(deletePadding.right);
            make.bottom.equalTo(self.mas_bottom).with.offset(deletePadding.bottom);
        }];
    }
    
    return self;
}


- (void)layoutSubviews {
    
}

@end
