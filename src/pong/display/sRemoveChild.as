package pong.display {
	import flash.display.DisplayObjectContainer;
	import flash.display.DisplayObject;

	/**
	 * removeChild.as
	 * @since 31/10/2013
	 * @author Kevin Krol 
	 * @version 1.0
	 */
	
	/**
	 * Remove a child from the stage
	 * @param child
	 * @param parent
	 * @return the child if it has been removed successfully
	 */
	public function sRemoveChild(child:DisplayObject, parent:DisplayObjectContainer):DisplayObject {
		if(child) {
			if(!parent) {
				if(!child.parent) {
					return null;
				}
				
				parent = child.parent;
			}
			
			if(parent == child.parent) {
				parent.removeChild(child);
				return child;
			}
		}
		
		return null;
	}
}
