function [aeroForces] = paramSpace_3_1_2_2_1_2_1(sailStates,airStates)

	CL = (3.993243)*sailStates.alpha + (0.079109)*sailStates.beta + (-2.137282)*sailStates.p + (31.478556)*sailStates.q + (0.475161)*sailStates.r + (0.010701)*sailStates.de;
	CD = 0.010360;
	CY = (-0.112874)*sailStates.alpha + (-0.025429)*sailStates.beta + (0.175745)*sailStates.p + (-0.668512)*sailStates.q + (-0.011495)*sailStates.r + (-0.000142)*sailStates.de;

	Cl = (1.128872)*sailStates.alpha + (-0.030288)*sailStates.beta + (-0.914370)*sailStates.p + (7.280594)*sailStates.q + (0.339495)*sailStates.r + (-0.000072)*sailStates.de;
	Cm = (-14.359697)*sailStates.alpha + (-0.253718)*sailStates.beta + (7.260485)*sailStates.p + (-124.743294)*sailStates.q + (-1.592880)*sailStates.r + (-0.067899)*sailStates.de;
	Cn = (0.185103)*sailStates.alpha + (0.004622)*sailStates.beta + (-0.330447)*sailStates.p + (1.885863)*sailStates.q + (0.003269)*sailStates.r + (0.000218)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end