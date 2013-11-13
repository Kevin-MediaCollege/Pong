package pong.obstacles {
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author pepi
	 */
	public class Platform extends Sprite {
		private var wall:Sprite = new Sprite();
		private var testObj:Sprite = new Sprite();
		
		public function Platform() {
			Draw();
			
			addChild(wall);
			addChild(testObj);
			
			addEventListener(Event.ENTER_FRAME, test);
		}

		private function test(e:Event) : void {
			//var l:int = hitTestArray.length;
			
			testObj.x = mouseX - testObj.width / 2;
			testObj.y = mouseY - testObj.height / 2;
			
			if (wall.hitTestPoint(testObj.x, testObj.y, true)) {
				trace("HIT");
			}
		}

		private function Draw() : void {
			wall.graphics.lineStyle(1, 0XFF5555);
			wall.graphics.beginFill(0XFF3333);
			
			wall.graphics.lineTo(10, 0);
			wall.graphics.lineTo(10, 100);
			wall.graphics.lineTo(0, 100);
			wall.graphics.lineTo(0, 0);
			
			wall.graphics.endFill();
		}
	}
}
