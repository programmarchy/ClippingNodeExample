//
//  MainScene.m
//  ClippingNodeExample
//
//  Created by Donald Ness on 10/10/13.
//

#import "MainScene.h"

@interface MainScene ()

@property (assign, nonatomic, getter=isOpen) BOOL open;
@property (strong, nonatomic) CCSprite *myCircle;
@property (strong, nonatomic) CCSprite *myLeftDoor;
@property (strong, nonatomic) CCSprite *myRightDoor;
@property (strong, nonatomic) CCClippingNode *clippingNode;

@end

@implementation MainScene

- (void)didLoadFromCCB
{
    NSLog(@"%@ %@", NSStringFromCGPoint(self.myCircle.position), NSStringFromCGPoint(self.clippingNode.position));
    self.clippingNode.stencil = self.myCircle;
    self.clippingNode.alphaThreshold = 0.25;
}

- (BOOL)isUserInteractionEnabled
{
    return YES;
}

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    [super touchBegan:touch withEvent:event];
    [self setOpen:!self.isOpen];
}

- (void)setOpen:(BOOL)open
{
    if (open != _open) {
        CCAnimationManager *animationManager = self.userObject;
        [animationManager runAnimationsForSequenceNamed:(open ? @"Open Doors" : @"Close Doors")];
        _open = open;
    }
}

@end
