package hxE.systems;
import hxE.Demand;
import hxE.Entity;
import hxE.EntitySystem;

/**
 * ...
 * @author P Svilans
 */
class EntityProcessingSystem extends EntitySystem
{

	public function new( demand:Demand, maxComponents: Int) 
	{
		super( demand, maxComponents);
	}
	
	@final
	override public function processEntities(entitiesToProcess:Iterable<Entity>):Void 
	{
		for ( e in entitiesToProcess)
		{
			processEntity( e);
		}
	}
	
	/**
	 * Override this to process on an entity by entity basis!
	 * @param	e
	 */
	
	private function processEntity( e:Entity):Void
	{
		
	}
	
}