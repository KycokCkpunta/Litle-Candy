
extends Node2D

var ticks = 0

var dead = false

func _ready():
	randomize()
	set_fixed_process(true)

func _fixed_process(delta):
	ticks+=1
	if ticks >= 35 and dead == false:
		ticks = 0
		if randi()%2 == 1:
			var obs = load("res://obstacles/"+str(randi()%6)+".scn").instance()
			obs.set_pos(Vector2(384,120))
			if randi()%2 == 1:
				obs.set_scale(Vector2(-1,1))
			get_node("obstacles").add_child(obs)

func _on_Area2D_body_enter( body ):
	if body.get_name() == "gg":
		get_node("/root/global").dead()


func _on_restart_pressed():
	get_node("/root/global").revive()
