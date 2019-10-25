function [aeroForces] = paramSpace_1_3_3_1_3_1_2(sailStates,airStates)

	CL = (7.772468)*sailStates.alpha + (0.653830)*sailStates.beta + (-2.594524)*sailStates.p + (42.251881)*sailStates.q + (-3.538022)*sailStates.r + (0.012095)*sailStates.de;
	CD = -3.021360;
	CY = (0.252662)*sailStates.alpha + (-0.021033)*sailStates.beta + (-1.480630)*sailStates.p + (1.671348)*sailStates.q + (-0.260916)*sailStates.r + (0.000353)*sailStates.de;

	Cl = (2.937411)*sailStates.alpha + (0.872455)*sailStates.beta + (-1.145455)*sailStates.p + (11.229731)*sailStates.q + (-3.000493)*sailStates.r + (0.000118)*sailStates.de;
	Cm = (-12.912381)*sailStates.alpha + (-2.388890)*sailStates.beta + (6.451351)*sailStates.p + (-132.498779)*sailStates.q + (11.713340)*sailStates.r + (-0.067243)*sailStates.de;
	Cn = (-0.550961)*sailStates.alpha + (0.106897)*sailStates.beta + (3.159946)*sailStates.p + (-15.046033)*sailStates.q + (0.063351)*sailStates.r + (-0.000740)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end