function [aeroForces] = paramSpace_2_1_1_3_3_2_2(sailStates,airStates)

	CL = (3.999211)*sailStates.alpha + (-0.119226)*sailStates.beta + (-2.541751)*sailStates.p + (34.755058)*sailStates.q + (-0.474069)*sailStates.r + (0.010827)*sailStates.de;
	CD = 0.033970;
	CY = (0.062144)*sailStates.alpha + (-0.025475)*sailStates.beta + (-0.177853)*sailStates.p + (0.498142)*sailStates.q + (-0.011710)*sailStates.r + (0.000107)*sailStates.de;

	Cl = (1.339185)*sailStates.alpha + (0.036490)*sailStates.beta + (-1.244388)*sailStates.p + (10.326236)*sailStates.q + (-0.372167)*sailStates.r + (0.000457)*sailStates.de;
	Cm = (-14.393991)*sailStates.alpha + (0.516681)*sailStates.beta + (8.627870)*sailStates.p + (-135.916275)*sailStates.q + (1.631335)*sailStates.r + (-0.068978)*sailStates.de;
	Cn = (-0.026594)*sailStates.alpha + (0.004936)*sailStates.beta + (0.296126)*sailStates.p + (-1.326632)*sailStates.q + (0.000167)*sailStates.r + (-0.000149)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end