"<marker name='MARKER'>TEXT</marker>";
private _biefingText = "
<marker name='marker_hq'>Crossroads</marker> - HQ<br/>
<marker name='marker_alpha1_1'>Alpha 1-1</marker> - Squad on overwatch (your squad)<br/>
<marker name='marker_alpha1_2'>Alpha 1-2</marker> - Squad to assault the position
";
player createDiaryRecord ["Diary", ["Signal", _biefingText], taskNull, "", false];

private _biefingText = "
1. Get the final briefing before the attack.<br/>
2. Wait for Alpha 1-2 to make contact<br/>
3. Execute the ambush!
";
player createDiaryRecord ["Diary", ["Execution", _biefingText], taskNull, "", false];

private _biefingText = "
Eliminate the patrol!
";
player createDiaryRecord ["Diary", ["Mission", _biefingText], taskNull, "", false];

private _biefingText = "
After the AAF turned on NATO troops Camp Maxwell has become their base of operations
on Stratis. The enemy has sent a <marker name='marker_enemySquad'>patrol</marker> in squad strength to scout the area.
We can't let them find the camp. Two squads, Alpha 1-1 and Alpha 1-2, are tasked to eliminate the patrol.
";
player createDiaryRecord ["Diary", ["Situation", _biefingText], taskNull, "", false];
