extends Area2D
@onready var sign_water = $"monster news"

var set = false
@onready var audio_stream_player_2d = $AudioStreamPlayer2D




func _on_body_entered(body):
	if(body.name=="PPlayer" and set ==false):
		get_node("monster news").text = "watch out the for the slime monster ...\n bounce over its head to elimanate it"
		audio_stream_player_2d.play()
	
		set = true


func _on_body_exited(body):
	if(body.name=="PPlayer" and set == true):
		$Timer.start()

func _on_timer_timeout():
	
	
			get_node("monster news").text = ""
			set =false