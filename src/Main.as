package
{
	import brotherhood.Brotherhood;
	import flash.desktop.NativeApplication;
	import flash.display.Sprite;
	import flash.display.StageDisplayState;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.FullScreenEvent;
	import flash.system.System;
	import nemostein.intro.IntroSequence;
	
	[SWF(width=1280,height=720,backgroundColor="#000000",frameRate="60")]
	
	public class Main extends Sprite
	{
		private var _introSequence:IntroSequence;
		
		public function Main():void
		{
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.displayState = StageDisplayState.FULL_SCREEN_INTERACTIVE;
			stage.addEventListener(FullScreenEvent.FULL_SCREEN, onStageFullScreen);
			
			addEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onStageFullScreen(event:FullScreenEvent):void 
		{
			if (!event.activating)
			{
				NativeApplication.nativeApplication.exit();
			}
		}
		
		private function onAddedToStage(event:Event = null):void
		{
			removeEventListener(Event.ADDED_TO_STAGE, onAddedToStage);
			
			_introSequence = new IntroSequence(onIntroSequenceComplete);
			
			// test
			//_introSequence.addIntro(new SponsorIntro());
			//_introSequence.addIntro(new DeveloperIntro());
			//_introSequence.addIntro(new GameIntro());
			
			addChild(_introSequence);
			
			_introSequence.start();
		}
		
		private function onIntroSequenceComplete():void
		{
			removeChild(_introSequence);
			
			ClassRegistry.register();
			
			var game:Brotherhood = new Brotherhood();
			game.start(stage);
			game.showFps();
		}
	}
}