extends Node2D

@onready var rr = $RR
@onready var rl = $RL
@onready var animated_sprite_2d = $AnimatedSprite2D

var Speed =100
var direction = 1


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += delta*direction *Speed
	
	if(rr.is_colliding()):
		direction =-1
		animated_sprite_2d.flip_h = true
		
	if(rl.is_colliding()):
		direction =1
		animated_sprite_2d.flip_h = false
		
