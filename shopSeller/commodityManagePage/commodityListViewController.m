//
//  commodityListViewController.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/29.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "commodityListViewController.h"

@interface commodityListViewController ()

@property CGFloat topHeight;

@end

@implementation commodityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.topHeight = self.navigationController.navigationBar.frame.size.height + UIApplication.sharedApplication.statusBarFrame.size.height;
    
    //上下架商品分页
    self.myTitleView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0,self.navigationController.navigationBar.frame.size.height + UIApplication.sharedApplication.statusBarFrame.size.height, self.view.frame.size.width, 40)];
    self.myTitleView.delegate = self;
    self.myTitleView.titles =@[@"上架商品",@"下架商品"];
    self.myTitleView.titleFont = UIFont.normalFont;
    self.myTitleView.titleColorGradientEnabled = YES;
    self.myTitleView.titleSelectedColor = UIColor.themeMainColor;
    self.myTitleView.titleColor = UIColor.grayColor;
    [self.view addSubview:self.myTitleView];
    
    
    //标签处于何处的指示器
    JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
    lineView.indicatorColor = UIColor.themeMainColor;
    lineView.indicatorLineWidth = JXCategoryViewAutomaticDimension;
    self.myTitleView.indicators = @[lineView];
    
    
    self.listContainerView = [[JXCategoryListContainerView alloc] initWithDelegate:self];
    [self.listContainerView setFrame:CGRectMake(0, self.topHeight + 40, self.view.frame.size.width, self.view.frame.size.height - self.topHeight - 70)];
    [self.view addSubview:self.listContainerView];
    self.myTitleView.contentScrollView = self.listContainerView.scrollView;
    
    
    self.addCommodityButton.backgroundColor = UIColor.themeMainColor;
    // Do any additional setup after loading the view.
}


- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.myTitleView.titles.count;
}


- (void)categoryView:(JXCategoryBaseView *)categoryView didClickSelectedItemAtIndex:(NSInteger)index {
    [self.listContainerView didClickSelectedItemAtIndex:index];
}

- (void)categoryView:(JXCategoryBaseView *)categoryView scrollingFromLeftIndex:(NSInteger)leftIndex toRightIndex:(NSInteger)rightIndex ratio:(CGFloat)ratio {
    [self.listContainerView scrollingFromLeftIndex:leftIndex toRightIndex:rightIndex ratio:ratio selectedIndex:_myTitleView.selectedIndex];
}

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    switch (index) {
        case 0:
            return [[onSellViewController alloc] init];
            break;
        case 1:
            
            break;
        default:
            return nil;
            break;
    }
    return nil;
}


@end
