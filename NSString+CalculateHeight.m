//
//  NSString+CalculateHeight.m
//
//  Created by Иван on 18/07/14.
//  Copyright (c) 2014 iQDesk. All rights reserved.
//

#import "NSString+CalculateHeight.h"
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

@implementation NSString (CalculateHeight)

-(CGFloat)getHeightOfFont:(UIFont *)textFont widht:(CGFloat)textWidth
{
    CGSize requiredSize;
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
        
        NSDictionary *attributes = @{ NSFontAttributeName: textFont, NSParagraphStyleAttributeName : paragraphStyle };
        
        
        CGRect rect = [self boundingRectWithSize:CGSizeMake(textWidth, CGFLOAT_MAX)
                                            options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                         attributes:attributes
                                            context:nil];
        requiredSize = rect.size;
        
    }
    else
    {
        CGSize boundingSize = CGSizeMake(textWidth, CGFLOAT_MAX);
        requiredSize = [self sizeWithFont:textFont
                           constrainedToSize:boundingSize
                               lineBreakMode:NSLineBreakByWordWrapping];
        
    }
    
    return ceilf(requiredSize.height);
}

-(CGFloat)getWidthOfFont:(UIFont *)textFont height:(CGFloat)textHeight
{
    CGSize requiredSize;
    
    if (SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(@"7.0"))
    {
        NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
        [paragraphStyle setLineBreakMode:NSLineBreakByWordWrapping];
        
        NSDictionary *attributes = @{ NSFontAttributeName: textFont, NSParagraphStyleAttributeName : paragraphStyle };
        
        
        CGRect rect = [self boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, textHeight)
                                         options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading)
                                      attributes:attributes
                                         context:nil];
        requiredSize = rect.size;
        
    }
    else
    {
        CGSize boundingSize = CGSizeMake(CGFLOAT_MAX, textHeight);
        requiredSize = [self sizeWithFont:textFont
                        constrainedToSize:boundingSize
                            lineBreakMode:NSLineBreakByWordWrapping];
        
    }
    
    return ceilf(requiredSize.width);
}


@end
