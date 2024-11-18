extends Area2D

var player 
@onready var climb = $climb

func _ready():
	
	#player = get_node('../p_player/Player')
	player =  get_node("../../PPlayer")
	
func _on_body_entered(body):
	
	if( Input.is_action_pressed("up") and body.name == "PPlayer"):

		player.velocity.y= - 400	
		climb.play()
	

		


func _on_input_event(viewport, event, shape_idx):
	print(event)
