function [aeroForces] = paramSpace_3_2_3_2_1_3_3(sailStates,airStates)

	CL = (4.781437)*sailStates.alpha + (0.117302)*sailStates.beta + (-2.987307)*sailStates.p + (39.486130)*sailStates.q + (1.601130)*sailStates.r + (0.011470)*sailStates.de;
	CD = -0.619500;
	CY = (0.004315)*sailStates.alpha + (-0.025317)*sailStates.beta + (0.700708)*sailStates.p + (-0.870358)*sailStates.q + (-0.045957)*sailStates.r + (-0.000189)*sailStates.de;

	Cl = (1.771748)*sailStates.alpha + (-0.279345)*sailStates.beta + (-1.556362)*sailStates.p + (13.370076)*sailStates.q + (1.393399)*sailStates.r + (0.000905)*sailStates.de;
	Cm = (-14.322452)*sailStates.alpha + (-0.456032)*sailStates.beta + (9.785001)*sailStates.p + (-147.878265)*sailStates.q + (-5.425851)*sailStates.r + (-0.071191)*sailStates.de;
	Cn = (-0.218156)*sailStates.alpha + (0.021430)*sailStates.beta + (-1.449953)*sailStates.p + (6.844013)*sailStates.q + (0.010393)*sailStates.r + (0.000376)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end