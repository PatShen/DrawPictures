//
//  DPPainter.h
//  DrawPictures
//
//  Created by Shen Wenxin on 2017/11/22.
//  Copyright © 2017年 NanJing HOGE Software Co., Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DPPainter : NSObject

/**
 画图，纯色背景+底部1像素高的线

 @param fillColor 填充色
 @param lineColor 底部线色
 */
- (id)drawImage:(UIColor*)fillColor
bottomLineColor:(UIColor*)lineColor;

@end
