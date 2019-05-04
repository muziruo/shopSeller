//
//  addModelViewController.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/5/4.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "addModelViewController.h"

@interface addModelViewController ()

@end

@implementation addModelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.addModel.backgroundColor = UIColor.themeMainColor;
    [self.addModel addTarget:self action:@selector(addModelInfo) forControlEvents:UIControlEventTouchUpInside];
    
    
    self.cancel.backgroundColor = UIColor.themeMainColor;
    [self.cancel addTarget:self action:@selector(cancelAdd) forControlEvents:UIControlEventTouchUpInside];
    
    self.addInfoTableview.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    // Do any additional setup after loading the view.
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        addCommodityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"inputCell"];
        
        if (!cell) {
            cell = [[addCommodityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"inputCell"];
        }
        
        cell.inputTitle.text = @"型号";
        
        cell.inputInfo.tag = 101;
        
        return cell;
    }else if (indexPath.row == 1){
        addCommodityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"inputCell"];
        
        if (!cell) {
            cell = [[addCommodityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"inputCell"];
        }
        
        cell.inputTitle.text = @"库存";
        
        cell.inputInfo.tag = 102;
        
        return cell;
    }
    
    return nil;
}


-(void)addModelInfo {
    
    [SVProgressHUD show];
    UITextField *modelName = [self.view viewWithTag:101];
    UITextField *modelStock = [self.view viewWithTag:102];
    int stockInt = [modelStock.text intValue];
    NSNumber *stock = [NSNumber numberWithInteger:stockInt];
    
    NSDictionary *params = @{@"commodityId":[self.commodityInfo valueForKey:@"objectId"],@"commodityModel":modelName.text,@"stockNumber":stock,@"price":@2333};
    [AVCloud callFunctionInBackground:@"addStock" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
        if (error == nil) {
            if ([object valueForKey:@"success"]) {
                [SVProgressHUD showSuccessWithStatus:@"添加成功"];
                if ([self.delegate respondsToSelector:@selector(addedModel)]) {
                    [self.delegate addedModel];
                }
                [self dismissViewControllerAnimated:true completion:nil];
            }else {
                [SVProgressHUD showErrorWithStatus:@"添加失败"];
                [SVProgressHUD dismissWithDelay:0.8];
            }
        }
    }];
}



-(void)cancelAdd {
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
