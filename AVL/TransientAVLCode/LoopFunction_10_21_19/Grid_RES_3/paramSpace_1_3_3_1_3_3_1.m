function [aeroForces] = paramSpace_1_3_3_1_3_3_1(sailStates,airStates)

	CL = (4.811282)*sailStates.alpha + (-0.309482)*sailStates.beta + (-1.430495)*sailStates.p + (20.890200)*sailStates.q + (1.255661)*sailStates.r + (0.008943)*sailStates.de;
	CD = -1.665300;
	CY = (-0.140264)*sailStates.alpha + (-0.022373)*sailStates.beta + (0.685624)*sailStates.p + (1.081942)*sailStates.q + (0.120997)*sailStates.r + (0.000225)*sailStates.de;

	Cl = (0.299888)*sailStates.alpha + (-0.464605)*sailStates.beta + (-0.344287)*sailStates.p + (0.771691)*sailStates.q + (1.421404)*sailStates.r + (-0.000988)*sailStates.de;
	Cm = (-14.784741)*sailStates.alpha + (1.302703)*sailStates.beta + (6.271500)*sailStates.p + (-108.520645)*sailStates.q + (-4.160841)*sailStates.r + (-0.065097)*sailStates.de;
	Cn = (1.418318)*sailStates.alpha + (-0.063953)*sailStates.beta + (-1.611465)*sailStates.p + (6.252521)*sailStates.q + (-0.023270)*sailStates.r + (-0.000192)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end