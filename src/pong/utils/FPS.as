package pong.utils {
	import flash.utils.getTimer;
	
	/**
	 * FPS.as
	 * @since 31/10/2013
	 * @author Kevin Krol 
	 * @version 1.0
	 */
	public class FPS {
		private static var last:uint = getTimer();
		private static var ticks:uint = 0;
		private static var fps:Number = 0;
		
		/**
		 * Update the FPS counter
		 * @return the current FPS
		 */
		public static function update():uint {
			ticks++;
			
			var now:uint = getTimer();
			var delta:uint = now - last;
			
			if (delta >= 1000) {
				fps = ticks / delta * 1000;
				ticks = 0;
				last = now;
			}
			
			return fps;
		}
	}
}
