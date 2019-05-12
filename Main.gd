extends Node

export (PackedScene) var Mur

var score
var player

func _ready():
	match GameSingleton.machineChoice:
		"vis" : 
			player = preload("res://VisMachine.tscn").instance()
		"aile" :
			player = preload("res://AileMachine.tscn").instance()
		
	player.position = $StartPosition.position
	player.connect("hit", self, "_on_player_hit")
	add_child(player)

func _on_player_hit():
	Game_over()

func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		var m = preload("res://MenuPause.tscn").instance()
		add_child( m )

func new_game():
	score = 0
	$joueur.start($StartPosition.position)
	$StartTimer.start()

func Game_over():
	$MurTimer.stop()
	$ScoreTimer.stop()

	get_tree().change_scene("res://GameOver.tscn")

func _on_MurTimer_timeout():
	var mur = Mur.instance()
	add_child(mur)

func _on_Joueur_touchSol():
	Game_over()

func _on_StartTimer_timeout():
	$ScoreTimer.start()

func _on_ScoreTimer_timeout():
	score += 1
