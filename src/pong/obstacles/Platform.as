package pong.obstacles {
	import flash.display.Sprite;

	/**
	 * @author pepi
	 */
	public class Platform extends Sprite {
		public function Platform():void {
			Draw();
		}

		protected function Draw():void {
			var widthRadius:int = 25;
			var heightRadius:int = 5;
			
			graphics.lineStyle(1, 0XFF5555);
			graphics.beginFill(0XFF3333);
			
			graphics.moveTo(-widthRadius, -heightRadius);
			
			graphics.lineTo(widthRadius, -heightRadius);
			graphics.lineTo(widthRadius, heightRadius);
			graphics.lineTo(-widthRadius, heightRadius);
			graphics.lineTo(-widthRadius, -heightRadius);
			
			graphics.endFill();
		}
	}
}
