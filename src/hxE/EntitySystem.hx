package hxE;

import de.polygonal.ds.BitVector;

using Lambda;

using hxE.util.BitVectorUtil;

/**
 * ...
 * @author P Svilans
 */
class EntitySystem implements IEntitySystem
{
	
	private var _world:EntityWorld;
	
	private var _require:BitVector;
	private var _reject:BitVector;
	private var demand:Demand;
	
	private var entities:List<Entity>;
	
	private var isPassive:Bool;
	
	public var slots:Array<IComponentTypeSlot>;
	
	public function new( demand:Demand, maxComponents: Int) 
	{
		this.demand = demand;
		_require = new BitVector(maxComponents);
		_reject = new BitVector(maxComponents);
		
		isPassive = false;
		
		entities = new List<Entity>();
		slots = new Array<IComponentTypeSlot>();
	}
	
	@final
	public function registerSlot( slot:IComponentTypeSlot ):Void
	{
		slots.push( slot );
	}
	
	@final
	public function __init():Void
	{
		for ( slot in slots) slot.setWorld( _world );
		
		initialize();
	}
	
	public function initialize():Void
	{
		
	}
	
	@final
	public function __dispose():Void
	{
		for ( slot in slots) slot.setWorld( null );
		
		dispose();
	}
	
	public function dispose():Void
	{
		
	}
	
	@final
	public function addEntity( e:Entity ):Void
	{
		entities.add( e );
		
		onEntityAdded( e );
	}
	
	/**
	 * Called when an entity has been added to this system!
	 * @param	e
	 */
	
	public function onEntityAdded( e:Entity):Void
	{
		
	}
	
	/**
	 * Called when an entity has been removed from this system!
	 * @param	e
	 */
	
	public function onEntityRemoved( e:Entity):Void
	{
		
	}
	
	@final
	public function updateEntity( e:Entity ):Void
	{
		if ( e.bits.contains( _require ) && _reject.contains( e.bits ) )
		{
			if ( !entities.has( e ) )
			{
				addEntity( e );
			}
		}
		else if ( entities.has( e ) )
		{
			entities.remove( e );
			onEntityRemoved( e );
		}
	}
	
	/**
	 * Clears all entities from this system! (Unstable right now)
	 */
	
	public function clear():Void
	{
		var iterator = entities.iterator();
		for ( e in iterator)
		{
			entities.remove( e );
			onEntityRemoved( e );
		}
	}
	
	/**
	 * Called when the system is to begin processing!
	 */
	
	public function onBeginProcessing():Void
	{
		
	}
	
	@final
	public function process():Void
	{
		onBeginProcessing();
		processEntities( entities );
		onEndProcessing();
	}
	
	/**
	 * Proccesses all entities!
	 * @param	entitiesToProcess
	 */
	
	public function processEntities( entitiesToProcess:Iterable<Entity>):Void
	{
		
	}
	
	/**
	 * Called after all entities have been processed
	 */
	
	public function onEndProcessing():Void
	{
		
	}
	
	@final
	public function canProcess():Bool
	{
		return !isPassive && checkProcessing();
	}
	
	@final
	public function setPassive( isPassive:Bool):Void
	{
		this.isPassive = isPassive;
	}
	
	@final
	public function getPassive():Bool
	{
		return isPassive;
	}
	
	/**
	 * Returns if this entity system should process!
	 * @return
	 */
	
	public function checkProcessing():Bool
	{
		return true;
	}
	
	/**
	 * Called when this system is destroyed
	 */
	
	public function destroy():Void
	{
		
	}
	
	private function get_world():EntityWorld 
	{
		return _world;
	}
	
	private function set_world(world:EntityWorld):EntityWorld 
	{
		if ( world != null)
		{
			_require.clearAll();
			for ( r in demand._require) _require.set( world.componentManager.getType( r).id);
			
			_reject.clearAll();
			_reject.flip();
			for ( r in demand._reject) _reject.clear( world.componentManager.getType( r).id);
		}
		
		return _world = world;
	}
	
	public var world(get_world, set_world):EntityWorld;
	
}