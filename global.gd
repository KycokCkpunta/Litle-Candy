
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
	if get_tree().get_current_scene().get_node("ui/deadscreen/anim").get_current_animation() == "dead" and not get_tree().get_current_scene().get_node("ui/deadscreen/anim").is_playing():
		get_tree().get_current_scene().can_revive = true

func dead():
	get_tree().get_current_scene().dead = true
	dead = true
	get_tree().get_current_scene().get_node("ui/deadscreen/Label").set_text(str(score))
	get_tree().get_current_scene().get_node("ui/deadscreen/anim").play("dead")
	get_tree().get_current_scene().get_node("gg").set_pos(Vector2(128,96))
	for i in range(0,get_tree().get_current_scene().get_node("obstacles").get_children().size()):
		get_tree().get_current_scene().get_node("obstacles").get_child(i).queue_free()

func revive():
	get_tree().get_current_scene().get_node("ui/noise").set_opacity(0.5)
	get_tree().get_current_scene().get_node("ui/deadscreen/anim").play("none")
	dead = false
	get_tree().get_current_scene().can_revive = false
	get_tree().get_current_scene().dead = false
	score = 0
	get_tree().get_current_scene().get_node("ui/score").set_text(str(score))
	get_tree().get_current_scene().get_node("gg").set_pos(Vector2(128,96))

	SPEED = 1.0