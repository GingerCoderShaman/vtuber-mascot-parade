class_name StaticObject
extends CharacterBody2D

const HIT_BOX_LAYER = 4

func take_damage(_amount:int=1, soruce=null) -> bool:
	return false
	
func heal(_amount:int=1) -> bool:
	return false
