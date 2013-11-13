package pong.utils.geom {
	
	/**
	 * @since 31/10/2013
	 * @author Kevin Krol 
	 */
	
	/**
	 * Calculate the next Y value based on the speed and direction
	 * @param y
	 * @param direction
	 * @param speed
	 * @return the next Y value
	 */
	public function nextY(y:Number, direction:Number, speed:Number):Number {
	 	return y + (speed * Math.sin(direction * Math.PI / 180.0));
	}
}
