package pong.obstacles {
	import flash.display.Sprite;

	/**
	 * @author pepi
	 */
	public class Platform extends Sprite {
		protected var wall:Sprite = new Sprite();

		protected function Draw():void {
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
