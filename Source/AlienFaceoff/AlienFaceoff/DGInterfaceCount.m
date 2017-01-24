
#import "DGInterfaceCount.h"

@implementation DGInterfaceCount

-(CGFloat)getViewSizeWidthPersent:(int)value andView:(CGSize)size{ return ((size.width / 100) * value);}
-(CGFloat)getViewSizeHeightPersent:(int)value andView:(CGSize)size{ return ((size.height / 100) * value);}

-(NSString *)returnRandomNameBackTexture{
    int random = arc4random() % 4;
    if (random == 0) { return @"backTexture1";}
    else if (random == 1) { return @"backTexture2";}
    else if (random == 2) { return @"backTexture3";}
    else { return @"backTexture4";}
}

@end
