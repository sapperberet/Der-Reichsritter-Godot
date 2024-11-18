extends Area2D
@onready var sign_water = $"sign water"

var set = false
@onready var audio_stream_player_2d = $AudioStreamPlayer2D



func _on_body_entered(body):
	if(body.name=="PPlayer" and set ==false):
		get_node("sign water").text = "It feels a little ... odd here ..."
		audio_stream_player_2d.play()
		set = true


func _on_body_exited(body):
	if(body.name=="PPlayer" and set == true):
		$Timer.start()

func _on_timer_timeout():
	
	
			get_node("sign water").text = ""
			set =false

