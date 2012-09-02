package  
{
	import brotherhood.states.gameplay.heroes.crosshair.Crosshair;
	import brotherhood.system.EntityService;
	import flash.geom.Point;
	import nemostein.framework.dragonfly.Core;
	import nemostein.io.Keys;
	
	public class Controls extends Core
	{
		
		static public var P1_GA:int = Keys.U;
		static public var P1_GB:int = Keys.J;
		static public var P1_BA:int = Keys.I;
		static public var P1_BB:int = Keys.K;
		static public var P1_RA:int = Keys.O;
		static public var P1_RB:int = Keys.L;
		static public var P1_U:int = Keys.W;
		static public var P1_D:int = Keys.S;
		static public var P1_L:int = Keys.A;
		static public var P1_R:int = Keys.D;
		static public var P1_S:int = Keys.NUMBER_9;
		
		/*static public var P2_GA:String = Keys.;
		static public var P2_GB:String = Keys.;
		static public var P2_BA:String = Keys.;
		static public var P2_BB:String = Keys.;
		static public var P2_RA:String = Keys.;
		static public var P2_RB:String = Keys.;
		static public var P2_U:String = Keys.
		static public var P2_D:String = Keys.;
		static public var P2_L:String = Keys.;
		static public var P2_R:String = Keys.;
		static public var P2_S:String = Keys.;*/
		
		override protected function initialize():void 
		{
			super.initialize();
		}
		
		override protected function update():void 
		{
			var p1Crosshair:Crosshair = EntityService.player1Crosshair;
			var p1CrosshairDestination:Point = p1Crosshair.destination;
			
			var p2Crosshair:Crosshair = EntityService.player1Crosshair;
			var p2CrosshairDestination:Point = p1Crosshair.destination;
			
			if (input.pressed(P1_U))
			{
				p1CrosshairDestination.y = -Infinity;
				
			}
			else if(input.pressed(P1_D))
			{
				p1CrosshairDestination.y = Infinity;
			}
			else
			{
				p1CrosshairDestination.y = EntityService.player1Crosshair.y;
			}
			
			if (input.pressed(P1_L))
			{
				p1CrosshairDestination.x = -Infinity;
			}
			else if(input.pressed(P1_R))
			{
				p1CrosshairDestination.x = Infinity;
			}
			else
			{
				p1CrosshairDestination.x = EntityService.player1Crosshair.x;
			}
			
			var distanceX:Number = p1CrosshairDestination.x - EntityService.player1Crosshair.x;
			var distanceY:Number = p1CrosshairDestination.y - EntityService.player1Crosshair.y;
			
			if (distanceX || distanceY)
			{
				var moveSpeed:Number = p1Crosshair.speed * time;
				
				var moveAngle:Number = Math.atan2(distanceY, distanceX);
				
				var moveX:Number = Math.cos(moveAngle) * moveSpeed;
				var moveY:Number = Math.sin(moveAngle) * moveSpeed;
				
				if (distanceX > 0 && distanceX < moveX || distanceX < 0 && distanceX > moveX)
				{
					moveX = distanceX;
				}
				
				if (distanceY > 0 && distanceY < moveY || distanceY < 0 && distanceY > moveY)
				{
					moveY = distanceY;
				}
				
				EntityService.player1Crosshair.x += moveX;
				EntityService.player1Crosshair.y += moveY;
				
				EntityService.player2Crosshair.x += moveX;
				EntityService.player2Crosshair.y += moveY;
			}
			
			if (input.justPressed(P1_GA))
			{
				EntityService.archer.useSkill(1);
				EntityService.wizard.useSkill(1);
			}
			
			super.update();
		}
	}

}