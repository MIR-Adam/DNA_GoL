local w, h = 30, 30
local g = {}
for i = 1, h do
  g[i] = {}
  for j = 1, w do
    g[i][j] = math.random(2) - 1
  end
end

function n(x, y)
  local c = 0
  for i = -1, 1 do
    for j = -1, 1 do
      if not (i == 0 and j == 0) then
        c = c + (g[(y + j - 1 + h) % h + 1][(x + i - 1 + w) % w + 1] == 1 and 1 or 0)
      end
    end
  end
  return c
end

local function getNucleicAcid(liveNeighbors)
  if liveNeighbors == 2 or liveNeighbors == 3 then
    return "A"
  else
    local randomLetter = math.random(2)
    if randomLetter == 1 then
      return "C"
    else
      return "G"
    end
  end
end

while true do
  for i = 1, h do
    for j = 1, w do
      local l = n(j, i)
      g[i][j] = (l == 3 or (g[i][j] == 1 and l == 2)) and 1 or 0

      if g[i][j] == 1 then
        io.write("T")
      else
        io.write(getNucleicAcid(l))
      end
    end
    io.write("\n")
  end

  os.execute("sleep 2")
  os.execute("clear")
end
