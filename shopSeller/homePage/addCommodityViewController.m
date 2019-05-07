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

@property NSMutableArray *imageArray;

@property int infoUpload;
@property int imageUpload;
@property int modelUpload;
@property NSNumber *isSell;

@end

@implementation addCommodityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.modelNumber = 1;
    self.infoUpload = 3;
    
    self.addSell.backgroundColor = UIColor.stressColor;
    self.addDepot.backgroundColor = UIColor.themeMainColor;
    
    self.addCommodityTableview.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
    
    //self.pickedImage = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250) delegate:self placeholderImage:[UIImage imageNamed:@"imageReplace"]];
//    self.pickedImage = [SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 250) imageNamesGroup:nil];
//    self.pickedImage.bannerImageViewContentMode = UIViewContentModeScaleAspectFit;
//    [self.selectImage addSubview:self.pickedImage];
    
    [self.addSell addTarget:self action:@selector(addSellAction) forControlEvents:UIControlEventTouchUpInside];
    [self.addDepot addTarget:self action:@selector(addStockAction) forControlEvents:UIControlEventTouchUpInside];
    
    self.imageArray = [[NSMutableArray alloc] init];
    UIImage *addImage = [UIImage imageNamed:@"addImage"];
    [self.imageArray addObject:addImage];
    NSLog(@"当前图片数组数量%lu",(unsigned long)[self.imageArray count]);
    self.imagePicker = [[QMUIImagePreviewView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    self.imagePicker.delegate = self;
    [self.selectImage addSubview:self.imagePicker];
    
    // Do any additional setup after loading the view.
}


- (NSUInteger)numberOfImagesInImagePreviewView:(QMUIImagePreviewView *)imagePreviewView {
    return [self.imageArray count];
}


- (void)imagePreviewView:(QMUIImagePreviewView *)imagePreviewView renderZoomImageView:(QMUIZoomImageView *)zoomImageView atIndex:(NSUInteger)index {
    zoomImageView.image = self.imageArray[index];
}


- (void)singleTouchInZoomingImageView:(QMUIZoomImageView *)zoomImageView location:(CGPoint)location {
    [self goToSelectImage];
}


-(void)goToSelectImage {
    TZImagePickerController *imagePicker = [[TZImagePickerController alloc] initWithMaxImagesCount:9 delegate:self];
    [self presentViewController:imagePicker animated:true completion:nil];
}


- (void)imagePickerController:(TZImagePickerController *)picker didFinishPickingPhotos:(NSArray<UIImage *> *)photos sourceAssets:(NSArray *)assets isSelectOriginalPhoto:(BOOL)isSelectOriginalPhoto infos:(NSArray<NSDictionary *> *)infos {
    //self.pickedImage.imageURLStringsGroup = photos;
//    取出图片之后在此操作
    self.imageArray = [photos mutableCopy];
    if ([photos count] != 0) {
        [self.selectImage qmui_removeAllSubviews];
        self.imagePicker = [[QMUIImagePreviewView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
        self.imagePicker.delegate = self;
        [self.selectImage addSubview:self.imagePicker];
    }
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
            cell.inputInfo.tag = 101 + indexPath.row;
            
            return cell;
        }else if (indexPath.row == 1){
            addCommodityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addInfoCell"];
            
            if (!cell) {
                cell = [[addCommodityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addInfoCell"];
            }
            
            cell.inputTitle.text = @"商品价格";
            cell.inputInfo.tag = 101 + indexPath.row;
            
            return cell;
        }else if (indexPath.row == 2){
            addDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addDetailCell"];
            
            if (!cell) {
                cell = [[addDetailCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"addDetailCell"];
            }
            
            cell.inputTitle.text = @"商品介绍";
            cell.inputInfo.tag = 101 + indexPath.row;
            
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
            
            cell.inputInfo.tag = 201 + indexPath.row;
            
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


-(void)addSellAction {
    self.isSell = @1;
    [self addCommodity];
}

-(void)addStockAction {
    self.isSell = @0;
    [self addCommodity];
}


//添加商品信息
-(void)addCommodity {
    self.modelUpload = self.modelNumber;
    self.imageUpload = [self.imageArray count];
    self.infoUpload = 4;
    
//    数据收集
//    名称
    UITextField *nameInput = [self.view viewWithTag:101];
//    价格
    UITextField *priceInput = [self.view viewWithTag:102];
    NSNumber *price = [NSNumber numberWithDouble:(priceInput.text).doubleValue];
//    介绍
    UITextField *introduceInput = [self.view viewWithTag:103];
//    型号信息收集，利用一个数组来存储多个字典
    NSMutableArray *modelArray = [[NSMutableArray alloc] init];
    for (int i = 0; i < self.modelNumber; i++) {
        UITextField *modelName = [self.view viewWithTag:(201 + i * 2)];
        NSString *modelNameString = modelName.text;
        UITextField *modelNumberInput = [self.view viewWithTag:(202 + i * 2)];
        NSNumber *modelNumber = [NSNumber numberWithInteger:(modelNumberInput.text).integerValue];
        NSDictionary *modelInfo = @{@"commodityModel":modelNameString, @"stockNumber":modelNumber};
        
        [modelArray addObject:modelInfo];
    }
    
//    首先是上传商品信息
    NSDictionary *commodityParams = @{@"descriptionInfo": introduceInput.text,
                                      @"name": nameInput.text,
                                      @"price": price,
                                      @"isSell": self.isSell,
                                      @"reviewStatus": @1,
                                      @"salesValume": @0,
                                      @"shopId": @"5cc1218ad5de2b007361e392"
                                      };
    [AVCloud callFunctionInBackground:@"addCommodity" withParameters:commodityParams block:^(id  _Nullable object, NSError * _Nullable error) {
        if (error == nil) {
            if ([[object valueForKey:@"success"] boolValue]) {
                NSString *commodityId = [[object valueForKey:@"result"] valueForKey:@"objectId"];
                
                self.infoUpload--;
                
//                商品信息上传成功之后接着上传图片和库存
                NSLog(@"商品信息上传完成，商品id为%@",commodityId);
                //return;
                
                //[self addImageWith:commodityId];
                [self setMainImage:self.imageArray[0] withCommodityId:commodityId];
                
                [self addStockWith:commodityId infoDictionary:modelArray];
            }else {
                [SVProgressHUD showErrorWithStatus:@"添加商品信息失败，请稍后再试"];
            }
        }else {
            [SVProgressHUD showErrorWithStatus:@"添加出错"];
        }
    }];
    
}


//上传图片
-(void)addImageWith:(NSString *)commodityId {
    //self.imageUpload = [self.imageArray count];
    
    dispatch_queue_t myQueue = dispatch_queue_create("imageUpload.muziruo.com", DISPATCH_QUEUE_SERIAL);
    
    for (int i = 1; i < [self.imageArray count]; i++) {
        NSData *imageData = [self.imageArray[i] sd_imageData];
        
        AVFile *imageFile = [AVFile fileWithData:imageData name:@"image.jpg"];
        
        [imageFile uploadWithCompletionHandler:^(BOOL succeeded, NSError * _Nullable error) {
            if (error == nil) {
                
                NSDictionary *params = @{
                                         @"commodityId":commodityId,
                                         @"imageUrl":imageFile.url,
                                         @"imageId":imageFile.objectId
                                         };
                
                [AVCloud callFunctionInBackground:@"addImage" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
                    if (error == nil) {
                        if ([object valueForKey:@"success"]) {
                            
                            dispatch_barrier_sync(myQueue, ^{
                                self.imageUpload--;
                            });
                            
                            if (self.imageUpload == 0) {
//                                图片上传完成
                                NSLog(@"图片上传完成");
                                self.infoUpload--;
                                
                                if (self.infoUpload == 0) {
                                    [SVProgressHUD showSuccessWithStatus:@"上传成功"];
                                    [SVProgressHUD dismissWithDelay:1.0];
                                    [self.navigationController popViewControllerAnimated:true];
                                }
                            }
                        }
                    }
                }];
            }
        }];
    }
}


//上传库存
-(void)addStockWith:(NSString *)commodityId infoDictionary:(NSArray *)modelInfoArray{
    for (int i = 0; i < self.modelNumber; i++) {
        NSDictionary *modelInfo = modelInfoArray[i];
        
        dispatch_queue_t myQueue = dispatch_queue_create("modelUpload.muziruo.com", DISPATCH_QUEUE_SERIAL);
        
        NSDictionary *params = @{
                                 @"stockNumber": [modelInfo valueForKey:@"stockNumber"],
                                 @"commodityModel": [modelInfo valueForKey:@"commodityModel"],
                                 @"price": @2333,
                                 @"commodityId":commodityId
                                 };
        
        [AVCloud callFunctionInBackground:@"addStock" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
            if (error == nil) {
                if ([object valueForKey:@"success"]) {
                    
                    dispatch_barrier_sync(myQueue, ^{
                        self.modelUpload--;
                    });
                    
                    if (self.modelUpload == 0) {
//                                上传完成
                        NSLog(@"型号上传完成");
                        self.infoUpload--;
                        if (self.infoUpload == 0) {
                            [SVProgressHUD showSuccessWithStatus:@"上传信息完成"];
                            [SVProgressHUD dismissWithDelay:1.0];
                            [self.navigationController popViewControllerAnimated:true];
                        }
                    }
                }
            }
        }];
    }
}



//上传主图
-(void)setMainImage:(UIImage *)mainImage withCommodityId:(NSString *)commodityId {
    NSData *imageData = mainImage.sd_imageData;
    AVFile *imageFile = [AVFile fileWithData:imageData name:@"image.jpg"];
    
    [imageFile uploadWithCompletionHandler:^(BOOL succeeded, NSError * _Nullable error) {
        if (error == nil) {
//            AVObject *commodity = [AVObject objectWithClassName:@"commodityInfo" objectId:commodityId];
//            [commodity setObject:imageFile.url forKey:@"mainImage"];
//            //[commodity setValue:imageFile.url forKey:@"mainImage"];
//            [commodity saveInBackgroundWithBlock:^(BOOL succeeded, NSError * _Nullable error) {
//                if (error == nil) {
//                    NSLog(@"主图设置成功");
//                }
//            }];
            NSDictionary *setMainParams = @{@"imageUrl": imageFile.url, @"commodityId": commodityId};
            [AVCloud callFunctionInBackground:@"setMainImage" withParameters:setMainParams block:^(id  _Nullable object, NSError * _Nullable error) {
                
            }];
            
            self.imageUpload--;
            self.infoUpload--;
            
            NSDictionary *params = @{
                                     @"commodityId":commodityId,
                                     @"imageUrl":imageFile.url,
                                     @"imageId":imageFile.objectId
                                     };
            
            [AVCloud callFunctionInBackground:@"addImage" withParameters:params block:^(id  _Nullable object, NSError * _Nullable error) {
                if (error == nil) {
                    if ([object valueForKey:@"success"]) {
                        
                        [self addImageWith:commodityId];
                    }
                }
            }];
        }
    }];
}


@end
