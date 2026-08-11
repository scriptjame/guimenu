--// ⚡ YUNGAKO HUB - UI v1
--// Responsive: PC / Mobile Landscape
--// 21 Games / Search / Scroll / Minimize / Reopen

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")

local Player = Players.LocalPlayer
local PlayerGui = Player:WaitForChild("PlayerGui")

--==================================================
-- REMOVE OLD GUI
--==================================================

local old = PlayerGui:FindFirstChild("YungakoHub")
if old then
    old:Destroy()
end

--==================================================
-- GAME DATA
--==================================================

local Games = {
    {
    Name = "Blade Ball",
    Description = "Blade Ball Script",
    Icon = "⚔",
    Action = function()

        loadstring(game:HttpGet("https://raw.githubusercontent.com/scriptjame/test2/refs/heads/main/bladeball.lua"))()

    end
},

    {
        Name = "MM2",
        Description = "Murder Mystery 2",
        Icon = "🔪",
        Action = function()
            -- MM2 callback
        end
    },

    {
        Name = "Adopt Me",
        Description = "Adopt Me Script",
        Icon = "🏠",
        Action = function()
            -- Adopt Me callback
        end
    },

    {
        Name = "Blox Fruits",
        Description = "Blox Fruits Script",
        Icon = "🍎",
        Action = function()
            -- Blox Fruits callback
        end
    },

    {
        Name = "Steal a Brainrot",
        Description = "Steal a Brainrot Script",
        Icon = "🧠",
        Action = function()
            -- Steal a Brainrot callback
        end
    },

    {
        Name = "99 Nights in the Forest",
        Description = "99 Nights Script",
        Icon = "🌲",
        Action = function()
            -- 99 Nights callback
        end
    },

    {
        Name = "The Strongest Battlegrounds",
        Description = "TSB Script",
        Icon = "⚡",
        Action = function()
            -- TSB callback
        end
    },

    {
        Name = "Pls Donate",
        Description = "Pls Donate Script",
        Icon = "💰",
        Action = function()
            -- Pls Donate callback
        end
    },

    {
        Name = "Evade",
        Description = "Evade Script",
        Icon = "👁",
        Action = function()
            -- Evade callback
        end
    },

    {
        Name = "Fish It",
        Description = "Fish It Script",
        Icon = "🎣",
        Action = function()
            -- Fish It callback
        end
    },

    {
        Name = "Doors",
        Description = "Doors Script",
        Icon = "🚪",
        Action = function()
            -- Doors callback
        end
    },

    {
        Name = "Sailor Piece",
        Description = "Sailor Piece Script",
        Icon = "⚓",
        Action = function()
            -- Sailor Piece callback
        end
    },

    {
        Name = "Jujutsu Shenanigans",
        Description = "Jujutsu Script",
        Icon = "👊",
        Action = function()
            -- Jujutsu callback
        end
    },

    {
        Name = "Forsaken",
        Description = "Forsaken Script",
        Icon = "☠",
        Action = function()
            -- Forsaken callback
        end
    },

    {
        Name = "Rivals",
        Description = "Rivals Script",
        Icon = "🎯",
        Action = function()
            -- Rivals callback
        end
    },

    {
        Name = "Arsenal",
        Description = "Arsenal Script",
        Icon = "🔫",
        Action = function()
            -- Arsenal callback
        end
    },

    {
        Name = "Bee Swarm Simulator",
        Description = "Bee Swarm Script",
        Icon = "🐝",
        Action = function()
            -- Bee Swarm callback
        end
    },

    {
        Name = "Brookhaven RP",
        Description = "Brookhaven Script",
        Icon = "🏡",
        Action = function()
            -- Brookhaven callback
        end
    },

    {
        Name = "Aura Ascension",
        Description = "Aura Ascension Script",
        Icon = "✨",
        Action = function()
            -- Aura Ascension callback
        end
    },

    {
        Name = "Dead Rails",
        Description = "Dead Rails Script",
        Icon = "🚂",
        Action = function()
            -- Dead Rails callback
        end
    },

    {
        Name = "Bite By Night",
        Description = "Bite By Night Script",
        Icon = "🌙",
        Action = function()
            -- Bite By Night callback
        end
    },
}

--==================================================
-- COLORS
--==================================================

local BG = Color3.fromRGB(15, 17, 23)
local CARD = Color3.fromRGB(25, 28, 36)
local CARD_HOVER = Color3.fromRGB(33, 37, 48)

local TEXT = Color3.fromRGB(242, 244, 248)
local SUBTEXT = Color3.fromRGB(145, 151, 165)

local ACCENT = Color3.fromRGB(110, 165, 255)
local SEARCH_BG = Color3.fromRGB(22, 25, 32)

--==================================================
-- HELPERS
--==================================================

local function Corner(parent, radius)
    local c = Instance.new("UICorner")
    c.CornerRadius = UDim.new(0, radius)
    c.Parent = parent
    return c
end

local function Stroke(parent, color, transparency, thickness)
    local s = Instance.new("UIStroke")
    s.Color = color
    s.Transparency = transparency or 0
    s.Thickness = thickness or 1
    s.Parent = parent
    return s
end

local function Tween(obj, time, properties)
    return TweenService:Create(
        obj,
        TweenInfo.new(time, Enum.EasingStyle.Quart, Enum.EasingDirection.Out),
        properties
    )
end

--==================================================
-- SCREEN GUI
--==================================================

local Gui = Instance.new("ScreenGui")
Gui.Name = "YungakoHub"
Gui.ResetOnSpawn = false
Gui.IgnoreGuiInset = true
Gui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
Gui.Parent = PlayerGui

--==================================================
-- MAIN WINDOW
--==================================================

local Main = Instance.new("Frame")
Main.Name = "Main"
Main.AnchorPoint = Vector2.new(0.5, 0.5)
Main.Position = UDim2.fromScale(0.5, 0.5)
Main.Size = UDim2.new(0.78, 0, 0.72, 0)
Main.BackgroundColor3 = BG
Main.BorderSizePixel = 0
Main.ClipsDescendants = true
Main.Parent = Gui

Corner(Main, 16)
Stroke(Main, Color3.fromRGB(90, 120, 170), 0.72, 1)

--==================================================
-- HEADER
--==================================================

local Header = Instance.new("Frame")
Header.Name = "Header"
Header.Size = UDim2.new(1, 0, 0, 58)
Header.BackgroundTransparency = 1
Header.Parent = Main

local Title = Instance.new("TextLabel")
Title.BackgroundTransparency = 1
Title.Position = UDim2.new(0, 18, 0, 7)
Title.Size = UDim2.new(1, -100, 0, 26)
Title.Font = Enum.Font.GothamBold
Title.Text = "⚡ YUNGAKO HUB"
Title.TextSize = 19
Title.TextColor3 = TEXT
Title.TextXAlignment = Enum.TextXAlignment.Left
Title.Parent = Header

local Count = Instance.new("TextLabel")
Count.BackgroundTransparency = 1
Count.Position = UDim2.new(0, 19, 0, 32)
Count.Size = UDim2.new(1, -100, 0, 18)
Count.Font = Enum.Font.Gotham
Count.Text = "21 Games"
Count.TextSize = 11
Count.TextColor3 = SUBTEXT
Count.TextXAlignment = Enum.TextXAlignment.Left
Count.Parent = Header

local Close = Instance.new("TextButton")
Close.Size = UDim2.new(0, 32, 0, 32)
Close.Position = UDim2.new(1, -43, 0, 13)
Close.BackgroundColor3 = Color3.fromRGB(35, 39, 49)
Close.Text = "×"
Close.TextColor3 = TEXT
Close.TextSize = 20
Close.Font = Enum.Font.GothamBold
Close.AutoButtonColor = false
Close.Parent = Header

Corner(Close, 9)

Close.MouseEnter:Connect(function()
    Tween(Close, .12, {
        BackgroundColor3 = Color3.fromRGB(55, 60, 72)
    }):Play()
end)

Close.MouseLeave:Connect(function()
    Tween(Close, .12, {
        BackgroundColor3 = Color3.fromRGB(35, 39, 49)
    }):Play()
end)

--==================================================
-- SEARCH
--==================================================

local SearchFrame = Instance.new("Frame")
SearchFrame.Name = "SearchFrame"
SearchFrame.Position = UDim2.new(0, 14, 0, 66)
SearchFrame.Size = UDim2.new(1, -28, 0, 40)
SearchFrame.BackgroundColor3 = SEARCH_BG
SearchFrame.BorderSizePixel = 0
SearchFrame.Parent = Main

Corner(SearchFrame, 10)
Stroke(SearchFrame, Color3.fromRGB(70, 76, 90), .78, 1)

local SearchIcon = Instance.new("TextLabel")
SearchIcon.BackgroundTransparency = 1
SearchIcon.Position = UDim2.new(0, 12, 0, 0)
SearchIcon.Size = UDim2.new(0, 25, 1, 0)
SearchIcon.Text = "⌕"
SearchIcon.TextColor3 = SUBTEXT
SearchIcon.Font = Enum.Font.GothamBold
SearchIcon.TextSize = 20
SearchIcon.Parent = SearchFrame

local SearchBox = Instance.new("TextBox")
SearchBox.BackgroundTransparency = 1
SearchBox.Position = UDim2.new(0, 40, 0, 0)
SearchBox.Size = UDim2.new(1, -50, 1, 0)
SearchBox.ClearTextOnFocus = false
SearchBox.Font = Enum.Font.Gotham
SearchBox.Text = ""
SearchBox.PlaceholderText = "Search games..."
SearchBox.PlaceholderColor3 = SUBTEXT
SearchBox.TextColor3 = TEXT
SearchBox.TextSize = 13
SearchBox.TextXAlignment = Enum.TextXAlignment.Left
SearchBox.Parent = SearchFrame

--==================================================
-- GAME AREA
--==================================================

local GameScroll = Instance.new("ScrollingFrame")
GameScroll.Name = "GameScroll"
GameScroll.Position = UDim2.new(0, 14, 0, 116)
GameScroll.Size = UDim2.new(1, -28, 1, -162)
GameScroll.BackgroundTransparency = 1
GameScroll.BorderSizePixel = 0
GameScroll.ScrollBarThickness = 3
GameScroll.ScrollBarImageColor3 = ACCENT
GameScroll.CanvasSize = UDim2.new()
GameScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y
GameScroll.ScrollingDirection = Enum.ScrollingDirection.Y
GameScroll.Parent = Main

local Grid = Instance.new("UIGridLayout")
Grid.CellPadding = UDim2.new(0, 9, 0, 9)
Grid.CellSize = UDim2.new(0.49, -5, 0, 68)
Grid.SortOrder = Enum.SortOrder.LayoutOrder
Grid.Parent = GameScroll

local Padding = Instance.new("UIPadding")
Padding.PaddingTop = UDim.new(0, 3)
Padding.PaddingBottom = UDim.new(0, 8)
Padding.Parent = GameScroll

--==================================================
-- NO RESULTS
--==================================================

local NoResults = Instance.new("Frame")
NoResults.BackgroundTransparency = 1
NoResults.Size = UDim2.new(1, 0, 0, 90)
NoResults.Visible = false
NoResults.Parent = GameScroll

local NoText = Instance.new("TextLabel")
NoText.BackgroundTransparency = 1
NoText.Size = UDim2.new(1, 0, 0, 28)
NoText.Position = UDim2.new(0, 0, 0, 10)
NoText.Font = Enum.Font.GothamBold
NoText.Text = "No games found"
NoText.TextSize = 15
NoText.TextColor3 = TEXT
NoText.Parent = NoResults

local NoSub = Instance.new("TextLabel")
NoSub.BackgroundTransparency = 1
NoSub.Size = UDim2.new(1, 0, 0, 22)
NoSub.Position = UDim2.new(0, 0, 0, 39)
NoSub.Font = Enum.Font.Gotham
NoSub.Text = "Try another search"
NoSub.TextSize = 11
NoSub.TextColor3 = SUBTEXT
NoSub.Parent = NoResults

--==================================================
-- CARD CREATION
--==================================================

local Cards = {}

local function CreateCard(gameData, index)

    local Card = Instance.new("TextButton")
    Card.Name = gameData.Name
    Card.Text = ""
    Card.AutoButtonColor = false
    Card.BackgroundColor3 = CARD
    Card.BorderSizePixel = 0
    Card.LayoutOrder = index
    Card.Parent = GameScroll

    Corner(Card, 11)

    local CardStroke = Stroke(
        Card,
        Color3.fromRGB(75, 82, 100),
        .82,
        1
    )

    -- icon
    local IconBox = Instance.new("Frame")
    IconBox.BackgroundColor3 = Color3.fromRGB(31, 35, 45)
    IconBox.Size = UDim2.new(0, 43, 0, 43)
    IconBox.Position = UDim2.new(0, 10, 0.5, -21.5)
    IconBox.Parent = Card

    Corner(IconBox, 10)

    local Icon = Instance.new("TextLabel")
    Icon.BackgroundTransparency = 1
    Icon.Size = UDim2.fromScale(1, 1)
    Icon.Text = gameData.Icon
    Icon.TextSize = 20
    Icon.Font = Enum.Font.GothamBold
    Icon.TextColor3 = TEXT
    Icon.Parent = IconBox

    -- game name
    local Name = Instance.new("TextLabel")
    Name.BackgroundTransparency = 1
    Name.Position = UDim2.new(0, 62, 0, 12)
    Name.Size = UDim2.new(1, -100, 0, 21)
    Name.Font = Enum.Font.GothamSemibold
    Name.Text = gameData.Name
    Name.TextSize = 13
    Name.TextColor3 = TEXT
    Name.TextXAlignment = Enum.TextXAlignment.Left
    Name.TextTruncate = Enum.TextTruncate.AtEnd
    Name.Parent = Card

    -- description
    local Description = Instance.new("TextLabel")
    Description.BackgroundTransparency = 1
    Description.Position = UDim2.new(0, 62, 0, 34)
    Description.Size = UDim2.new(1, -105, 0, 17)
    Description.Font = Enum.Font.Gotham
    Description.Text = gameData.Description
    Description.TextSize = 10
    Description.TextColor3 = SUBTEXT
    Description.TextXAlignment = Enum.TextXAlignment.Left
    Description.TextTruncate = Enum.TextTruncate.AtEnd
    Description.Parent = Card

    -- arrow
    local Arrow = Instance.new("TextLabel")
    Arrow.BackgroundTransparency = 1
    Arrow.AnchorPoint = Vector2.new(1, 0.5)
    Arrow.Position = UDim2.new(1, -11, 0.5, 0)
    Arrow.Size = UDim2.new(0, 22, 0, 25)
    Arrow.Text = "›"
    Arrow.TextColor3 = SUBTEXT
    Arrow.Font = Enum.Font.GothamBold
    Arrow.TextSize = 20
    Arrow.Parent = Card

    Cards[#Cards + 1] = {
        Button = Card,
        Data = gameData,
    }

    -- hover
    Card.MouseEnter:Connect(function()
        Tween(Card, .12, {
            BackgroundColor3 = CARD_HOVER
        }):Play()

        Tween(CardStroke, .12, {
            Transparency = .55,
            Color = ACCENT
        }):Play()

        Tween(Arrow, .12, {
            TextColor3 = ACCENT,
            Position = UDim2.new(1, -8, 0.5, 0)
        }):Play()
    end)

    Card.MouseLeave:Connect(function()
        Tween(Card, .12, {
            BackgroundColor3 = CARD
        }):Play()

        Tween(CardStroke, .12, {
            Transparency = .82,
            Color = Color3.fromRGB(75, 82, 100)
        }):Play()

        Tween(Arrow, .12, {
            TextColor3 = SUBTEXT,
            Position = UDim2.new(1, -11, 0.5, 0)
        }):Play()
    end)

    -- click
    Card.Activated:Connect(function()

        Tween(Card, .08, {
            Size = UDim2.new(
                Card.Size.X.Scale,
                Card.Size.X.Offset - 2,
                Card.Size.Y.Scale,
                Card.Size.Y.Offset - 2
            )
        }):Play()

        task.wait(.08)

        Tween(Card, .08, {
            Size = UDim2.new(
                Card.Size.X.Scale,
                Card.Size.X.Offset + 2,
                Card.Size.Y.Scale,
                Card.Size.Y.Offset + 2
            )
        }):Play()

        -- callback
        if typeof(gameData.Action) == "function" then
            task.spawn(function()
                pcall(gameData.Action)
            end)
        end
    end)
end

--==================================================
-- CREATE ALL GAMES
--==================================================

for i, gameData in ipairs(Games) do
    CreateCard(gameData, i)
end

--==================================================
-- SEARCH SYSTEM
--==================================================

local function SearchGames(query)

    query = string.lower(query or "")
    query = string.gsub(query, "^%s+", "")
    query = string.gsub(query, "%s+$", "")

    local visibleCount = 0

    for _, item in ipairs(Cards) do

        local name = string.lower(item.Data.Name)
        local description = string.lower(item.Data.Description)

        local found =
            query == ""
            or string.find(name, query, 1, true)
            or string.find(description, query, 1, true)

        item.Button.Visible = found

        if found then
            visibleCount += 1
        end
    end

    NoResults.Visible = visibleCount == 0

    if visibleCount == 0 then
        NoResults.Parent = GameScroll
    end

    GameScroll.CanvasPosition = Vector2.new(0, 0)
end

SearchBox:GetPropertyChangedSignal("Text"):Connect(function()
    SearchGames(SearchBox.Text)
end)

--==================================================
-- RESPONSIVE GRID
--==================================================

local function UpdateGrid()

    local width = Main.AbsoluteSize.X

    if width < 500 then
        -- narrow phone
        Grid.CellSize = UDim2.new(1, -2, 0, 68)

    elseif width < 850 then
        -- phone landscape / small window
        Grid.CellSize = UDim2.new(0.5, -5, 0, 68)

    else
        -- desktop
        Grid.CellSize = UDim2.new(0.333, -7, 0, 68)
    end
end

Main:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateGrid)
task.defer(UpdateGrid)

--==================================================
-- MINIMIZE / REOPEN
--==================================================

local Reopen = Instance.new("TextButton")
Reopen.Name = "Reopen"
Reopen.AnchorPoint = Vector2.new(0, 0.5)
Reopen.Position = UDim2.new(0, 18, 0.7, 0)
Reopen.Size = UDim2.new(0, 46, 0, 46)
Reopen.BackgroundColor3 = Color3.fromRGB(27, 30, 39)
Reopen.Text = "⚡"
Reopen.TextColor3 = TEXT
Reopen.TextSize = 20
Reopen.Font = Enum.Font.GothamBold
Reopen.Visible = false
Reopen.AutoButtonColor = false
Reopen.Parent = Gui

Corner(Reopen, 23)
Stroke(Reopen, ACCENT, .65, 1)

Close.Activated:Connect(function()

    Tween(Main, .18, {
        Size = UDim2.new(
            Main.Size.X.Scale,
            Main.Size.X.Offset,
            0,
            0
        )
    }):Play()

    task.wait(.18)

    Main.Visible = false
    Reopen.Visible = true
end)

Reopen.Activated:Connect(function()

    Reopen.Visible = false
    Main.Visible = true

    Main.Size = UDim2.new(
        Main.Size.X.Scale,
        Main.Size.X.Offset,
        0,
        0
    )

    Tween(Main, .22, {
        Size = UDim2.new(0.78, 0, 0.72, 0)
    }):Play()
end)

--==================================================
-- DRAG SYSTEM
--==================================================

local Dragging = false
local DragStart
local StartPosition

Header.InputBegan:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        Dragging = true
        DragStart = input.Position
        StartPosition = Main.Position
    end
end)

UIS.InputChanged:Connect(function(input)

    if not Dragging then
        return
    end

    if input.UserInputType ~= Enum.UserInputType.MouseMovement
        and input.UserInputType ~= Enum.UserInputType.Touch then
        return
    end

    local Delta = input.Position - DragStart

    Main.Position = UDim2.new(
        StartPosition.X.Scale,
        StartPosition.X.Offset + Delta.X,
        StartPosition.Y.Scale,
        StartPosition.Y.Offset + Delta.Y
    )
end)

UIS.InputEnded:Connect(function(input)

    if input.UserInputType == Enum.UserInputType.MouseButton1
        or input.UserInputType == Enum.UserInputType.Touch then

        Dragging = false
    end
end)

--==================================================
-- OPEN ANIMATION
--==================================================

Main.Size = UDim2.new(0.78, 0, 0, 0)

Tween(Main, .28, {
    Size = UDim2.new(0.78, 0, 0.72, 0)
}):Play()
