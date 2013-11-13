package pong.utils.geom {
	
	/**
	 * @since 31/10/2013
	 * @author Kevin Krol 
	 */
	
	/**
	 * Calculate the next X value based on the speed and direction
	 * @param x
	 * @param direction
	 * @param speed
	 * @return the next X value
	 */
	public function nextX(x:Number, direction:Number, speed:Number):Number {
		return x + (speed * Math.cos(direction * Math.PI / 180.0));
	}
}
