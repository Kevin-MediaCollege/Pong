package pong.utils.geom {
	
	/**
	 * @since 31/10/2013
	 * @author Kevin Krol 
	 */
	
	/**
	 * Calculate distance between two points
	 * @param n1
	 * @param n2
	 * @return the distance between the two points
	 */
	public function dis(n1:Number, n2:Number):Number {
		return Math.sqrt((n1-n2)*(n1-n2));
	}
}
