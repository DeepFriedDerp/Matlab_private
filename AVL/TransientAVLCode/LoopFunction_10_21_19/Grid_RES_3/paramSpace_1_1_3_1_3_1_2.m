function [aeroForces] = paramSpace_1_1_3_1_3_1_2(sailStates,airStates)

	CL = (7.772468)*sailStates.alpha + (-0.653830)*sailStates.beta + (-2.594524)*sailStates.p + (42.251881)*sailStates.q + (-3.538022)*sailStates.r + (0.012095)*sailStates.de;
	CD = -3.021360;
	CY = (0.252662)*sailStates.alpha + (-0.028629)*sailStates.beta + (-1.480630)*sailStates.p + (1.671348)*sailStates.q + (-0.260916)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (3.042628)*sailStates.alpha + (0.463288)*sailStates.beta + (-1.230107)*sailStates.p + (12.290600)*sailStates.q + (-3.015318)*sailStates.r + (0.000345)*sailStates.de;
	Cm = (-12.912381)*sailStates.alpha + (2.388891)*sailStates.beta + (6.451351)*sailStates.p + (-132.498779)*sailStates.q + (11.713340)*sailStates.r + (-0.067243)*sailStates.de;
	Cn = (-0.371136)*sailStates.alpha + (0.128631)*sailStates.beta + (3.145020)*sailStates.p + (-14.858974)*sailStates.q + (0.060737)*sailStates.r + (-0.000740)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end