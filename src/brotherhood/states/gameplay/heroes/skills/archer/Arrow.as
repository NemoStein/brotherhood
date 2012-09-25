package brotherhood.states.gameplay.heroes.skills.archer 
{
	public class Arrow extends ArcherSkill 
	{
		public function Arrow() 
		{
			delay = 0.1;
		}
		
		override public function activate():void 
		{
			if(ready)
			{
				archer.shoot();
			}
			
			super.activate();
		}
	}
}