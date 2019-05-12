extends Node

export (PackedScene) var Mur

var score
var player

func _ready():
	match GameSingleton.machineChoice:
		"vis" : 
			player = preload("res://VisMachine.tscn").instance()
			player.position = $StartPosition.position
			add_child(player)
		"aile" :
			player = preload("res://AileMachine.tscn").instance()
			player.position = $StartPosition.position
			add_child(player)
			
func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		print("--> echap = menu pause")
		var m = preload("res://MenuPause.tscn").instance()
		add_child( m )

func new_game():
	score = 0
	$joueur.start($StartPosition.position)
	$StartTimer.start()

func Game_over():
	$MurTimer.stop()
	$ScoreTimer.stop()
	
	print("Perdu")

func _on_MurTimer_timeout():
	var mur = Mur.instance()
	add_child(mur)

func _on_Joueur_touchSol():
	pass#print("Crash")
	$MurTimer.stop()

func _on_StartTimer_timeout():
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
