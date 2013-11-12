package pong.display {
	import flash.display.DisplayObject;
	import flash.display.DisplayObjectContainer;
	
	/**
	 * addChild.as
	 * @since 31/10/2013
	 * @author Kevin Krol 
	 * @version 1.0
	 */
	
	/**
	 * Add a child to the stage
	 * @param child
	 * @param parent
	 * @param atIndex
	 * @return true if the child has been successfully added
	 */
	public function sAddChild(child:DisplayObject, parent:DisplayObjectContainer, atIndex:int = -1):Boolean {
		if(child && parent) {
			if(atIndex < 0 || atIndex > parent.numChildren) {
				atIndex = parent.numChildren;
			}
			
			parent.addChildAt(child, atIndex);
			return true;
		}
		
		return false;
	}	
}
