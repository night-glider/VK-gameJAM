extends Spatial

const building = preload("res://objects/building.tscn")
const bridge = preload("res://objects/bridge.tscn")

var building_count = 100
var grid_size = 25

var grid := []
var buildings = []

func index_exists(x, y):
	return x >= 0 and y >= 0 and x < grid_size and y < grid_size

func count_neighbors(x,y):
	var result = 0
	result += int(grid[x+1][y] != null)
	result += int(grid[x-1][y] != null)
	result += int(grid[x][y+1] != null)
	result += int(grid[x][y-1] != null)
	return result

func choose_neighbor(x,y):
	while true:
		var option = randi() % 4
		var result = {
			"x":x,
			"y":y,
		}
		match option:
			0:
				result["x"] += 1
			1:
				result["x"] -=1
			2:
				result["y"] += 1
			3:
				result["y"] -= 1
		
		return result

func place_building_grid(building, x, y):
	grid[x][y] = building
	buildings.append( {
		"obj":building,
		"x": x,
		"y": y,
	} )
	place_building_world(building, x, y)

func place_building_random(building):
	for i in 100:
		var x = randi() % grid_size
		var y = randi() % grid_size
		
		if not index_exists(x,y):
			continue
		
		if grid[x][y] != null:
			continue
		
		place_building_grid(building, x,y)
		return

func place_building_near_neigbor(building):
	if buildings.empty():
		place_building_grid(building, 0, 0)
		return
	
	for i in 100:
		var building_id = randi() % buildings.size()
		
		var x = buildings[building_id]["x"]
		var y = buildings[building_id]["y"]
		
		if count_neighbors(x,y) > 2:
			continue
		
		var neighbor = choose_neighbor(x,y)
		x = neighbor["x"]
		y = neighbor["y"]
		
		if count_neighbors(x,y) > 1:
			continue
		
		if not index_exists(x,y):
			continue
		
		if grid[x][y] != null:
			continue
		
		place_building_grid(building, x,y)
		return
	
	OS.alert("не могу сгенерировать здание, прошло уже 100 итераций")

func place_building_world(building, x, y):
	add_child(building)
	building.translation = Vector3( x*20, 0, y*20 )
	

func randomize_building(building):
	building.scale = Vector3(rand_range(10, 15), rand_range(20, 50), rand_range(10,15))
	building.translation += Vector3(rand_range(-5,5), 0, rand_range(-5,5))

func place_bridge(x1,y1,x2,y2):
	var building1:Spatial = grid[x1][y1]
	var building2:Spatial = grid[x2][y2]
	var new_bridge = bridge.instance()
	add_child(new_bridge)
	new_bridge.translation = building1.translation
	new_bridge.translation.y += rand_range(10, building1.scale.y)
	new_bridge.scale.z = 25
	new_bridge.look_at(building2.translation + Vector3(0,20,0), Vector3.UP)

func _ready():
	randomize()
	
	grid.resize(grid_size)
	for i in grid_size:
		grid[i] = []
		grid[i].resize(grid_size)
	
	for i in building_count:
		var new_building = building.instance()
		place_building_near_neigbor(new_building)
		randomize_building(new_building)
	
	for x in grid_size:
		for y in grid_size:
			if grid[x][y] == null:
				continue
			
			if index_exists(x+1, y):
				if grid[x+1][y] != null:
					place_bridge(x,y,x+1,y)
			
			if index_exists(x-1, y):
				if grid[x-1][y] != null:
					place_bridge(x,y,x-1,y)
			
			if index_exists(x, y+1):
				if grid[x][y+1] != null:
					place_bridge(x,y,x,y+1)
			
			if index_exists(x, y-1):
				if grid[x][y-1] != null:
					place_bridge(x,y,x,y-1)
			
			
			
	
