extends KinematicBody2D

var Movement_Speed
var Movement_MaxSpeed
var Jump_Speed
var Jump_MaxSpeed
var Gravity
var Acceleration

# DIRECTIONS FOR MOVEMENT
var velocity = Vector2()

var DIRECTION = {
	LEFT = Vector2(-1, 0),
	RIGHT = Vector2(1, 0),
	UP = Vector2(0, -1),
	DOWN = Vector2(0, 1)
}
