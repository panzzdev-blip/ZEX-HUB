local Config = {
    Name = "ZEX HUB",
    Version = "2.0.0",

    Theme = {
        Background = Color3.fromRGB(8, 10, 9),
        Panel = Color3.fromRGB(16, 21, 18),
        Secondary = Color3.fromRGB(24, 32, 27),

        Primary = Color3.fromRGB(0, 255, 120),
        PrimaryDark = Color3.fromRGB(0, 170, 80),

        Text = Color3.fromRGB(240, 255, 245),
        Muted = Color3.fromRGB(135, 155, 142),

        Danger = Color3.fromRGB(255, 75, 75),
    },

    Animation = {
        Enabled = true,
        OpenDuration = 0.25,
        CloseDuration = 0.18,
    },

    UI = {
        FloatingLogoSize = 58,
        PanelWidth = 340,
        PanelHeight = 400,
        CornerRadius = 12,
    },
}

return Config
