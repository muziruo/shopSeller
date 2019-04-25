//
//  staticticsTableViewCell.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/23.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "staticticsTableViewCell.h"

@implementation staticticsTableViewCell

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
        self.staticticsTitle = [[UILabel alloc] init];
        self.staticticsTitle.font = UIFont.normalFontLight;
//
        self.staticticsResult = [[UILabel alloc] init];
        self.staticticsResult.font = UIFont.normalFontLight;
//
        self.change = [[UILabel alloc] init];
        self.change.font = UIFont.descriptionFont;
        
//        
        [self addSubview:self.contentView];
        [self.contentView addSubview:self.staticticsResult];
        [self.contentView addSubview:self.staticticsTitle];
        [self.contentView addSubview:self.change];
        
//
        
    }
    
    return self;
}

@end
