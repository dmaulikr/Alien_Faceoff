

#import "DGSound.h"

@implementation DGSound

-(void)initSound{
    //Init SoundID
    NSURL *buttonSoundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"buttonSound" ofType:@"mp3"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)buttonSoundURL, &buttonSoundID);
    NSURL *selectSoundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"selectSound" ofType:@"mp3"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)selectSoundURL, &selectSoundID);
    NSURL *shotSoundURL = [NSURL fileURLWithPath:[[NSBundle mainBundle] pathForResource:@"shotSound" ofType:@"mp3"]];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)shotSoundURL, &shotSoundID);
}

-(void)playButtonSound{
    if (buttonSoundID) {
        AudioServicesPlaySystemSound(buttonSoundID);
    }
    else {
        //Init new buttonSoundID
        [self initSound];
        [self playButtonSound];
    }
}

-(void)playSelectSound{
    if (selectSoundID) {
        AudioServicesPlaySystemSound(selectSoundID);
    }
    else {
        //Init new selectSoundID
        [self initSound];
        [self playSelectSound];
    }
}

-(void)playShotSound{
    if (shotSoundID) {
        AudioServicesPlaySystemSound(shotSoundID);
    }
    else {
        //Init new shotSoundID
        [self initSound];
        [self playShotSound];
    }
}

@end
