//
//  orderDetailTableViewCell.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/5/3.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "orderDetailTableViewCell.h"

@implementation orderDetailTableViewCell

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
//        初始化
        self.nameTitle = [[UILabel alloc] init];
        self.nameTitle.text = @"商品名称";
        self.idTitle = [[UILabel alloc] init];
        self.idTitle.text = @"商品ID";
        self.modelTitle = [[UILabel alloc] init];
        self.modelTitle.text = @"商品型号";
        self.payTitle = [[UILabel alloc] init];
        self.payTitle.text = @"实付金额";
        self.numberTitle = [[UILabel alloc] init];
        self.numberTitle.text = @"货物数量";
        
        self.commodityName = [[UILabel alloc] init];
        self.commodityId = [[UILabel alloc] init];
        self.commodityModel = [[UILabel alloc] init];
        self.actualPay = [[UILabel alloc] init];
        self.commodityNumber = [[UILabel alloc] init];
        
//
        self.commodityModel.font = UIFont.normalFontLight;
        self.commodityModel.numberOfLines = 0;
        self.commodityId.font = UIFont.normalFontLight;
        self.commodityId.numberOfLines = 0;
        self.commodityName.font = UIFont.normalFontLight;
        self.commodityName.numberOfLines = 0;
        self.actualPay.font = UIFont.normalFontLight;
        self.actualPay.numberOfLines = 0;
        self.commodityNumber.font = UIFont.normalFontLight;
        
        self.nameTitle.font = UIFont.normalFontLight;
        self.idTitle.font = UIFont.normalFontLight;
        self.modelTitle.font = UIFont.normalFontLight;
        self.payTitle.font = UIFont.normalFontLight;
        self.numberTitle.font = UIFont.normalFontLight;
        
        [self addSubview:self.nameTitle];
        [self addSubview:self.idTitle];
        [self addSubview:self.modelTitle];
        [self addSubview:self.payTitle];
        [self addSubview:self.commodityName];
        [self addSubview:self.commodityId];
        [self addSubview:self.commodityModel];
        [self addSubview:self.actualPay];
        [self addSubview:self.commodityNumber];
        [self addSubview:self.numberTitle];
        
        UIEdgeInsets idTitlePadding = UIEdgeInsetsMake(10, 30, 0, 0);
        [self.idTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(idTitlePadding.top);
            make.left.equalTo(self.mas_left).with.offset(idTitlePadding.left);
            make.width.mas_equalTo(60);
            //make.height.mas_equalTo(20);
        }];
        
        UIEdgeInsets idPadding = UIEdgeInsetsMake(10, 20, 0, -30);
        [self.commodityId mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.idTitle.mas_top);
            make.left.equalTo(self.idTitle.mas_right).with.offset(idPadding.left);
            make.right.equalTo(self.mas_right).with.offset(idPadding.right);
        }];
        
        
        UIEdgeInsets nameTitlePadding = UIEdgeInsetsMake(10, 20, 0, 0);
        [self.nameTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.commodityId.mas_bottom).with.offset(nameTitlePadding.top);
            make.left.equalTo(self.idTitle.mas_left);
            make.right.equalTo(self.idTitle.mas_right);
            //make.height.mas_equalTo(20);
        }];
        
        UIEdgeInsets namePadding = UIEdgeInsetsMake(0, 0, 0, -30);
        [self.commodityName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameTitle.mas_top);
            make.left.equalTo(self.commodityId.mas_left);
            make.right.equalTo(self.mas_right).with.offset(namePadding.right);
        }];
        
        UIEdgeInsets modelTitlePadding = UIEdgeInsetsMake(10, 0, 0, 0);
        [self.modelTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.commodityName.mas_bottom).with.offset(modelTitlePadding.top);
            make.left.equalTo(self.nameTitle.mas_left);
            make.right.equalTo(self.nameTitle.mas_right);
        }];
        
        
        //UIEdgeInsets modelPadding = UIEdgeInsetsMake(10, 20, 0, -30);
        [self.commodityModel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.modelTitle.mas_top);
            make.left.equalTo(self.commodityName.mas_left);
            make.right.equalTo(self.commodityName.mas_right);
        }];
        
        
        UIEdgeInsets payTitlePadding = UIEdgeInsetsMake(10, 0, -20, 0);
        [self.payTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.commodityModel.mas_bottom).with.offset(payTitlePadding.top);
            make.left.equalTo(self.modelTitle.mas_left);
            make.right.equalTo(self.modelTitle.mas_right);
        }];
        
        //UIEdgeInsets payPadding = UIEdgeInsetsMake(10, 0, -20, 0);
        [self.actualPay mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.payTitle.mas_top);
            make.left.equalTo(self.commodityModel.mas_left);
            make.right.equalTo(self.commodityModel.mas_right);
            //make.bottom.equalTo(self.mas_bottom).with.offset(payPadding.bottom);
        }];
        
        
        UIEdgeInsets numberTitlePadding = UIEdgeInsetsMake(10, 0, -20, 0);
        [self.numberTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.actualPay.mas_bottom).with.offset(numberTitlePadding.top);
            make.left.equalTo(self.payTitle.mas_left);
            make.right.equalTo(self.payTitle.mas_right);
        }];
        
        
        UIEdgeInsets numberPadding = UIEdgeInsetsMake(10, 0, -20, 0);
        [self.commodityNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.numberTitle.mas_top);
            make.left.equalTo(self.actualPay.mas_left);
            make.right.equalTo(self.actualPay.mas_right);
            make.bottom.equalTo(self.mas_bottom).with.offset(numberPadding.bottom);
        }];
    }
    
    return self;
}

@end





@implementation titleCell

- (void)awakeFromNib {
    [super awakeFromNib];
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.title = [[UILabel alloc] init];
        self.title.font = UIFont.titleFont;
        
        [self addSubview:self.title];
        
        UIEdgeInsets titlePadding = UIEdgeInsetsMake(10, 20, 10, 20);
        [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self).with.insets(titlePadding);
        }];
    }
    
    return self;
}


- (void)layoutSubviews {
    
}

@end





@implementation localCell

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
        self.nameTitle = [[UILabel alloc] init];
        self.numberTitle = [[UILabel alloc] init];
        self.localTitle = [[UILabel alloc] init];
        self.receiptName = [[UILabel alloc] init];
        self.receiptNumber = [[UILabel alloc] init];
        self.receiptLocal = [[UILabel alloc] init];
        
        self.nameTitle.font = UIFont.normalFontLight;
        self.nameTitle.text = @"收货人姓名";
        self.numberTitle.font = UIFont.normalFontLight;
        self.numberTitle.text = @"收货人电话";
        self.localTitle.font = UIFont.normalFontLight;
        self.localTitle.text = @"收货人地址";
        self.receiptName.font = UIFont.normalFontLight;
        self.receiptName.numberOfLines = 0;
        self.receiptNumber.font = UIFont.normalFontLight;
        self.receiptNumber.numberOfLines = 0;
        self.receiptLocal.font = UIFont.normalFontLight;
        self.receiptLocal.numberOfLines = 0;
        
        [self addSubview:self.nameTitle];
        [self addSubview:self.receiptNumber];
        [self addSubview:self.numberTitle];
        [self addSubview:self.localTitle];
        [self addSubview:self.receiptLocal];
        [self addSubview:self.receiptName];
        
        UIEdgeInsets nameTitlePadding = UIEdgeInsetsMake(10, 30, 0, 0);
        [self.nameTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.mas_top).with.offset(nameTitlePadding.top);
            make.left.equalTo(self.mas_left).with.offset(nameTitlePadding.left);
            make.width.mas_equalTo(80);
        }];
        
        UIEdgeInsets namePadding = UIEdgeInsetsMake(10, 20, 0, -30);
        [self.receiptName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.nameTitle.mas_top);
            make.left.equalTo(self.nameTitle.mas_right).with.offset(namePadding.left);
            make.right.equalTo(self.mas_right).with.offset(namePadding.right);
        }];
        
        UIEdgeInsets numberTitlePadding = UIEdgeInsetsMake(10, 0, 0, 0);
        [self.numberTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.receiptName.mas_bottom).with.offset(numberTitlePadding.top);
            make.left.equalTo(self.nameTitle.mas_left);
            make.right.equalTo(self.nameTitle.mas_right);
        }];
        
        [self.receiptNumber mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.numberTitle.mas_top);
            make.left.equalTo(self.receiptName.mas_left);
            make.right.equalTo(self.receiptName.mas_right);
        }];
        
        
        UIEdgeInsets localTitlePadding = UIEdgeInsetsMake(10, 0, 0, 0);
        [self.localTitle mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.receiptNumber.mas_bottom).with.offset(localTitlePadding.top);
            make.left.equalTo(self.numberTitle.mas_left);
            make.right.equalTo(self.numberTitle.mas_right);
        }];
        
        UIEdgeInsets localPadding = UIEdgeInsetsMake(10, 0, -20, 0);
        [self.receiptLocal mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.localTitle.mas_top);
            make.left.equalTo(self.receiptNumber.mas_left);
            make.right.equalTo(self.receiptNumber.mas_right);
            make.bottom.equalTo(self.mas_bottom).with.offset(localPadding.bottom);
        }];
    }
    
    return self;
}

@end
