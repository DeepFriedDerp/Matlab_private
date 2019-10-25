function [aeroForces] = paramSpace_2_2_2_3_2_1_3(sailStates,airStates)

	CL = (4.259016)*sailStates.alpha + (-0.079330)*sailStates.beta + (-2.843784)*sailStates.p + (37.866619)*sailStates.q + (-1.024781)*sailStates.r + (0.011312)*sailStates.de;
	CD = -0.191080;
	CY = (-0.035125)*sailStates.alpha + (-0.025002)*sailStates.beta + (-0.402019)*sailStates.p + (0.065300)*sailStates.q + (-0.026352)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.438212)*sailStates.alpha + (0.175427)*sailStates.beta + (-1.442267)*sailStates.p + (12.167773)*sailStates.q + (-0.880272)*sailStates.r + (0.000733)*sailStates.de;
	Cm = (-14.242605)*sailStates.alpha + (0.312286)*sailStates.beta + (9.478666)*sailStates.p + (-144.341232)*sailStates.q + (3.483066)*sailStates.r + (-0.070808)*sailStates.de;
	Cn = (0.115348)*sailStates.alpha + (0.013191)*sailStates.beta + (0.811877)*sailStates.p + (-3.387667)*sailStates.q + (0.001677)*sailStates.r + (-0.000085)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end