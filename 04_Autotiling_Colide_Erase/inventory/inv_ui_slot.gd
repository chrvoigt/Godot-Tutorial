extends Panel

@onready var item_visual: Sprite2D = $CenterContainer/Panel/item_display
@onready var amount_text: Label = $CenterContainer/Panel/Label

@onready var inv_ui_slot: Panel = $"."

func update (item: InvItem):
	if !item:
		item_visual.visible = false 
	else:
		print ('updat. ', item_visual)
		item_visual.visible = true
		item_visual.texture = item.texture  
		print (item.name)
	 
