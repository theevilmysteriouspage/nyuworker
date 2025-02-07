extends Control

@onready var container = $textbox
@onready var cg = $cg
@onready var text = $textbox/text
@onready var text_sound = $AudioStreamPlayer
@onready var cg_animationplayer = $AnimationPlayer

@export var text_speed : int = 30
@export var text_sound_file = preload("default_textscroll.mp3")
@export var textbox_position_x = 0
@export var textbox_position_y = 0
@export var textbox_size_y = 100
@export var textbox_size_x = 700
@export var cg_animation : String = ""
@export var cg_position_x : float = 0
@export var cg_position_y : float = 0
@export var cg_scale_x : float = 1
@export var cg_scale_y : float = 1

var animate_text : bool = false
var current_line = 0
var current_visible_characters : int = 0
var current_cg = 0

@export var dialog_lines : Array[String] = [
	"test sample text, nyu",
]

@export var lines_to_change_cg : Array[int] = [
]

@export var cg_list : Array[Texture] = [
]

func _ready():
	text_sound.stream = text_sound_file
	display_text(0)
	current_cg = 0 #might be necessary but we dont know... thats scary...

func display_text(line):
	text.visible_characters = 0
	animate_text = true
	text.text = dialog_lines[line]
	
func change_cg():
	cg_animationplayer.play(cg_animation)
	get_tree().create_timer(cg_animationplayer.get_current_animation_length()/2)
	current_cg = current_cg + 1
	cg.texture = cg_list[current_cg]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	container.size = Vector2(textbox_size_x, textbox_size_y)
	container.position = Vector2(textbox_position_x, textbox_position_y)
	cg.position = Vector2(cg_position_x, cg_position_y)
	cg.scale = Vector2(cg_scale_x, cg_scale_y)
	
	if animate_text:
		if text.visible_ratio < 1:
			text.visible_ratio += (1.00/text.text.length()) * (text_speed * delta)
			current_visible_characters = text.visible_characters
			if text.visible_characters == current_visible_characters:
				current_visible_characters = text.visible_characters
				text_sound.play()
		else:
			animate_text = false
			
	if lines_to_change_cg.has(current_line): #changes the graphic and then deletes the "change cg on line" entry for runtime
		change_cg()
		lines_to_change_cg.erase(current_line)
		print(current_cg)
	
	if Input.is_action_just_pressed("text_advance"):
		if current_line == dialog_lines.size() - 1: #this makes sure you dont go over how many lines of dialog there are 
			return
		else:
			current_visible_characters = 0
			current_line += 1
			display_text(current_line)
			animate_text = true
			
		
	if Input.is_action_just_pressed("text_rollback"):
		if current_line == 0: #this makes sure you cant loop the text with the rollback 
			return
		else:
			current_visible_characters = 0
			current_line -= 1
			display_text(current_line)
			animate_text = true
