//
//  SingeSeatView.m
//  RateYourSeat
//
//  Created by Jan Erik Herrmann on 14.12.14.
//  Copyright (c) 2014 LH Hackathon. All rights reserved.
//

#import "SingleSeatView.h"

@implementation SingleSeatView
{
    CAShapeLayer *_square;
    UITapGestureRecognizer *_tapGestureRecognizer;
    BOOL _hasInitialized;
    UIColor *lufthansaBlau;
}

- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    if (!_hasInitialized && !CGRectEqualToRect(frame, CGRectZero))
        [self initializeControl];
    else if (_hasInitialized && !CGRectEqualToRect(frame, CGRectZero))
    {
        int radius = self.bounds.size.width / 2;
        _square.path = [self generateCirclePathWithRadius:radius];
        _square.position = CGPointMake(CGRectGetMidX(self.bounds) - radius, CGRectGetMidY(self.bounds) - radius);
    }
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        if (!_hasInitialized && !CGRectEqualToRect(frame, CGRectZero))
            [self initializeControl];
    }
    
    return self;
}

-(void)initializeControl
{
    int radius = self.bounds.size.width / 2;
    lufthansaBlau = [UIColor colorWithRed:0.0/255.0 green:0.0/255.0 blue:102.0/255.0 alpha:1];
    _square = [CAShapeLayer layer];
    _square.path = [self generateCirclePathWithRadius:radius];
    _square.position = CGPointMake(CGRectGetMidX(self.bounds) - radius, CGRectGetMidY(self.bounds) - radius);
    _square.fillColor = lufthansaBlau.CGColor;
    _square.strokeColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.7 alpha:1.0].CGColor;
    _square.lineWidth = self.bounds.size.width * 0.05;
    [self.layer addSublayer:_square];
    
    _tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toggleOnOff)];
    [self addGestureRecognizer:_tapGestureRecognizer];
    
    self.userInteractionEnabled = YES;
    _hasInitialized = YES;
}

-(CGPathRef)generateCirclePathWithRadius:(CGFloat)radius
{
    return [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, 2.0 * radius, 2.0 * radius) cornerRadius:radius].CGPath;
}

-(void)toggleOnOff
{
    self.on = !self.on;
}

- (void)setOn:(BOOL)on
{
    _on = on;
    if (_on)
    {
        _square.fillColor = [UIColor greenColor].CGColor;
        _square.strokeColor = [UIColor colorWithRed:0.0 green:0.75 blue:0.0 alpha:1.0].CGColor;
    }
    else
    {
        _square.fillColor = lufthansaBlau.CGColor;
        _square.strokeColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.7 alpha:1.0].CGColor;
    }
}

-(void)switchON {
    _square.fillColor = [UIColor greenColor].CGColor;
    _square.strokeColor = [UIColor colorWithRed:0.0 green:0.75 blue:0.0 alpha:1.0].CGColor;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
