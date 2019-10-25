function [aeroForces] = paramSpace_2_4_2_3_1_2_1(sailStates,airStates)

	CL = (3.963399)*sailStates.alpha + (0.057059)*sailStates.beta + (-2.291796)*sailStates.p + (32.575150)*sailStates.q + (-0.170855)*sailStates.r + (0.010738)*sailStates.de;
	CD = 0.031300;
	CY = (-0.070537)*sailStates.alpha + (-0.025447)*sailStates.beta + (0.008660)*sailStates.p + (-0.563442)*sailStates.q + (0.000587)*sailStates.r + (-0.000120)*sailStates.de;

	Cl = (1.016257)*sailStates.alpha + (0.027425)*sailStates.beta + (-0.940478)*sailStates.p + (7.126825)*sailStates.q + (-0.101325)*sailStates.r + (-0.000118)*sailStates.de;
	Cm = (-14.411751)*sailStates.alpha + (-0.241117)*sailStates.beta + (7.876860)*sailStates.p + (-129.238022)*sailStates.q + (0.596881)*sailStates.r + (-0.068322)*sailStates.de;
	Cn = (0.113563)*sailStates.alpha + (0.002268)*sailStates.beta + (-0.057960)*sailStates.p + (0.860093)*sailStates.q + (-0.006458)*sailStates.r + (0.000170)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end