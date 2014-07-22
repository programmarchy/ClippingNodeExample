ClippingNodeExample
===================

A CCClippingNode example illustrated by a sliding door effect using SpriteBuilder.

![iOS Simulator](https://github.com/programmarchy/ClippingNodeExample/blob/master/Assets/Simulator.png)

A circle is used as the clipping region, inside which two rectangular doors slide open, creating a sliding door effect. Touching the screen opens or closes the doors.

The CCClippingNode is placed in the scene as a sibling to the circle sprite, whose alpha channel will be used as the clipping stencil.

![SpriteBuilder](https://github.com/programmarchy/ClippingNodeExample/blob/master/Assets/SpriteBuilder.png)

The doors are added as children to the CCClippingNode. The parts of the door outside the circle clipping stencil will not be visible.

In the scene's `didLoadFromCCB`, the circle sprite is assigned to the CCClippingNode's stencil:

```
- (void)didLoadFromCCB
{
    self.clippingNode.stencil = self.myCircle;
    self.clippingNode.alphaThreshold = 0.25;
}
```
