
define DRAW_MAZE
from fwrl.prob.windy_grid_world import WindyGridWorld
from umcog import draw
cnvs = WindyGridWorld.from_maze_name(maze_name = $1).render(None, 100)
draw.imwrite($2, cnvs)
endef
.ONESHELL:
SHELL=python
.SHELLFLAGS:= -c
4-room-grid-world.pdf:
	$(call DRAW_MAZE,"4-room-grid-world","$@")

4-room-windy-world.pdf:
	$(call DRAW_MAZE, "4-room-windy-world", "$@")

