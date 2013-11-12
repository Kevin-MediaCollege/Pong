package pong.utils.geom {
	
	/**
	 * Direction.as
	 * @since 31/10/2013
	 * @author Kevin Krol 
	 * @version 1.0
	 */
	public class Direction {
		public static const UP:uint = 1;
		public static const DOWN:uint = 2;
		public static const LEFT:uint = 4;
		public static const RIGHT:uint = 8;
		
		public static const TOP:uint = UP;
		public static const BOTTOM:uint = DOWN;
		
		public static const NORTH:uint = UP;
		public static const SOUTH:uint = DOWN;
		public static const WEST:uint = LEFT;
		public static const EAST:uint = RIGHT;
		
		public static const NONE:uint = 0;
		public static const ALL:uint = UP | DOWN | LEFT | RIGHT;
	}
}
