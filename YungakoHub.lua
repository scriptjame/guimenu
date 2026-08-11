```lua
--// ⚡ YUNGAKO HUB - UI v2
--// Modern / Responsive / Search / Cards / Sounds / Animations
--// PC + Mobile / Minimize / Reopen / Drag

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UIS = game:GetService("UserInputService")
local Debris = game:GetService("Debris")

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
            loadstring(game:HttpGet("https://pastefy.app/lXtua1cc/raw"))()
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

local BG = Color3.fromRGB(12, 14, 20)
local BG2 = Color3.fromRGB(17, 20, 28)

local CARD = Color3.fromRGB(23, 27, 36)
local CARD_HOVER = Color3.fromRGB(32, 38, 50)

local ICON_BG = Color3.fromRGB(29, 34, 45)

local TEXT = Color3.fromRGB(245, 247, 252)
local SUBTEXT = Color3.fromRGB(145, 153, 170)

local ACCENT = Color3.fromRGB(110, 165, 255)
local ACCENT2 = Color3.fromRGB(175, 115, 255)

local SEARCH_BG = Color3.fromRGB(19, 22, 30)

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

local function Gradient(parent, color1, color2, rotation)

    local g = Instance.new("UIGradient")

    g.Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, color1),
        ColorSequenceKeypoint.new(1, color2)
    }

    g.Rotation = rotation or 0
    g.Parent = parent

    return g
end

local function Tween(obj, time, properties)

    return TweenService:Create(
        obj,
        TweenInfo.new(
            time,
            Enum.EasingStyle.Quart,
            Enum.EasingDirection.Out
        ),
        properties
    )
end

--==================================================
-- SOUNDS
--==================================================

local CLICK_SOUND = "rbxassetid://876939830"

local function PlaySound(parent, volume)

    local sound = Instance.new("Sound")

    sound.SoundId = CLICK_SOUND
    sound.Volume = volume or 0.6
    sound.Parent = parent

    sound:Play()

    Debris:AddItem(sound, 2)
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

Corner(Main, 18)

local MainStroke = Stroke(
    Main,
    Color3.fromRGB(95, 125, 180),
    0.62,
    1
)

--==================================================
-- MAIN BACKGROUND GRADIENT
--==================================================

Gradient(
    Main,
    Color3.fromRGB(12, 14, 20),
    Color3.fromRGB(20, 23, 32),
    90
)

--==================================================
-- TOP ACCENT LINE
--==================================================

local AccentLine = Instance.new("Frame")

AccentLine.Size = UDim2.new(1, 0, 0, 2)

AccentLine.Position = UDim2.new(0, 0, 0, 0)

AccentLine.BorderSizePixel = 0

AccentLine.BackgroundColor3 = ACCENT

AccentLine.Parent = Main

Gradient(
    AccentLine,
    ACCENT,
    ACCENT2,
    0
)

--==================================================
-- HEADER
--==================================================

local Header = Instance.new("Frame")

Header.Name = "Header"

Header.Size = UDim2.new(1, 0, 0, 62)

Header.BackgroundTransparency = 1

Header.Parent = Main

--==================================================
-- TITLE
--==================================================

local Title = Instance.new("TextLabel")

Title.BackgroundTransparency = 1

Title.Position = UDim2.new(0, 18, 0, 7)

Title.Size = UDim2.new(1, -100, 0, 27)

Title.Font = Enum.Font.GothamBold

Title.Text = "⚡ YUNGAKO HUB"

Title.TextSize = 19

Title.TextColor3 = TEXT

Title.TextXAlignment = Enum.TextXAlignment.Left

Title.Parent = Header

--==================================================
-- TITLE GRADIENT
--==================================================

local TitleGradient = Instance.new("UIGradient")

TitleGradient.Color = ColorSequence.new{
    ColorSequenceKeypoint.new(0, Color3.fromRGB(220, 235, 255)),
    ColorSequenceKeypoint.new(0.5, ACCENT),
    ColorSequenceKeypoint.new(1, ACCENT2)
}

TitleGradient.Parent = Title

--==================================================
-- COUNT
--==================================================

local Count = Instance.new("TextLabel")

Count.BackgroundTransparency = 1

Count.Position = UDim2.new(0, 19, 0, 34)

Count.Size = UDim2.new(1, -100, 0, 17)

Count.Font = Enum.Font.Gotham

Count.Text = tostring(#Games) .. " Games  •  Ready"

Count.TextSize = 11

Count.TextColor3 = SUBTEXT

Count.TextXAlignment = Enum.TextXAlignment.Left

Count.Parent = Header

--==================================================
-- CLOSE BUTTON
--==================================================

local Close = Instance.new("TextButton")

Close.Size = UDim2.new(0, 34, 0, 34)

Close.Position = UDim2.new(1, -45, 0, 14)

Close.BackgroundColor3 = Color3.fromRGB(30, 34, 44)

Close.Text = "×"

Close.TextColor3 = TEXT

Close.TextSize = 20

Close.Font = Enum.Font.GothamBold

Close.AutoButtonColor = false

Close.Parent = Header

Corner(Close, 10)

local CloseStroke = Stroke(
    Close,
    Color3.fromRGB(80, 90, 110),
    0.72,
    1
)

Close.MouseEnter:Connect(function()

    PlaySound(Close, 0.25)

    Tween(Close, .12, {
        BackgroundColor3 = Color3.fromRGB(55, 60, 73)
    }):Play()

    Tween(CloseStroke, .12, {
        Transparency = .35,
        Color = ACCENT
    }):Play()

end)

Close.MouseLeave:Connect(function()

    Tween(Close, .12, {
        BackgroundColor3 = Color3.fromRGB(30, 34, 44)
    }):Play()

    Tween(CloseStroke, .12, {
        Transparency = .72,
        Color = Color3.fromRGB(80, 90, 110)
    }):Play()

end)

--==================================================
-- SEARCH
--==================================================

local SearchFrame = Instance.new("Frame")

SearchFrame.Name = "SearchFrame"

SearchFrame.Position = UDim2.new(0, 14, 0, 70)

SearchFrame.Size = UDim2.new(1, -28, 0, 42)

SearchFrame.BackgroundColor3 = SEARCH_BG

SearchFrame.BorderSizePixel = 0

SearchFrame.Parent = Main

Corner(SearchFrame, 11)

local SearchStroke = Stroke(
    SearchFrame,
    Color3.fromRGB(75, 83, 100),
    .72,
    1
)

-- search gradient

Gradient(
    SearchFrame,
    Color3.fromRGB(18, 21, 29),
    Color3.fromRGB(23, 27, 36),
    0
)

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

SearchBox.Focused:Connect(function()

    Tween(SearchStroke, .15, {
        Transparency = .25,
        Color = ACCENT
    }):Play()

end)

SearchBox.FocusLost:Connect(function()

    Tween(SearchStroke, .15, {
        Transparency = .72,
        Color = Color3.fromRGB(75, 83, 100)
    }):Play()

end)

--==================================================
-- GAME AREA
--==================================================

local GameScroll = Instance.new("ScrollingFrame")

GameScroll.Name = "GameScroll"

GameScroll.Position = UDim2.new(0, 14, 0, 122)

GameScroll.Size = UDim2.new(1, -28, 1, -168)

GameScroll.BackgroundTransparency = 1

GameScroll.BorderSizePixel = 0

GameScroll.ScrollBarThickness = 3

GameScroll.ScrollBarImageColor3 = ACCENT

GameScroll.ScrollBarImageTransparency = .25

GameScroll.CanvasSize = UDim2.new()

GameScroll.AutomaticCanvasSize = Enum.AutomaticSize.Y

GameScroll.ScrollingDirection = Enum.ScrollingDirection.Y

GameScroll.Parent = Main

--==================================================
-- GRID
--==================================================

local Grid = Instance.new("UIGridLayout")

Grid.CellPadding = UDim2.new(0, 10, 0, 10)

Grid.CellSize = UDim2.new(0.49, -5, 0, 78)

Grid.SortOrder = Enum.SortOrder.LayoutOrder

Grid.Parent = GameScroll

local Padding = Instance.new("UIPadding")

Padding.PaddingTop = UDim.new(0, 4)

Padding.PaddingBottom = UDim.new(0, 10)

Padding.Parent = GameScroll

--==================================================
-- NO RESULTS
--==================================================

local NoResults = Instance.new("Frame")

NoResults.BackgroundTransparency = 1

NoResults.Size = UDim2.new(1, 0, 0, 100)

NoResults.Visible = false

NoResults.Parent = GameScroll

local NoIcon = Instance.new("TextLabel")

NoIcon.BackgroundTransparency = 1

NoIcon.Size = UDim2.new(1, 0, 0, 30)

NoIcon.Position = UDim2.new(0, 0, 0, 5)

NoIcon.Text = "⌕"

NoIcon.TextColor3 = SUBTEXT

NoIcon.TextSize = 24

NoIcon.Font = Enum.Font.GothamBold

NoIcon.Parent = NoResults

local NoText = Instance.new("TextLabel")

NoText.BackgroundTransparency = 1

NoText.Size = UDim2.new(1, 0, 0, 24)

NoText.Position = UDim2.new(0, 0, 0, 35)

NoText.Font = Enum.Font.GothamBold

NoText.Text = "No games found"

NoText.TextSize = 15

NoText.TextColor3 = TEXT

NoText.Parent = NoResults

local NoSub = Instance.new("TextLabel")

NoSub.BackgroundTransparency = 1

NoSub.Size = UDim2.new(1, 0, 0, 20)

NoSub.Position = UDim2.new(0, 0, 0, 58)

NoSub.Font = Enum.Font.Gotham

NoSub.Text = "Try another search"

NoSub.TextSize = 11

NoSub.TextColor3 = SUBTEXT

NoSub.Parent = NoResults

--==================================================
-- CARDS
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

    Card.ClipsDescendants = true

    Card.Parent = GameScroll

    Corner(Card, 13)

    local CardStroke = Stroke(
        Card,
        Color3.fromRGB(70, 78, 95),
        .78,
        1
    )

    --==================================================
    -- CARD GRADIENT
    --==================================================

    local CardGradient = Gradient(
        Card,
        Color3.fromRGB(23, 27, 36),
        Color3.fromRGB(27, 31, 41),
        0
    )

    --==================================================
    -- GLOW
    --==================================================

    local Glow = Instance.new("Frame")

    Glow.BackgroundColor3 = ACCENT

    Glow.BackgroundTransparency = 1

    Glow.BorderSizePixel = 0

    Glow.Size = UDim2.new(0, 4, 1, -20)

    Glow.Position = UDim2.new(0, 0, 0, 10)

    Glow.Parent = Card

    Corner(Glow, 4)

    --==================================================
    -- ICON BOX
    --==================================================

    local IconBox = Instance.new("Frame")

    IconBox.BackgroundColor3 = ICON_BG

    IconBox.Size = UDim2.new(0, 48, 0, 48)

    IconBox.Position = UDim2.new(0, 11, 0.5, -24)

    IconBox.BorderSizePixel = 0

    IconBox.Parent = Card

    Corner(IconBox, 12)

    local IconStroke = Stroke(
        IconBox,
        Color3.fromRGB(75, 85, 105),
        .72,
        1
    )

    Gradient(
        IconBox,
        Color3.fromRGB(30, 35, 46),
        Color3.fromRGB(37, 43, 56),
        135
    )

    local Icon = Instance.new("TextLabel")

    Icon.BackgroundTransparency = 1

    Icon.Size = UDim2.fromScale(1, 1)

    Icon.Text = gameData.Icon

    Icon.TextSize = 22

    Icon.Font = Enum.Font.GothamBold

    Icon.TextColor3 = TEXT

    Icon.Parent = IconBox

    --==================================================
    -- NAME
    --==================================================

    local Name = Instance.new("TextLabel")

    Name.BackgroundTransparency = 1

    Name.Position = UDim2.new(0, 70, 0, 14)

    Name.Size = UDim2.new(1, -112, 0, 22)

    Name.Font = Enum.Font.GothamSemibold

    Name.Text = gameData.Name

    Name.TextSize = 13

    Name.TextColor3 = TEXT

    Name.TextXAlignment = Enum.TextXAlignment.Left

    Name.TextTruncate = Enum.TextTruncate.AtEnd

    Name.Parent = Card

    --==================================================
    -- DESCRIPTION
    --==================================================

    local Description = Instance.new("TextLabel")

    Description.BackgroundTransparency = 1

    Description.Position = UDim2.new(0, 70, 0, 38)

    Description.Size = UDim2.new(1, -112, 0, 18)

    Description.Font = Enum.Font.Gotham

    Description.Text = gameData.Description

    Description.TextSize = 10

    Description.TextColor3 = SUBTEXT

    Description.TextXAlignment = Enum.TextXAlignment.Left

    Description.TextTruncate = Enum.TextTruncate.AtEnd

    Description.Parent = Card

    --==================================================
    -- STATUS DOT
    --==================================================

    local Status = Instance.new("Frame")

    Status.Size = UDim2.new(0, 6, 0, 6)

    Status.Position = UDim2.new(0, 70, 1, -13)

    Status.BackgroundColor3 = Color3.fromRGB(90, 220, 145)

    Status.BorderSizePixel = 0

    Status.Parent = Card

    Corner(Status, 6)

    local StatusText = Instance.new("TextLabel")

    StatusText.BackgroundTransparency = 1

    StatusText.Position = UDim2.new(0, 80, 1, -18)

    StatusText.Size = UDim2.new(0, 60, 0, 14)

    StatusText.Font = Enum.Font.Gotham

    StatusText.Text = "Ready"

    StatusText.TextSize = 9

    StatusText.TextColor3 = SUBTEXT

    StatusText.TextXAlignment = Enum.TextXAlignment.Left

    StatusText.Parent = Card

    --==================================================
    -- ARROW
    --==================================================

    local Arrow = Instance.new("TextLabel")

    Arrow.BackgroundTransparency = 1

    Arrow.AnchorPoint = Vector2.new(1, 0.5)

    Arrow.Position = UDim2.new(1, -12, 0.5, 0)

    Arrow.Size = UDim2.new(0, 22, 0, 25)

    Arrow.Text = "›"

    Arrow.TextColor3 = SUBTEXT

    Arrow.Font = Enum.Font.GothamBold

    Arrow.TextSize = 21

    Arrow.Parent = Card

    --==================================================
    -- SAVE CARD
    --==================================================

    Cards[#Cards + 1] = {
        Button = Card,
        Data = gameData,
    }

    --==================================================
    -- HOVER
    --==================================================

    Card.MouseEnter:Connect(function()

        PlaySound(Card, 0.12)

        Tween(Card, .14, {
            BackgroundColor3 = CARD_HOVER
        }):Play()

        Tween(CardStroke, .14, {
            Transparency = .35,
            Color = ACCENT,
            Thickness = 1.2
        }):Play()

        Tween(IconBox, .14, {
            BackgroundColor3 = Color3.fromRGB(42, 49, 64)
        }):Play()

        Tween(IconStroke, .14, {
            Transparency = .25,
            Color = ACCENT
        }):Play()

        Tween(Arrow, .14, {
            TextColor3 = ACCENT,
            Position = UDim2.new(1, -8, 0.5, 0)
        }):Play()

        Tween(Glow, .14, {
            BackgroundTransparency = .35
        }):Play()

        Tween(Status, .14, {
            BackgroundColor3 = ACCENT
        }):Play()

    end)

    Card.MouseLeave:Connect(function()

        Tween(Card, .14, {
            BackgroundColor3 = CARD
        }):Play()

        Tween(CardStroke, .14, {
            Transparency = .78,
            Color = Color3.fromRGB(70, 78, 95),
            Thickness = 1
        }):Play()

        Tween(IconBox, .14, {
            BackgroundColor3 = ICON_BG
        }):Play()

        Tween(IconStroke, .14, {
            Transparency = .72,
            Color = Color3.fromRGB(75, 85, 105)
        }):Play()

        Tween(Arrow, .14, {
            TextColor3 = SUBTEXT,
            Position = UDim2.new(1, -12, 0.5, 0)
        }):Play()

        Tween(Glow, .14, {
            BackgroundTransparency = 1
        }):Play()

        Tween(Status, .14, {
            BackgroundColor3 = Color3.fromRGB(90, 220, 145)
        }):Play()

    end)

    --==================================================
    -- CLICK
    --==================================================

    Card.Activated:Connect(function()

        PlaySound(Card, 0.65)

        Tween(Card, .07, {
            BackgroundColor3 = Color3.fromRGB(42, 48, 63)
        }):Play()

        Tween(IconBox, .07, {
            Size = UDim2.new(0, 44, 0, 44),
            Position = UDim2.new(0, 13, 0.5, -22)
        }):Play()

        task.wait(.07)

        Tween(Card, .10, {
            BackgroundColor3 = CARD_HOVER
        }):Play()

        Tween(IconBox, .10, {
            Size = UDim2.new(0, 48, 0, 48),
            Position = UDim2.new(0, 11, 0.5, -24)
        }):Play()

        -- callback

        if typeof(gameData.Action) == "function" then

            task.spawn(function()

                local success, err = pcall(gameData.Action)

                if not success then
                    warn("[YungakoHub] " .. tostring(err))
                end

            end)

        end

    end)

end

--==================================================
-- CREATE CARDS
--==================================================

for i, gameData in ipairs(Games) do
    CreateCard(gameData, i)
end

--==================================================
-- SEARCH
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

        Grid.CellSize = UDim2.new(
            1,
            -2,
            0,
            78
        )

    elseif width < 850 then

        Grid.CellSize = UDim2.new(
            0.5,
            -5,
            0,
            78
        )

    else

        Grid.CellSize = UDim2.new(
            0.5,
            -5,
            0,
            78
        )

    end

end

Main:GetPropertyChangedSignal("AbsoluteSize"):Connect(UpdateGrid)

task.defer(UpdateGrid)

--==================================================
-- REOPEN BUTTON
--==================================================

local Reopen = Instance.new("TextButton")

Reopen.Name = "Reopen"

Reopen.AnchorPoint = Vector2.new(0, 0.5)

Reopen.Position = UDim2.new(0, 18, 0.7, 0)

Reopen.Size = UDim2.new(0, 48, 0, 48)

Reopen.BackgroundColor3 = Color3.fromRGB(23, 27, 36)

Reopen.Text = "⚡"

Reopen.TextColor3 = TEXT

Reopen.TextSize = 21

Reopen.Font = Enum.Font.GothamBold

Reopen.Visible = false

Reopen.AutoButtonColor = false

Reopen.Parent = Gui

Corner(Reopen, 24)

local ReopenStroke = Stroke(
    Reopen,
    ACCENT,
    .5,
    1
)

Gradient(
    Reopen,
    Color3.fromRGB(25, 30, 42),
    Color3.fromRGB(37, 31, 53),
    135
)

Reopen.MouseEnter:Connect(function()

    PlaySound(Reopen, .18)

    Tween(Reopen, .12, {
        Size = UDim2.new(0, 52, 0, 52)
    }):Play()

    Tween(ReopenStroke, .12, {
        Transparency = .15
    }):Play()

end)

Reopen.MouseLeave:Connect(function()

    Tween(Reopen, .12, {
        Size = UDim2.new(0, 48, 0, 48)
    }):Play()

    Tween(ReopenStroke, .12, {
        Transparency = .5
    }):Play()

end)

--==================================================
-- MINIMIZE
--==================================================

Close.Activated:Connect(function()

    PlaySound(Close, .65)

    Tween(Main, .20, {
        Size = UDim2.new(
            Main.Size.X.Scale,
            Main.Size.X.Offset,
            0,
            0
        )
    }):Play()

    task.wait(.20)

    Main.Visible = false

    Reopen.Visible = true

end)

--==================================================
-- REOPEN
--==================================================

Reopen.Activated:Connect(function()

    PlaySound(Reopen, .65)

    Reopen.Visible = false

    Main.Visible = true

    Main.Size = UDim2.new(
        Main.Size.X.Scale,
        Main.Size.X.Offset,
        0,
        0
    )

    Tween(Main, .25, {
        Size = UDim2.new(
            0.78,
            0,
            0.72,
            0
        )
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

Main.Size = UDim2.new(
    0.78,
    0,
    0,
    0
)

Tween(Main, .30, {
    Size = UDim2.new(
        0.78,
        0,
        0.72,
        0
    )
}):Play()
```
