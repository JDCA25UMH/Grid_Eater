
Controls("touch")
cursor("point")

function _init()
math.randomseed(os.time())
end

local game = {
state = {
juego = true,
ended= false
}
}

local m = 0 

local Grid = {}
Grid.__index = Grid
function Grid.new(x,y,w,h,clr)
return setmetatable({
x=x,y=y,w=w,h=h,clr=clr},Grid)
end

local grid_real= Grid.new(8,20,8,8,12)

local posiciones= {}
local function generatePosition(count)
 
for i=1,count do 
table.insert(posiciones,{
x=math.random(8,176),
y=math.random(8,112)
})
end

end


local function collision(gx,gy,gw,gh,
px,py,pw,ph)
if gx +gw>px and
gx<px+pw and
gy+gh>py and
gy<py+ph then
return true
else
return false
end
end

function Grid:move(minX,maxX,minY,maxY)
if btnp(2)then
self.x = math.min(self.x+4,maxX)
elseif btnp(1)then
self.x = math.max(self.x-4,minX)
elseif btnp(3)then
self.y =math.max(self.y -4,minY)
elseif btnp(4)then
self.y =math.min(self.y+4,maxY)
end
end
local function restart(i)
table.remove(posiciones,i)
m=m+1
end

generatePosition(1)
local function call()
for i,posicion in ipairs(posiciones)do
 if collision(grid_real.x,
grid_real.y,grid_real.w,
grid_real.h,posicion.x,posicion.y,
8,8)then
restart(i)
generatePosition(1)
break
end
end
end
function _update()

grid_real:move(8,181,8,112)

local spriteId = mget(
math.floor(
grid_real.x/8 ) ,
math.floor(
grid_real.y/8)

 )
 call()
 if spriteId == 1
 or grid_real.x>=177
 or grid_real.y>=116 then
 game.state["ended"]= true
 game.state["juego"]= false
 end
 
end

function _draw()

if game.state["juego"] then
clear()
map()

color(12)
rect(grid_real.x,grid_real.y,
grid_real.w,grid_real.h)

color(9)
for i,posicion in ipairs(posiciones)do
rect(posicion.x,posicion.y,8,8)
end

color(7)
print(m,10,10)

elseif game.state["ended"]then
clear()
color(7)
print("GAME OVER",50,50)
end
end

