//
//  homeTableViewCell.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/23.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "homeTableViewCell.h"

@implementation homeTableViewCell

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
        self.functionImage = [[UIImageView alloc] init];
        self.functionImage.contentMode = UIViewContentModeScaleAspectFit;
        
        self.functionTitle = [[UILabel alloc] init];
        self.functionTitle.font = UIFont.normalFontLight;
        
        self.point = [[UILabel alloc] init];
        self.point.backgroundColor = UIColor.stressColor;
        self.point.textColor = UIColor.whiteColor;
        self.point.font = UIFont.descriptionFontLight;
        self.point.layer.cornerRadius = 5;
        self.point.layer.masksToBounds = YES;
        
        
        [self addSubview:self.contentView];
        self.contentView.layer.cornerRadius = 8;
        self.backgroundColor = UIColor.voidColor;
        self.contentView.backgroundColor = UIColor.whiteColor;
        
        [self.contentView addSubview:self.functionImage];
        [self.contentView addSubview:self.functionTitle];
        [self.contentView addSubview:self.point];
        
        UIEdgeInsets imagePadding = UIEdgeInsetsMake(10, 40, -10, 0);
        [self.functionImage mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.contentView.mas_top).with.offset(imagePadding.top);
            make.left.equalTo(self.contentView.mas_left).with.offset(imagePadding.left);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(50);
            make.bottom.equalTo(self.contentView.mas_bottom).with.offset(imagePadding.bottom);
        }];
        
        UIEdgeInsets titlePadding = UIEdgeInsetsMake(0, 40, 0, -50);
        [self.functionTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.left.equalTo(self.functionImage.mas_right).with.offset(titlePadding.left);
            make.right.equalTo(self.contentView.mas_right).with.offset(titlePadding.right);
        }];
        
        UIEdgeInsets viewPadding = UIEdgeInsetsMake(5, 10, 5, 10);
        self.contentView.layer.cornerRadius = 8;
        [self.contentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(viewPadding);
            make.height.mas_equalTo(70);
        }];
        
        UIEdgeInsets pointPadding = UIEdgeInsetsMake(0, 0, 0, -20);
        [self.point mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self.mas_centerY);
            make.right.equalTo(self.contentView.mas_right).with.offset(pointPadding.right);
            make.height.mas_equalTo(16);
        }];
    }
    
    return self;
}


@end




