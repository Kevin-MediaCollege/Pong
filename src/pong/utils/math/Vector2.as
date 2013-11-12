package pong.utils.math {
	import flash.geom.Vector3D;
	
	/**
	 * @since 31/10/2013
	 * @author Kevin Krol 
	 */
	public class Vector2 {
		public static const ZERO:Vector2 = new Vector2(0, 0);
		
		private var x:Number;
		private var y:Number;
		
		public function Vector2(x:Number = 0, y:Number = 0) {
			this.x = x;
			this.y = y;
		}
		
		/**
		 * Clone the Vector2
		 * @return a new Vector2 with the same values
		 */
		public function clone():Vector2 {
			return new Vector2(x, y);
		}
		
		/**
		 * @return the total length of the vector2
		 */
		public function length():Number {
			return Number(Math.sqrt(x * x + y * y));
		}
	
		/**
		 * @return the dot product of this vector2 and the specified vector2
		 */
		public function dot(r:Vector2):Number {
			return x * r.getX() + y * r.getY();
		}
	
		/**
		 * Normalize the vector2
		 * @return a normalized vector2
		 */
		public function normalized():Vector2 {
			var length:Number = length();
			
			return new Vector2(x / length, y / length);
		}
		
		/**
		 * Rotate the vector2 around the specified angle
		 * @param angle
		 * @return a vector2 that has been rotated around the angle
		 */
		public function rotate(angle:Number):Vector2 {
			var rad:Number = angle * Math.PI / 180;
			var cos:Number = Math.cos(rad);
			var sin:Number = Math.sin(rad);
			
			return new Vector2((x * cos - y * sin),(x * sin + y * cos));
		}
	
		/**
		 * Add the specified vector2 to this vector2
		 * @param r
		 * @return the new Vector2
		 */
		public function add(r:Vector2):Vector2 {
			return new Vector2(x + r.getX(), y + r.getY());
		}
	
		/**
		 * Subtract the specified vector2 from this vector2
		 * @param r
		 * @return the new Vector2
		 */
		public function sub(r:Vector2):Vector2 {
			return new Vector2(x - r.getX(), y - r.getY());
		}
	
		/**
		 * Multiply the specified vector2 with this vector2
		 * @param r
		 * @return the new Vector2
		 */
		public function mul(r:Vector2):Vector2 {
			return new Vector2(x * r.getX(), y * r.getY());
		}
		
		/**
		 * Divide the specified vector2 from this vector2
		 * @param r
		 * @return the new Vector2
		 */
		public function div(r:Vector2):Vector2 {
			return new Vector2(x / r.getX(), y / r.getY());
		}
	
		/**
		 * @return the absolute value of this Vector2
		 */
		public function abs():Vector2 {
			return new Vector2(Math.abs(x), Math.abs(y));
		}
	
		/**
		 * Set the X value of this Vector2
		 * @param x
		 */
		public function setX(x:Number):void {
			this.x = x;
		}
	
		/**
		 * Set the Y value of this Vector2
		 * @param y
		 */
		public function setY(y:Number):void {
			this.y = y;
		}
	
		/**
		 * @return the X value of this Vector2
		 */
		public function getX():Number {
			return x;
		}

		/**
		 * @return the Y value of this Vector2
		 */
		public function getY():Number {
			return y;
		}
	}
}