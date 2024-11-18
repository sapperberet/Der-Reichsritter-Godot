extends Node

var score =0

@onready var label = $CanvasLayer/Label


func _ready():
	pass

func add_point():
	score+=1
	label.text="score " +str(score)+"$" 


