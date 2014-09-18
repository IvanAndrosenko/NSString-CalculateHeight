//
//  NSString+CalculateHeight.h
//
//  Created by Иван on 18/07/14.
//  Copyright (c) 2014 iQDesk. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CalculateHeight)
-(CGFloat)getHeightOfFont:(UIFont *)textFont widht:(CGFloat)textWidth;
-(CGFloat)getWidthOfFont:(UIFont *)textFont height:(CGFloat)textHeight;

@end
