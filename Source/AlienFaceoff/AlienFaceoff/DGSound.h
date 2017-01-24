

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface DGSound : NSObject{
    SystemSoundID buttonSoundID;
    SystemSoundID selectSoundID;
    SystemSoundID shotSoundID;
}

-(void)initSound;
-(void)playButtonSound;
-(void)playSelectSound;
-(void)playShotSound;

@end
