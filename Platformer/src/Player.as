package
{
	import org.flixel.*;
	
	public class Player extends FlxSprite
	{
		public var leg1:Boolean;
		public var camTar:FlxObject;		

		private var offX = 110;
		private var camY = 120;

		public function Player(sprite: Class):void
		{
			loadGraphic(sprite, true, true, 14, 15);
			//SETTING ANIMATIONS
			addAnimation("idle"/*name of animation*/, [0]/*used frames*/);
			addAnimation("walk", [0, 1, 2, 1], 5/*frames per second*/);
			addAnimation("jump", [3]);
			acceleration.y = 300; //ADDING GRAVITY

			leg1 = false;

			camTar = new FlxObject;

			camTar.x = x + offX;
			camTar.y = camY;
		}
		
		override public function update():void
		{
			velocity.x = 62.5; //SET SPEED
			facing = RIGHT; //CHANGE FACING

			movement();
				
			camTar.x = x + offX;
			camTar.y = camY;

			super.update();
		}

		private function movement():void
		{
			if (touching & DOWN) {
				if (leg1 && (FlxG.keys.UP || FlxG.keys.W)) {
					velocity.y = -150;
				} else {
					play("walk");
				}
			} else {
				play("jump");
			}
		}
	}
}
