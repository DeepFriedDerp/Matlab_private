function [aeroForces] = paramSpace_3_1_1_2_2_2_3(sailStates,airStates)

	CL = (3.932871)*sailStates.alpha + (0.043779)*sailStates.beta + (-2.949753)*sailStates.p + (37.936642)*sailStates.q + (0.369759)*sailStates.r + (0.011119)*sailStates.de;
	CD = 0.032470;
	CY = (-0.001036)*sailStates.alpha + (-0.024862)*sailStates.beta + (0.068905)*sailStates.p + (-0.100924)*sailStates.q + (-0.004506)*sailStates.r + (-0.000022)*sailStates.de;

	Cl = (1.425170)*sailStates.alpha + (-0.005090)*sailStates.beta + (-1.576456)*sailStates.p + (13.364149)*sailStates.q + (0.236976)*sailStates.r + (0.001000)*sailStates.de;
	Cm = (-14.290394)*sailStates.alpha + (-0.069286)*sailStates.beta + (10.037996)*sailStates.p + (-147.195892)*sailStates.q + (-1.217239)*sailStates.r + (-0.070159)*sailStates.de;
	Cn = (-0.090606)*sailStates.alpha + (0.001510)*sailStates.beta + (-0.076598)*sailStates.p + (0.200655)*sailStates.q + (-0.004040)*sailStates.r + (0.000060)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end