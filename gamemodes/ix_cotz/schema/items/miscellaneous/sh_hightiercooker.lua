ITEM.name = "Multi-Fuel Cooker"
ITEM.description = "A high tier cooker."
ITEM.longdesc = "A stainless steel cooker that accepts a various amounts of fuel. Easy to clean, this is the best cooker found in a place like the zone. Experienced STALKERs tend to use various types of heat-related artifacts to fuel the cooker."
ITEM.model = "models/lostsignalproject/items/misc/multi_fuel_stove.mdl"

ITEM.width = 2
ITEM.height = 1

ITEM.flatweight = 1.520

ITEM.price = 2500

ITEM.cookertier = 2

ITEM.sound = "stalkersound/inv_cooking_cooker.ogg"

ITEM.exRender = true
ITEM.iconCam = {
	pos = Vector(215.46, 58.46, 231.87),
	ang = Angle(45.76, 196.1, 0),
	fov = 4.08
}

-- Inventory drawing
if (CLIENT) then
	local bar = Material("cotz/panels/hp1.png", "noclamp smooth")

	function ITEM:PaintOver(item, w, h)
		local cancook = item:GetData("cancook", false)

		surface.SetMaterial(bar)
		surface.SetDrawColor(Color(120, 120, 120, 255))
		surface.DrawTexturedRectUV(5, h - 10, 38, 4.6, 0, 0, 0.2, 1)

    if (cancook) then
		  surface.SetMaterial(bar)
			surface.SetDrawColor(Color(120, 255, 120, 255))
		  surface.DrawTexturedRectUV(5, h - 10, 38, 4.6, 0, 0, 0.2, 1)
    end
	end
end

ITEM.functions.use = {
  name = "Cook",
  tip = "useTip",
  icon = "icon16/stalker/eat.png",
  isMulti = true,
  multiOptions = function(item, client)
    local targets = {}
    local char = client:GetCharacter()

    if (char) then
      local inv = char:GetInventory()

      if (inv) then
        local items = inv:GetItems()

        for k, v in pairs(items) do
          if (v.cookable == true  and !v.meatTier == true) then
            table.insert(targets, {
              name = L(""..v.name.." ("..ix.weight.WeightString(v:GetWeight(), ix.option.Get("imperial", false))..")"),
              data = {v:GetID()},
            })
          else
            continue
          end
        end
      end
    end

    return targets
    end,
  OnCanRun = function(item)
    return (!IsValid(item.entity)) and item.invID == item.player:GetCharacter():GetInventory():GetID()
  end,
  OnRun = function(item, data)
    if(!data[1]) then return false end
    item:CookMeat(self, data[1])
    return false
  end,
}

function ITEM:CookMeat(item, targetID)
  local client = self.player or item:GetOwner()
  local char = client:GetCharacter()
  local inv = char:GetInventory()
  local items = inv:GetItems()
  local target = targetID

  for k, invItem in pairs(items) do
    if (targetID) then
      if (invItem:GetID() == targetID) then
        target = invItem

        break
      end
    else
      client:Notify("No item selected.")
      return false
    end
  end

  if (self:GetData("cancook", false)) then
    local client = self.player or item:GetOwner()
    
    ix.util.PlayerPerformBlackScreenAction(client, "Cooking...", 6, function(player) 
      target:Remove()
      client:GetCharacter():GetInventory():Add(target.meal, 1, {["weight"] = target:GetWeight()})
      player:Notify(target.name.." successfully cooked.")
      ix.chat.Send(player, "iteminternal", "uses their "..self.name.." to cook some "..target.name..".", false)
    end)
    
    client:EmitSound(self.sound or "items/battery_pickup.wav")
    self:SetData("cancook", false)

    return false
  else
    client:Notify("No fuel.")
    return false
  end
end

function ITEM:OnInstanced(invID, x, y)
    if (!self:GetData("cancook")) then
        self:SetData("cancook", false)
    end
end
