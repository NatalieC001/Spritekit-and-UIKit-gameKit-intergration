//
//  ProgressDataManager.m
//  IgorBizi@mail.ru
//
//  Created by IgorBizi@mail.ru on 10/27/15.
//  Copyright © 2015 IgorBizi@mail.ru. All rights reserved.
//

#import "BIZProgressViewHandler.h"
#import "BIZCircularProgressView.h"


@interface BIZProgressViewHandler ()
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic) CGFloat min;
@property (nonatomic) CGFloat max;
@property (nonatomic) CGFloat current;
@property (nonatomic, strong) BIZCircularProgressView *progressView;
@property (nonatomic) CGFloat updateSpeed;

@end


@implementation BIZProgressViewHandler
@synthesize countDownDidFinish;

- (instancetype)initWithProgressView:(BIZCircularProgressView *)progressView minValue:(CGFloat)min maxValue:(CGFloat)max
{
    if (self = [super init]) {
        _progressView = progressView;
        _min = min;
        _max = max;
        _current = max;
        countDownDidFinish = NO;
        self.liveProgress = NO;
        [self updateTextToCurrentProgress];
    }
    return self;
}

- (void)setLiveProgress:(BOOL)liveProgress
{
    _liveProgress = liveProgress;
    self.updateSpeed = liveProgress ? 0.1 : 1.0;
}

- (void)start
{
    if (self.timer) {
        [self stop];
    }
    countDownDidFinish = NO;
    self.current = self.max;
    self.progressView.progress = 1.0;
    [self updateTextToCurrentProgress];
    [self performSelector:@selector(runTicTimer) withObject:nil afterDelay:0.25];
}
-(void)addBonus:(float)myFloat
{
   self.current = _current+myFloat;
//    if (self.current >= self.max)
//    {
//        NSLog(@"dont add more bonus points but set to max time @%f",self.current);
//        self.current = self.max;
//        NSLog(@"= max @%f",self.current);
//    }
   [self updateTextToCurrentProgress];
}

- (void)runTicTimer
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.updateSpeed target:self selector:@selector(ticTimer) userInfo:nil repeats:YES];
}

- (void)stop
{
    [self.timer invalidate];
    self.timer = nil;
    
    //Hide the text when finished
    //self.progressView.text = nil;
    
   // self.progressView.text = @"Game Over!";
    if (self.delegate && [self.delegate respondsToSelector:@selector(progressViewHandler:didFinishProgressForProgressView:)]) {
        [self.delegate progressViewHandler:self didFinishProgressForProgressView:self.progressView];
        
        NSLog(@"Timer stopped time up, add BOOL Here");
        
    }
     countDownDidFinish = YES;
}

-(void)setTimerText:(NSString*)myText
{
    self.progressView.text =myText;
  
}
- (void)ticTimer
{
    self.current -= self.updateSpeed;
    
    CGFloat progress = self.current / self.max;

    self.progressView.progress = progress;
    [self updateTextToCurrentProgress];
    
    // * Time is over
    if (self.current <= self.min) {
        [self stop];
    }
    
    if (self.delegate && [self.delegate respondsToSelector:@selector(progressViewHandler:currentProgress:withProgressView:)]) {
        [self.delegate progressViewHandler:self currentProgress:progress withProgressView:self.progressView];
    }
}

- (void)updateTextToCurrentProgress
{
    self.progressView.text = [NSString stringWithFormat:@"%ld", (long)ceil(self.current)];
}

@end
