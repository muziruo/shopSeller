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
        
        self.inputInfo = [[UITextField alloc] init];
        
//
        [self addSubview:self.inputInfo];
        [self addSubview:self.inputTitle];
        
//
        UIEdgeInsets titlePadding = UIEdgeInsetsMake(10, 20, -20, 0);
        [self.inputTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(titlePadding.top);
            make.left.equalTo(self.mas_left).with.offset(titlePadding.left);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(80);
            make.bottom.equalTo(self.mas_bottom).with.offset(titlePadding.bottom);
        }];
        
        UIEdgeInsets infoPadding = UIEdgeInsetsMake(10, 20, -20, -20);
        [self.inputInfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.inputTitle.mas_right).with.offset(infoPadding.left);
            make.right.equalTo(self.mas_right).with.offset(infoPadding.right);
            make.centerY.equalTo(self.mas_centerY);
            make.height.mas_equalTo(30);
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
        
        //
        [self addSubview:self.inputInfo];
        [self addSubview:self.inputTitle];
        
        //
        UIEdgeInsets titlePadding = UIEdgeInsetsMake(10, 20, -20, 0);
        [self.inputTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(titlePadding.top);
            make.left.equalTo(self.mas_left).with.offset(titlePadding.left);
            make.height.mas_equalTo(30);
            make.width.mas_equalTo(80);
            //make.bottom.equalTo(self.mas_bottom).with.offset(titlePadding.bottom);
        }];
        
        UIEdgeInsets infoPadding = UIEdgeInsetsMake(10, 20, -20, -20);
        [self.inputInfo mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self.inputTitle.mas_right).with.offset(infoPadding.left);
            make.right.equalTo(self.mas_right).with.offset(infoPadding.right);
            make.centerY.equalTo(self.mas_centerY);
            make.height.mas_equalTo(100);
        }];
    }
    
    return self;
}

@end
