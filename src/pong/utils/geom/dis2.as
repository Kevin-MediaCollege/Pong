package pong.utils.geom {
	
	/**
	 * dis2.as
	 * @since 31/10/2013
	 * @author Kevin Krol 
	 * @version 1.0
	 */
	
	/**
	 * Calculate distance between two points
	 * @param x1
	 * @param y1
	 * @param x2
	 * @param y2
	 * @return the distance between the two points
	 */
	public function dis2(x1:Number, y1:Number, x2:Number, y2:Number):Number {
		return Math.sqrt((x1 - x2) * (x1 - x2) + (y1 - y2) * (y1 - y2));
	}
}
