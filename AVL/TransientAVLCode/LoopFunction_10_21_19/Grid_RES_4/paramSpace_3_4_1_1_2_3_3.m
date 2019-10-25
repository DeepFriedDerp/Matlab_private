function [aeroForces] = paramSpace_3_4_1_1_2_3_3(sailStates,airStates)

	CL = (6.058120)*sailStates.alpha + (-0.569853)*sailStates.beta + (-3.490307)*sailStates.p + (44.504822)*sailStates.q + (2.653885)*sailStates.r + (0.011917)*sailStates.de;
	CD = -2.312360;
	CY = (0.388897)*sailStates.alpha + (-0.024620)*sailStates.beta + (1.138273)*sailStates.p + (-0.221998)*sailStates.q + (-0.074583)*sailStates.r + (-0.000048)*sailStates.de;

	Cl = (1.966008)*sailStates.alpha + (-0.729490)*sailStates.beta + (-1.891265)*sailStates.p + (16.515217)*sailStates.q + (2.360804)*sailStates.r + (0.001384)*sailStates.de;
	Cm = (-12.534136)*sailStates.alpha + (2.129413)*sailStates.beta + (11.155532)*sailStates.p + (-160.446381)*sailStates.q + (-8.954000)*sailStates.r + (-0.071664)*sailStates.de;
	Cn = (-1.337429)*sailStates.alpha + (0.033706)*sailStates.beta + (-2.454676)*sailStates.p + (11.024037)*sailStates.q + (0.014048)*sailStates.r + (0.000338)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end