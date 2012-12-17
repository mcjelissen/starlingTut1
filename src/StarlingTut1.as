/**
 * Created with IntelliJ IDEA.
 * User:    Mark Elissen
 * Date:    17-12-12
 * Time:    12:00
 */
package {

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.ui.GameInput;

import starling.core.Starling;

[SWF(width="1280", height="752", frameRate="60", backgroundColor="#002143")]
    public class StarlingTut1 extends Sprite {

        private var mStarling:Starling;

        public function StarlingTut1() {
            stage.align = StageAlign.TOP_LEFT;
            stage.scaleMode = StageScaleMode.NO_SCALE;

            // create our starling instance
            mStarling = new Starling(Game, stage);
            mStarling.showStats = true;

            // set anti-aliasing (the higher the better but slower performance
            mStarling.antiAliasing = 1;

            // start it!
            mStarling.start();
        }
    }
}
