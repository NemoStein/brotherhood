package brotherhood.states.gameplay.heroes.skills.archer 
{
	public class ArrowShower extends ArcherSkill 
	{
		
		public function ArrowShower() 
		{
			delay = 4;
		}
		
		override public function activate():void 
		{
			if(ready)
			{
				for (var i:int = 0; i < 25; i++) 
				{
					archer.shoot();
				}
			}
			
			super.activate();
		}
	}
}