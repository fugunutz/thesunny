-- Define players
local player1 = {
    name = "Player 1",
    hp = 100,
    attack = 20
}

local player2 = {
    name = "Player 2",
    hp = 100,
    attack = 15
}

-- Function to check if a player is alive
local function isAlive(player)
    return player.hp > 0
end

-- Function for a player to attack another player
local function attack(attacker, target)
    local damage = math.random(1, attacker.attack)
    print(attacker.name .. " attacks " .. target.name .. " for " .. damage .. " damage!")
    target.hp = target.hp - damage
    if target.hp < 0 then
        target.hp = 0
    end
    print(target.name .. " has " .. target.hp .. " HP left.")
end

-- Combat loop
print("Combat begins!")
while isAlive(player1) and isAlive(player2) do
    attack(player1, player2)
    if not isAlive(player2) then
        print(player2.name .. " has been defeated!")
        break
    end
    attack(player2, player1)
    if not isAlive(player1) then
        print(player1.name .. " has been defeated!")
        break
    end
end
local npc = {
    name = "NPC",
    hp = 100,
    attack = 10,
    wanderRadius = 20,  -- Define the radius within which the NPC will wander
    wanderInterval = 5  -- Define the interval for NPC's wandering (in seconds)
}

-- Function to check if the NPC is alive
local function isAlive()
    return npc.hp > 0
end

-- Function to move the NPC randomly within a defined area
local function wander()
    local newPosition = Vector3.new(math.random(-npc.wanderRadius, npc.wanderRadius), 0, math.random(-npc.wanderRadius, npc.wanderRadius))
    script.Parent:SetPrimaryPartCFrame(CFrame.new(newPosition))
end

-- Function to make the NPC attack a target
local function attack(target)
    local damage = math.random(1, npc.attack)
    print(npc.name .. " attacks " .. target.name .. " for " .. damage .. " damage!")
    target.hp = target.hp - damage
    if target.hp < 0 then
        target.hp = 0
    end
    print(target.name .. " has " .. target.hp .. " HP left.")
end

-- NPC behavior loop
while isAlive() do
    -- Wander randomly within the defined area
    wander()
    wait(npc.wanderInterval)  -- Wait for the defined interval before next action

    -- For demonstration purposes, let's assume the NPC encounters a player (you can replace this with your game logic)
    local player = {
        name = "Player",
        hp = 50
    }
    
    -- NPC attacks the player
    attack(player)
end

print(npc.name .. " has been defeated!")
local killCount = 0

-- Function to update the kill counter display
local function updateKillCounterDisplay()
    -- Assuming you have a TextLabel named "KillCounter" to display the kill count
    script.Parent.KillCounter.Text = "Kills: " .. killCount
end

-- Function to increment the kill counter
local function incrementKillCounter()
    killCount = killCount + 1
    updateKillCounterDisplay()
end

-- Connect the incrementKillCounter function to an event, such as when a player kills another player
-- Example: When a player touches a kill brick, it increments the kill counter
script.Parent.Touched:Connect(function(hit)
    local player = game.Players:GetPlayerFromCharacter(hit.Parent)
    if player then
        incrementKillCounter()
    end
end)

-- Initialize the kill counter display
updateKillCounterDisplay()

-- Define the player's properties
local player = {
    name = "Player",
    hp = 100,
    isBlocking = false,
    blockDuration = 3,  -- Duration of the blocking in seconds
    blockCooldown = 5,  -- Cooldown period for blocking in seconds
}

-- Function to simulate an attack on the player
local function attack()
    local damage = math.random(10, 20)  -- Random damage amount
    print("Enemy attacks " .. player.name .. " for " .. damage .. " damage!")
    if player.isBlocking then
        -- If player is blocking, reduce damage by half
        damage = damage / 2
        print(player.name .. " blocks and takes reduced damage!")
    end
    player.hp = player.hp - damage
    if player.hp < 0 then
        player.hp = 0
    end
    print(player.name .. " has " .. player.hp .. " HP left.")
end

-- Function to enable blocking for the player
local function block()
    if not player.isBlocking then
        print(player.name .. " starts blocking!")
        player.isBlocking = true
        wait(player.blockDuration)  -- Wait for block duration
        player.isBlocking = false
        print(player.name .. " stops blocking!")
        wait(player.blockCooldown)  -- Wait for block cooldown
    end
end

-- Simulate combat loop
print("Combat begins!")
while player.hp > 0 do
    -- Perform blocking
    block()

    -- Simulate enemy attack
    attack()

    wait(1)  -- Wait a second before the next iteration (adjust as needed)
end

local player = {
    name = "Player",
    hp = 100,
    isBlocking = false,
    blockDuration = 3,  -- Duration of the blocking in seconds
    blockCooldown = 5,  -- Cooldown period for blocking in seconds
}

-- Function to simulate an attack on the player
local function attack()
    local damage = math.random(10, 20)  -- Random damage amount
    print("Enemy attacks " .. player.name .. " for " .. damage .. " damage!")
    if player.isBlocking then
        -- If player is blocking, reduce damage by half
        damage = damage / 2
        print(player.name .. " blocks and takes reduced damage!")
    end
    player.hp = player.hp - damage
    if player.hp < 0 then
        player.hp = 0
    end
    print(player.name .. " has " .. player.hp .. " HP left.")
end

-- Function to enable blocking for the player
local function block()
    if not player.isBlocking then
        print(player.name .. " starts blocking!")
        player.isBlocking = true
        wait(player.blockDuration)  -- Wait for block duration
        player.isBlocking = false
        print(player.name .. " stops blocking!")
        wait(player.blockCooldown)  -- Wait for block cooldown
    end
end

-- Simulate combat loop
print("Combat begins!")
while player.hp > 0 do
    -- Perform blocking
    block()

    -- Simulate enemy attack
    attack()

    wait(1)  -- Wait a second before the next iteration (adjust as needed)
end

print(player.name .. " has been defeated!")local player = {
    name = "Player",
    hp = 100,
    isBlocking = false,
    blockDuration = 3,  -- Duration of the blocking in seconds
    blockCooldown = 5,  -- Cooldown period for blocking in seconds
}

-- Function to simulate an attack on the player
local function attack()
    local damage = math.random(10, 20)  -- Random damage amount
    print("Enemy attacks " .. player.name .. " for " .. damage .. " damage!")
    if player.isBlocking then
        -- If player is blocking, reduce damage by half
        damage = damage / 2
        print(player.name .. " blocks and takes reduced damage!")
    end
    player.hp = player.hp - damage
    if player.hp < 0 then
        player.hp = 0
    end
    print(player.name .. " has " .. player.hp .. " HP left.")
end

-- Function to enable blocking for the player
local function block()
    if not player.isBlocking then
        print(player.name .. " starts blocking!")
        player.isBlocking = true
        wait(player.blockDuration)  -- Wait for block duration
        player.isBlocking = false
        print(player.name .. " stops blocking!")
        wait(player.blockCooldown)  -- Wait for block cooldown
    end
end

-- Simulate combat loop
print("Combat begins!")
while player.hp > 0 do
    -- Perform blocking
    block()

    -- Simulate enemy attack
    attack()

    wait(1)  -- Wait a second before the next iteration (adjust as needed)
end

print(player.name .. " has been defeated!")


local item = script.Parent

-- Function to handle when a player touches the item
local function onTouched(hit)
    -- Check if the object that touched the item is a player
    local player = game.Players:GetPlayerFromCharacter(hit.Parent)
    if player then
        -- Add the item to the player's inventory (You would need to implement your inventory system)
        print(player.Name .. " picked up the item!")

        -- Destroy the item from the game world
        item:Destroy()
    end
end

-- Connect the onTouched function to the Touched event of the item
item.Touched:Connect(onTouched)
