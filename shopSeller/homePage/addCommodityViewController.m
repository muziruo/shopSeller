//
//  addCommodityViewController.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/4/26.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "addCommodityViewController.h"

@interface addCommodityViewController ()

@property int modelNumber;

@end

@implementation addCommodityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.modelNumber = 1;
    
    self.addSell.backgroundColor = UIColor.stressColor;
    self.addDepot.backgroundColor = UIColor.themeMainColor;
    
    self.addCommodityTableview.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    //self.pickedImage = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250) delegate:self placeholderImage:[UIImage imageNamed:@"imageReplace"]];
//    self.pickedImage = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250) imageNamesGroup:nil];
//    self.pickedImage.bannerImageViewContentMode = UIViewContentModeScaleAspectFit;
//    [self.selectImage addSubview:self.pickedImage];
    
    [self.addSell addTarget:self action:@selector(goToSelectImage) forControlEvents:UIControlEventTouchUpInside];
    
    // Do any additional setup after loading the view.
}


-(void)goToSelectImage {
    TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    [self presentViewController:imagePicker animated:true completion:nil];
}


- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    //self.pickedImage.imageURLStringsGroup = photos;
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    switch (section) {
        case 0:
            return 3;
            break;
        case 1:
            return 2 * self.modelNumber + 1;
            break;
        default:
            return 0;
            break;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            addCommodityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addInfoCell"];
            
            if (!cell) {
                cell = [[addCommodityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addInfoCell"];
            }
            
            cell.inputTitle.text = @"商品名称";
            
            return cell;
        }else if (indexPath.row == 1){
            addCommodityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addInfoCell"];
            
            if (!cell) {
                cell = [[addCommodityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addInfoCell"];
            }
            
            cell.inputTitle.text = @"商品价格";
            
            return cell;
        }else if (indexPath.row == 2){
            addDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addDetailCell"];
            
            if (!cell) {
                cell = [[addDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addDetailCell"];
            }
            
            cell.inputTitle.text = @"商品介绍";
            
            return cell;
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == (2*self.modelNumber)) {
            functionCell *cell = [tableView dequeueReusableCellWithIdentifier:@"functionCell"];
            
            if (!cell) {
                cell = [[functionCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"functionCell"];
            }
            
            [cell.functionButton setTitle:@"添加型号" forState:UIControlStateNormal];
            [cell.functionButton addTarget:self action:@selector(addModel) forControlEvents:UIControlEventTouchUpInside];
            [cell.deleteButton setTitle:@"删除型号" forState:UIControlStateNormal];
            [cell.deleteButton addTarget:self action:@selector(removeModel) forControlEvents:UIControlEventTouchUpInside];
            
            return cell;
        }else{
            NSString *cellId = [NSString stringWithFormat:@"addInfoCell%lu",indexPath.row];
            addCommodityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
            //addCommodityTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
            
            if (!cell) {
                cell = [[addCommodityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
            }
            
            
            if (indexPath.row % 2 == 0) {
                cell.inputTitle.text = @"型号";
            }else if (indexPath.row % 2 == 1){
                cell.inputTitle.text = @"库存数量";
            }
            
            return cell;
        }
    }
    
    return nil;
}


- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 15;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:true];
//    if (indexPath.section == 1) {
//        if (indexPath.row == (self.modelNumber * 2)) {
//            self.modelNumber++;
//            [self.addCommodityTableview reloadData];
//        }
//    }
}


-(void)addModel {
    self.modelNumber++;
    [self.addCommodityTableview reloadData];
}


-(void)removeModel {
    if (self.modelNumber == 1) {
        return;
    }
    self.modelNumber--;
    [self.addCommodityTableview reloadData];
}


@end
