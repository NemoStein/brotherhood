package brotherhood
{
	import brotherhood.states.startmenu.StartMenu;
	import brotherhood.system.SystemService;
	import flash.events.Event;
	import flash.media.Sound;
	import flash.media.SoundChannel;
	import nemostein.framework.dragonfly.Game;
	
	public class Brotherhood extends Game
	{
		//private var intro:Sound;
		//private var loop:Sound;
		//private var soundChannel:SoundChannel;
		
		public function Brotherhood()
		{
			super(1280, 720);
		}
		
		override protected function initialize():void
		{	
			super.initialize();
			
			SystemService.registerGame(this);
			SystemService.changeState(StartMenu);
			
			//intro = new Assets.SoundThemesIntro;
			//loop = new Assets.SoundThemesLoop;
			//
			//soundChannel = intro.play();
			//soundChannel.addEventListener(Event.SOUND_COMPLETE, onSoundChannelSoundComplete);
		}
		
		//private function onSoundChannelSoundComplete(e:Event):void 
		//{
			//soundChannel = loop.play();
			//soundChannel.addEventListener(Event.SOUND_COMPLETE, onSoundChannelSoundComplete);
		//}
	}
}