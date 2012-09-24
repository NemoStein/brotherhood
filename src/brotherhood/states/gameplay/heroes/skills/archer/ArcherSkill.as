package brotherhood.states.gameplay.heroes.skills.archer 
{
	import brotherhood.states.gameplay.heroes.archer.Archer;
	import brotherhood.states.gameplay.heroes.skills.Skill;
	import brotherhood.system.EntityService;
	
	public class ArcherSkill extends Skill 
	{
		protected var archer:Archer;
		
		public function ArcherSkill() 
		{
			archer = EntityService.archer;
		}
	}
}