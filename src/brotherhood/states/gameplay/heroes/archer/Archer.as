package brotherhood.states.gameplay.heroes.archer
{
	import brotherhood.states.gameplay.heroes.archer.arrows.CommonArrow;
	import brotherhood.states.gameplay.heroes.Hero;
	import brotherhood.states.gameplay.heroes.skills.archer.Arrow;
	import brotherhood.states.gameplay.heroes.skills.archer.ArrowShower;
	import brotherhood.states.gameplay.heroes.skills.archer.Overheated;
	import brotherhood.states.gameplay.heroes.skills.archer.Overweighted;
	import brotherhood.states.gameplay.heroes.skills.archer.PiercingArrow;
	import brotherhood.states.gameplay.heroes.skills.Skill;
	import brotherhood.states.gameplay.heroes.skills.Upgrade;
	
	public class Archer extends Hero
	{
		public function Archer(slot:String)
		{
			super(slot);
		}
		
		override protected function initialize():void
		{
			super.initialize();
			
			frame.y = 50;
			
			skills.push(new Arrow());
			skills.push(new Overheated());
			skills.push(new Upgrade());
			skills.push(new Overweighted());
			skills.push(new ArrowShower());
			skills.push(new PiercingArrow());
		}
		
		public function shoot():void
		{
			add(new CommonArrow(this));
		}
	}
}