/**
 * Created with IntelliJ IDEA.
 * User: Mark Elissen
 * Date: 17-12-12
 * Time: 11:27
 * To change this template use File | Settings | File Templates.
 */
package {
import flash.geom.Point;

import starling.display.DisplayObject;
import starling.display.Sprite;
import starling.events.Event;
import starling.events.Touch;
import starling.events.TouchEvent;
import starling.events.TouchPhase;

public class Game extends Sprite {
    private var customSprite:CustomSprite;
    private var mouseX:Number = 0;
    private var mouseY:Number = 0;

    public function Game() {
        addEventListener(Event.ADDED_TO_STAGE, onAdded);
    }

    private function onAdded(e:Event):void {
        // create the custom sprite
        customSprite = new CustomSprite(200, 200);

        // position it by default in the center of the stage
        customSprite.x = stage.stageWidth >> 1;
        customSprite.y = stage.stageHeight >> 1;

        // show it
        addChild(customSprite);

        // we listen to the mouse movement on the stage
        stage.addEventListener(TouchEvent.TOUCH, onTouch);

        // update on every frame
        stage.addEventListener(Event.ENTER_FRAME, onFrame);

        // when the sprite is touched
        customSprite.addEventListener(TouchEvent.TOUCH, onTouchedSprite)
    }

    private function onFrame(e:Event):void {
        // easing on the custom sprite position
        customSprite.x -= (customSprite.x - mouseX) * .1;
        customSprite.y -= (customSprite.y - mouseY) * .1;

        // we update our custom sprite
        customSprite.update();
    }

    private function onTouch(e:TouchEvent):void {
        // get the mouse location related to the stage
        var touch:Touch = e.getTouch(stage);
        var pos:Point = touch.getLocation(stage);

        // store the mouse coordinates
        mouseX = pos.x;
        mouseY = pos.y;
    }

    private function onTouchedSprite(e:TouchEvent):void {
        // get the touch points
        var touch:Touch = e.getTouch(stage);
        var clicked:DisplayObject = e.currentTarget as DisplayObject;

        // detect the click/release phase
        if (touch.phase == TouchPhase.ENDED) {
            // remove the clicked object
            removeChild(clicked, true);
        }
    }
}
}
