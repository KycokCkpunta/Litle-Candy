
extends Node

var SPEED = 1.0
var ticks = 0

var score = 0

var dead = false


func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	ticks+=1
	
	if ticks >= 25 and dead == false:
		ticks = 0
		score+=1
		get_tree().get_current_scene().get_node("ui/score").set_text(str(score))
		SPEED+=0.01

func dead():
	get_tree().get_current_scene().dead = true
	dead = true
	get_tree().get_current_scene().get_node("ui/deadscreen/Label").set_text(str(score))
	get_tree().get_current_scene().get_node("ui/deadscreen/anim").play("dead")

func revive():
	get_tree().get_current_scene().get_node("ui/noise").set_opacity(0.5)
	get_tree().get_current_scene().get_node("ui/deadscreen/anim").play("none")
	dead = false
	get_tree().get_current_scene().dead = false
	score = 0
	get_tree().get_current_scene().get_node("ui/score").set_text(str(score))
	get_tree().get_current_scene().get_node("gg").set_pos(Vector2(128,96))