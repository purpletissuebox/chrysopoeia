extends Control

#fire = 0
#water = 1
#earth = 2
#air = 3
#castle = 4

const places_to_go: Array[String] = [
	"gameplay",
	"gameplay",
	"gameplay",
	"gameplay",
	"house"
]

const PATH_TO_STAGES = "res://scenes/gameplay/"
const POSTFIX = ".tscn"

func visit_place(i: int):
	Constants.change_mode.emit(PATH_TO_STAGES + places_to_go[i] + POSTFIX)
