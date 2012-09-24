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
		
		override public function build():void
		{
			super.build();
			
			frame.y = 50;
			
			skills[0] = new Arrow();
			skills[1] = new Overheated();
			skills[2] = new Upgrade();
			skills[3] = new Overweighted();
			skills[4] = new ArrowShower();
			skills[5] = new PiercingArrow();
			
			skillSlot.buildMeters();
		}
		
		public function shoot():void
		{
			add(new CommonArrow(this));
		}
	}
}