/**
 * Created with IntelliJ IDEA.
 * User: Mark Elissen
 * Date: 17-12-12
 * Time: 11:27
 * To change this template use File | Settings | File Templates.
 */
package {
import starling.display.Sprite;
import starling.events.Event;

public class Game extends Sprite {
    private var customSprite:CustomSprite;

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

        // update on every frame
        stage.addEventListener(Event.ENTER_FRAME, onFrame);
    }

    private function onFrame(e:Event):void {
        // we update our custom sprite
        customSprite.update();
    }
}
}
