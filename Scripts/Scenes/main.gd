extends Node

func _ready():
	var layout = Dialogic.start("greeting")
	layout.register_character(load("res://Dialogue/Characters/player.dch"), %Player)
