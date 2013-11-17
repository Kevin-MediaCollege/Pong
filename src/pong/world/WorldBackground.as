package pong.world {
	import flash.display.Sprite;
	import pong.Main;
	import pong.display.sAddChild;
	import pong.Game;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class WorldBackground extends Sprite {
		public static const BACKGROUND_BASE:Sprite = new art_BackgroundBase();
		
		public static const BACKGROUND_OVERLAY:Vector.<Sprite> = new <Sprite> [new art_BackgroundOverlay1(), new art_BackgroundOverlay2()];
		
		public function WorldBackground() {
			sAddChild(BACKGROUND_BASE, Game.main);
			
			for (var i:int = 0; i < BACKGROUND_OVERLAY.length; i++) {
				sAddChild(BACKGROUND_OVERLAY[i], Game.main);
				
				BACKGROUND_OVERLAY[i].y = i * BACKGROUND_OVERLAY[i].height;
			}
		}
		
		/**
		 * Update backgrounds
		 */
		public function update():void {
			for (var i:int = 0; i < BACKGROUND_OVERLAY.length; i++) {
				BACKGROUND_OVERLAY[i].y--;
				
				if (BACKGROUND_OVERLAY[i].y < -BACKGROUND_OVERLAY[i].height) {
					BACKGROUND_OVERLAY[i].y = BACKGROUND_OVERLAY[i].height;
				}
			}	
		}
	}
}