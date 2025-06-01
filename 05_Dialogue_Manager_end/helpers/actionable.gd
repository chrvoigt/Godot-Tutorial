extends Area2D

@export var dialogue_ressource: DialogueResource
@export var dialogue_start: String = "start"

func action()->void:
	DialogueManager.show_dialogue_balloon(dialogue_ressource,dialogue_start)
	#DialogueManager.show_example_dialogue_balloon(dialogue_ressource,dialogue_start)
