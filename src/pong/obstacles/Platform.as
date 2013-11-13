package pong.obstacles {
	import flash.display.Sprite;
	import flash.events.Event;

	/**
	 * @author pepi
	 */
	public class Platform extends Sprite {
		private var wall:Sprite = new Sprite();
		
		public function Platform() {
			Draw();
			
			addChild(wall);
			
			addEventListener(Event.ENTER_FRAME, test);
		}

		private function test(e:Event) : void {
			if (wall.hitTestPoint(mouseX, mouseY, true)) {
				trace("HIT");
			}
		}

		private function Draw() : void {
			wall.graphics.lineStyle(1, 0XFF5555);
			wall.graphics.beginFill(0XFF3333);
			
			wall.graphics.lineTo(100, 0);
			wall.graphics.lineTo(100, 10);
			wall.graphics.lineTo(0, 10);
			wall.graphics.lineTo(0, 0);
			
			wall.graphics.endFill();
		}
	}
}
