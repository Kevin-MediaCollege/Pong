package pong.physics {
	import flash.display.MovieClip;
	import pong.entity.Entity;
	import pong.entity.EntityPlayer;
	import pong.utils.geom.dis2;
	import pong.utils.math.Vector2;
	
	/**
	 * @author Kevin Krol
	 * @since 12-11-2013
	 */
	public class Physics {
		
		/**
		 * Check if the 2 points are within the specified range
		 * @param v1
		 * @param v2
		 * @param range
		 * @return true if the 2 points are within the specified range
		 */
		public static function isColliding(v1:Vector2, v2:Vector2, range:int):Boolean {
			if (dis2(v1.getX(), v1.getY(), v2.getX(), v2.getY()) < range) {
				return true;
			}
			
			return false;
		}
	}
}