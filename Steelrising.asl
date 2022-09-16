state("Steelrising")
{
	float IGT: "GameSteelrising.dll", 0x10F76B0, 0x30, 0x40, 0x338, 0x1B8, 0x118, 0x0, 0x18C;
}

init
{
	vars.totalGameTime = 0;
}

update
{
	//print(modules.First().ModuleMemorySize.ToString());
	
	if (timer.CurrentPhase == TimerPhase.NotRunning){
			vars.totalGameTime = 0;
	}
}

start
{
	return current.IGT > old.IGT && old.IGT == 0;
}

gameTime
{
	if(current.IGT > old.IGT){
    return TimeSpan.FromSeconds(vars.totalGameTime + current.IGT);
    }
    if (current.IGT == 0 && old.IGT != 0){
        vars.totalGameTime = vars.totalGameTime + old.IGT;
        return TimeSpan.FromSeconds(vars.totalGameTime + current.IGT);
        }
}

split
{}

isLoading
{
	return true;
}

reset
{}
