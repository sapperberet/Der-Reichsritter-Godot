extends Area2D

@onready var game_manager = %GameManager

@onready var pickupsound = $pickup
@onready var animated_sprite_2d = $AnimatedSprite2D


#func _on_body_entered(body):
#
#	if(body.name == "PPlayer"):
#		#animated_sprite_2d.queue_free()
#		game_manager.add_point()
#		queue_free()
#		pickupsound.play( )
#		await pickupsound.finished

func _on_body_entered(body):
  
	if body.name == "PPlayer":  # Replace with your player's node name
		if pickupsound:
			pickupsound.play()  # Play the sound
			
			# Hide the item visually so it appears "picked up"
			#visible = false
			
			# Disable the collision so it can't be picked up again
			#$CollisionShape2D.disabled = true
			position.x+=1000
			# Connect the `finished` signal to the `_on_sound_finished` method
			pickupsound.finished.connect(_on_sound_finished)
			game_manager.add_point()
		# Add pickup logic (e.g., inventory, score)
		

func _on_sound_finished():
	queue_free()  
