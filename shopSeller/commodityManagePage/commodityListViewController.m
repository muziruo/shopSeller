//
//  commodityListViewController.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/29.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "commodityListViewController.h"

@interface commodityListViewController ()

@end

@implementation commodityListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //上下架商品分页
    self.myTitleView = [[JXCategoryTitleView alloc] initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, 50)];
    self.myTitleView.delegate = self;
    self.myTitleView.titles =@[@"上架中",@"下架中"];
    self.myTitleView.titleFont = UIFont.titleFont;
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
    [self.listContainerView setFrame:CGRectMake(0, 120, self.view.frame.size.width, self.view.frame.size.height - 120)];
    [self.view addSubview:self.listContainerView];
    self.myTitleView.contentScrollView = self.listContainerView.scrollView;
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
