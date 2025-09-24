extends VBoxContainer

class_name InventorySlot

@export var single_button_press: bool = false
@export var starting_texture: Texture
@export var start_label: String

@onready var texture_rect = $NinePatchRect/MenuButton/CenterContainer/TextureRect
@onready var name_label = $NameLabel
@onready var stacks_label = $NinePatchRect/StacksLabel
@onready var on_click_button = $NinePatchRect/OnClickButton
@onready var price_label = $PriceLabel
@onready var menu_button = $NinePatchRect/MenuButton

var is_empty: bool = true
var is_selected: bool = false
var slot_to_equip:String = "not_equipable"

func _ready() -> void:
	if starting_texture != null:
		texture_rect.texture = starting_texture
	
	if start_label != null:
		name_label.text = start_label
	
	menu_button.disabled = single_button_press
	
	on_click_button.disabled = !single_button_press
	on_click_button.visible = single_button_press
	
	var popup_menu: PopupMenu = menu_button.get_popup()
	popup_menu.id_pressed.connect(on_popup_menu_item_pressed)

func on_popup_menu_item_pressed(id: int) -> void:
	print_debug(id) # TEMP
	
