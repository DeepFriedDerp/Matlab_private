function [aeroForces] = paramSpace_2_2_4_1_3_3_3(sailStates,airStates)

	CL = (5.185677)*sailStates.alpha + (0.135000)*sailStates.beta + (-3.376822)*sailStates.p + (39.545891)*sailStates.q + (1.345148)*sailStates.r + (0.011001)*sailStates.de;
	CD = -1.727940;
	CY = (0.482161)*sailStates.alpha + (-0.025456)*sailStates.beta + (0.687480)*sailStates.p + (1.915493)*sailStates.q + (0.045262)*sailStates.r + (0.000419)*sailStates.de;

	Cl = (1.330523)*sailStates.alpha + (-0.391958)*sailStates.beta + (-1.918349)*sailStates.p + (16.021324)*sailStates.q + (1.430227)*sailStates.r + (0.001535)*sailStates.de;
	Cm = (-13.446513)*sailStates.alpha + (-0.576847)*sailStates.beta + (12.015100)*sailStates.p + (-160.694275)*sailStates.q + (-4.624563)*sailStates.r + (-0.072651)*sailStates.de;
	Cn = (-0.999419)*sailStates.alpha + (-0.028272)*sailStates.beta + (-1.702091)*sailStates.p + (6.648046)*sailStates.q + (-0.010266)*sailStates.r + (-0.000409)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end