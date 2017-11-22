//
//  DPPainter.m
//  DrawPictures
//
//  Created by Shen Wenxin on 2017/11/22.
//  Copyright © 2017年 NanJing HOGE Software Co., Ltd. All rights reserved.
//

#import "DPPainter.h"

@interface DPPainter () {
    CGRect canvasRect_;
}

@end

@implementation DPPainter

- (instancetype)init {
    self = [super init];
    if (self) {
        canvasRect_ = CGRectMake(0, 0, 20, 20);
    }
    return self;
}

- (id)drawImage:(UIColor*)fillColor
bottomLineColor:(UIColor*)lineColor {
    CGSize size = canvasRect_.size;
    
    UIGraphicsBeginImageContextWithOptions(size, NO, [[UIScreen mainScreen] scale]);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    // 绘制填充色
    CGContextSetFillColorWithColor(ctx, fillColor.CGColor);
    CGContextFillRect(ctx, canvasRect_);
    // 设置线宽
    CGContextSetLineWidth(ctx, 1.0f);
    // 线色
    CGContextSetStrokeColorWithColor(ctx, lineColor.CGColor);
    // 画线
    CGFloat x = canvasRect_.origin.x;
    CGFloat y = canvasRect_.origin.y+canvasRect_.size.height;
    CGContextMoveToPoint(ctx, x, y);
    x = canvasRect_.size.width;
    CGContextAddLineToPoint(ctx, x, y);
    CGContextDrawPath(ctx, kCGPathEOFillStroke);
    
    UIImage* image = UIGraphicsGetImageFromCurrentImageContext();
    NSData* data = UIImagePNGRepresentation(image);
    NSString* cachePath = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES)[0];
    NSString* name = @"image_bottom_line.png";
    NSString* path = [cachePath stringByAppendingPathComponent:name];
    [data writeToFile:path atomically:NO];
    
    UIGraphicsEndImageContext();
    
    return image;
}

@end
