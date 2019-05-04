//
//  editCommodityViewController.m
//  shopSeller
//
//  Created by 李祎喆 on 2019/5/4.
//  Copyright © 2019 李祎喆. All rights reserved.
//

#import "editCommodityViewController.h"

@interface editCommodityViewController ()

@property NSArray *commodityImage;

@property NSArray *commodityModel;

@property UIStoryboard *mainStoryBroad;

@end

@implementation editCommodityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mainStoryBroad = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    self.saveInfo.backgroundColor = UIColor.themeMainColor;
    
    [self getImageInfo];
    [self getModelInfo];
    // Do any additional setup after loading the view.
}




-(void)getImageInfo {
    NSDictionary *params = @{@"commodityId":[self.commodityInfo valueForKey:@"objectId"]};
    [AVCloud callFunctionInBackground:@"getCommodityImage" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
        if (error == nil) {
            self.commodityImage = object;
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.editTableview reloadData];
            }];
        }
    }];
}


-(void)getModelInfo {
    NSDictionary *params = @{@"commodityId":[self.commodityInfo valueForKey:@"objectId"]};
    [AVCloud callFunctionInBackground:@"getStock" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
        if (error == nil) {
            self.commodityModel = object;
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.editTableview reloadData];
            }];
        }
    }];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //return [self.commodityImage count] + 2;
    switch (section) {
        case 0:
            return [self.commodityImage count] + 2;
            break;
        case 1:
            return 4;
            break;
        case 2:
            return [self.commodityModel count] + 2;
            break;
        case 3:
            return 2;
            break;
        default:
            return 0;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            titleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
            
            if (!cell) {
                cell = [[titleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"titleCell"];
            }
            
            cell.title.text = @"图片管理";
            cell.userInteractionEnabled = NO;
            
            return cell;
        }else if (indexPath.row == ([self.commodityImage count] + 1)){
            
            addInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addImage"];
            
            if (!cell) {
                cell = [[addInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addImage"];
            }
            
            cell.addInfo.text = @"添加图片";
            
            return cell;
            
            
        }else {
            imageManageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"imageCell"];
            
            if (!cell) {
                cell = [[imageManageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"iamgeCell"];
            }
            
            NSURL *imageUrl = [NSURL URLWithString:[self.commodityImage[indexPath.row - 1] valueForKey:@"imageUrl"]];
            [cell.commodityImage sd_setImageWithURL:imageUrl placeholderImage:[UIImage imageNamed:@"imageReplace"]];
            
            return cell;
        }
    }else if (indexPath.section == 1){
        if (indexPath.row == 0) {
            titleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
            
            if (!cell) {
                cell = [[titleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"titleCell"];
            }
            
            cell.title.text = @"商品信息管理";
            cell.userInteractionEnabled = NO;
            
            return cell;
        }else if (indexPath.row == 1){
            
            addCommodityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addInfoCell"];
            
            if (!cell) {
                cell = [[addCommodityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addInfoCell"];
            }
            
            cell.inputTitle.text = @"商品名称";
            cell.inputInfo.text = [self.commodityInfo valueForKey:@"name"];
            
            return cell;
        }else if (indexPath.row == 2){
            
            addCommodityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addInfoCell"];
            
            if (!cell) {
                cell = [[addCommodityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addInfoCell"];
            }
            
            cell.inputTitle.text = @"商品价格";
            NSString *priceString = [NSString stringWithFormat:@"%@",[self.commodityInfo valueForKey:@"price"]];
            cell.inputInfo.text = priceString;
            
            return cell;
        }else if (indexPath.row == 3){
            addDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addDetailCell"];
            
            if (!cell) {
                cell = [[addDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addDetailCell"];
            }
            
            cell.inputTitle.text = @"商品介绍";
            cell.inputInfo.text = [self.commodityInfo valueForKey:@"description"];
            
            return cell;
        }
    }else if (indexPath.section == 2){
        if (indexPath.row == 0) {
            
            titleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
            
            if (!cell) {
                cell = [[titleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"titleCell"];
            }
            
            cell.title.text = @"商品型号/库存管理";
            cell.userInteractionEnabled = NO;
            
            return cell;
        }else if (indexPath.row == ([self.commodityModel count] + 1)){
            
            addInfoCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addImage"];
            
            if (!cell) {
                cell = [[addInfoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addImage"];
            }
            
            cell.addInfo.text = @"添加型号";
            
            return cell;
        }else {
            
            titleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"modelCell"];
            
            if (!cell) {
                cell = [[titleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"modelCell"];
            }
            
            cell.title.text = [self.commodityModel[indexPath.row - 1] valueForKey:@"commodityModel"];
            cell.title.font = UIFont.normalFontLight;
            
            return cell;
        }
    }else if (indexPath.section == 3){
        if (indexPath.row == 0) {
            titleCell *cell = [tableView dequeueReusableCellWithIdentifier:@"titleCell"];
            
            if (!cell) {
                cell = [[titleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"titleCell"];
            }
            
            cell.title.text = @"商品上下架管理";
            cell.userInteractionEnabled = NO;
            
            return cell;
        }else if (indexPath.row == 1){
            switchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"switchCell"];
            
            if (!cell) {
                cell = [[switchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"switchCell"];
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
    
    if (indexPath.section == 2) {
        if (indexPath.row == [self.commodityModel count] + 1) {
            addModelViewController *addModelView = [self.mainStoryBroad instantiateViewControllerWithIdentifier:@"addModelView"];
            addModelView.delegate = self;
            addModelView.commodityInfo = self.commodityInfo;
            [self presentViewController:addModelView animated:true completion:nil];
        }
    }else if (indexPath.section == 0){
        if (indexPath.row == [self.commodityImage count] + 1) {
            [self goToSelectImage];
        }
    }
}


- (void)addedModel {
    NSLog(@"刷新列表");
    [self getModelInfo];
}


-(void)goToSelectImage {
    TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    [self presentViewController:imagePicker animated:true completion:nil];
}


- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    NSLog(@"选择了图片");
    
    [SVProgressHUD show];
    
    dispatch_queue_t myQueue = dispatch_queue_create("muziruo.com", DISPATCH_QUEUE_SERIAL);
    
    self.imageNumber = [photos count];
    
    for (int i = 0; i < [photos count]; i++) {
        NSData *imageData = photos[i].sd_imageData;
        
        AVFile *imageFile = [AVFile fileWithData:imageData name:@"image.jpg"];
        
        [imageFile uploadWithCompletionHandler:^(BOOL succeeded, NSError * _Nullable error) {
            if (error == nil) {
                //            [SVProgressHUD showSuccessWithStatus:@"上传成功"];
                //            [SVProgressHUD dismissWithDelay:1.0];
                NSDictionary *params = @{@"commodityId":[self.commodityInfo valueForKey:@"objectId"],@"imageUrl":imageFile.url,@"imageId":imageFile.objectId};
                [AVCloud callFunctionInBackground:@"addImage" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
                    if (error == nil) {
                        if ([object valueForKey:@"success"]) {
                            
                            dispatch_barrier_sync(myQueue, ^{
                                self.imageNumber--;
                            });
                            
                            if (self.imageNumber == 0) {
                                [SVProgressHUD showSuccessWithStatus:@"上传成功"];
                                [SVProgressHUD dismissWithDelay:1.0];
                                [self getImageInfo];
                            }
                        }
                    }
                }];
            }
        }];
    }
}


@end
