extends CharacterBody2D

var dead = false
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var player
var chase = false
var SPEED = 1
var Jump_Speed = 200


func _ready():
	get_node("AnimatedSprite2D").play("idle")
	player = get_node("../../PPlayer")
func _physics_process(delta) :
	if  is_on_floor() and chase:
			Jump((player.position - self.position).normalized())
	if not is_on_floor():
		velocity.y += gravity * delta * SPEED
	if chase == true:
		
		if get_node("AnimatedSprite2D").animation != "die":
			get_node("AnimatedSprite2D").play("wake")
		
		var direction = (player.position - self.position).normalized()
		if direction.x >= 0:
					get_node("AnimatedSprite2D").flip_h = true
		else:
					get_node("AnimatedSprite2D").flip_h = false
		#velocity.x = direction.x * SPEED
	else:
		if get_node("AnimatedSprite2D").animation != "die":
			get_node("AnimatedSprite2D").play("wake")
			
		#velocity.x =0
	move_and_slide()
	
func _on_player_detection_body_entered(body):
	if body.name == "PPlayer":
		chase = true
		
		
		
func Jump(direction):
	var JS = Jump_Speed*randf_range(0.3 , 3)
	velocity.x+=(JS / sqrt(2))*direction.x
	velocity.y-=(JS/sqrt(2) )
	
	

	
		
		
		#player.global_position


func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_player_death_body_entered(body):
	if body.name == "PPlayer":
		chase = false
		#player.velocity.y = player.JUMP_VELOCITY
		#Game.Gold += 5
		#Utils.saveGame()
		player.anim.play("idle")
		get_node("AnimatedSprite2D").play("die")
		await get_node("AnimatedSprite2D").animation_finished
		self.queue_free()


func _on_player_death_body_exited(body):
	pass # Replace with function body.


func _on_player_collision_body_entered(body):
	
	if body.name == "PPlayer" and dead==false :
		
		player.velocity.y = -400
		
		#Game.PlayerHP -=3
		death()

		
		
func death():
		dead=true
		chase = false
		#Game.Gold += 5
		#Utils.saveGame()
		#velocity.y = JUMP_VELOCITY
		#anim.play("Jump")
		get_node("AnimatedSprite2D").play("die")
		await get_node("AnimatedSprite2D").animation_finished
		self.queue_free()
		


