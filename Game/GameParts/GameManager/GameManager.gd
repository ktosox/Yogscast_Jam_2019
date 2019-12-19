extends Node

#this will hold all of global scope stuff
# like magaing game flow between scenes

var currentCamera

var currentInventory

var currentBase

var difficulty = 1

var creditsPath = "res://KeyScenes/Credits/Credits.tscn"

var mainMenuPath = "res://KeyScenes/MainMenu/MainMenu.tscn"

var gamePath = "res://KeyScenes/MiddleArena/MiddleArena.tscn"

var pauseMenuScene = load("res://GameParts/PauseMenu/PauseMenu.tscn")

var gameOverMenuScene = load("res://GameParts/GameOverMenu/GameOverMenu.tscn")



func changeToMainMenu():
	get_tree().change_scene(mainMenuPath)

func changeToGame():
	get_tree().change_scene(gamePath)
	
func changeToCredits():
	get_tree().change_scene(creditsPath)
	
	
func pause_game():
	var newPauseMenu = pauseMenuScene.instance()
	currentCamera.add_child(newPauseMenu)
	get_tree().paused = true


func lose_game():
	var newGameOverMenu = gameOverMenuScene.instance()
	currentCamera.add_child(newGameOverMenu)
	get_tree().paused = true

func restart_game():
	get_tree().change_scene(gamePath)
	get_tree().paused = false


func end_program():
	get_tree().quit()
	pass