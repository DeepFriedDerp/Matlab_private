function [aeroForces] = paramSpace_2_3_4_1_3_2_3(sailStates,airStates)

	CL = (3.952865)*sailStates.alpha + (0.038014)*sailStates.beta + (-3.434809)*sailStates.p + (42.205097)*sailStates.q + (-0.876794)*sailStates.r + (0.011544)*sailStates.de;
	CD = -0.041170;
	CY = (0.110663)*sailStates.alpha + (-0.024496)*sailStates.beta + (-0.362507)*sailStates.p + (1.915493)*sailStates.q + (-0.023558)*sailStates.r + (0.000419)*sailStates.de;

	Cl = (1.545650)*sailStates.alpha + (0.123267)*sailStates.beta + (-1.904038)*sailStates.p + (16.319536)*sailStates.q + (-0.646705)*sailStates.r + (0.001446)*sailStates.de;
	Cm = (-13.984955)*sailStates.alpha + (-0.102424)*sailStates.beta + (11.521437)*sailStates.p + (-160.694275)*sailStates.q + (2.907300)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (0.194665)*sailStates.alpha + (0.006421)*sailStates.beta + (0.657697)*sailStates.p + (-4.090158)*sailStates.q + (0.008309)*sailStates.r + (-0.000644)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end