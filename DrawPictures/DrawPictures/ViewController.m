//
//  ViewController.m
//  DrawPictures
//
//  Created by Shen Wenxin on 2017/11/22.
//  Copyright © 2017年 NanJing HOGE Software Co., Ltd. All rights reserved.
//

#import "ViewController.h"
#import "DPPainter.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
//    [self.view setBackgroundColor:[UIColor colorWithRed:250/255.0f green:250/255.0f blue:250/255.0f alpha:1.0f]];
//    [self.view setBackgroundColor:[UIColor redColor]];
    
    DPPainter* painter = [DPPainter new];
    
    UIColor* fileColor = [UIColor yellowColor];
    UIColor* lineColor = [UIColor colorWithRed:221/255.0f green:221/255.0f blue:221/255.0f alpha:1.0f];
    id result = [painter drawImage:fileColor bottomLineColor:lineColor];
    if ([result isKindOfClass:[UIImage class]]) {
        UIImage* image = result;
        image = [image resizableImageWithCapInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
        UIImageView* imgv = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, [UIScreen mainScreen].bounds.size.width-20, 20)];
        [imgv setContentMode:UIViewContentModeScaleAspectFit];
        [imgv setImage:image];
        [self.view addSubview:imgv];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
