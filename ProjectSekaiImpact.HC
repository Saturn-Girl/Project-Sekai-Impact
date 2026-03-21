// ProjectSekaiImpact.HC
// Project Sekai Impact - HolyC Port
// Saturn Computing LLC
// OracleTale / Project Sekai Impact
// Proprietary
//
// R.I.P Terry A. Davis 1969-2018
// "God's Lonely Programmer"
//
// NOTE: HolyC runs on TempleOS
// No DLL loading - TempleOS uses its own library system
// No Ursina - TempleOS has its own 3D/2D engine
// No ctypes - direct memory access in HolyC

// -----------------------------------------------------------------------
// Player stats
// -----------------------------------------------------------------------
I64 Player_HP    = 100;
I64 Player_ATK   = 10;
I64 Player_DEF   = 5;

// -----------------------------------------------------------------------
// GetHP
// Returns player HP
// -----------------------------------------------------------------------
I64 GetHP()
{
    return Player_HP;
}

// -----------------------------------------------------------------------
// SetHP
// Sets player HP
// -----------------------------------------------------------------------
U0 SetHP(I64 hp)
{
    Player_HP = hp;
}

// -----------------------------------------------------------------------
// LoadLibrary
// In TempleOS we don't load DLLs
// Instead we include HC files directly
// -----------------------------------------------------------------------
U0 LoadLibrary()
{
    // TempleOS has no DLL support
    // Everything is compiled together
    I64 hp = GetHP();
    Print("[ INFO ] Got HP: %d\n", hp);
}

// -----------------------------------------------------------------------
// LoadModels
// TempleOS has its own sprite/3D system
// using GrPrint and graphic functions
// -----------------------------------------------------------------------
U0 LoadModels()
{
    // TempleOS uses its own mesh format not FBX
    // Draw a placeholder sprite for AuMicroscopiiB_chan
    GrFloodFill(160, 100, RED);
    Print("[ INFO ] AuMicroscopiiB_chan loaded\n");
}

// -----------------------------------------------------------------------
// HandleInput
// TempleOS input handling
// -----------------------------------------------------------------------
U0 HandleInput()
{
    I64 key;
    key = GetKey;
    if (key == 'e' || key == 'E')
    {
        Print("[ INFO ] editor camera mode\n");
        // TempleOS has no EditorCamera
        // but we can toggle a debug view
    }
}

// -----------------------------------------------------------------------
// GameLoop
// Main game loop - replaces app.run()
// -----------------------------------------------------------------------
U0 GameLoop()
{
    Print("[ INFO ] ProjectSekaiImpact starting...\n");
    Print("[ INFO ] Running on TempleOS\n");

    while (TRUE)
    {
        // Clear screen
        DocClear;

        // Draw game
        LoadModels;

        // Handle input
        HandleInput;

        // Sleep a bit
        Sleep(16); // ~60fps
    }
}

// -----------------------------------------------------------------------
// Main entry point
// Replaces if __name__ == "__main__":
// -----------------------------------------------------------------------
U0 Main()
{
    Print("[ INFO ] ProjectSekaiImpact.HC\n");
    Print("[ INFO ] Saturn Computing LLC\n");
    Print("[ INFO ] Proprietary\n");
    Print("[ INFO ] R.I.P Terry Davis 1969-2018\n");

    LoadLibrary;
    GameLoop;
}

// Run main
Main;
