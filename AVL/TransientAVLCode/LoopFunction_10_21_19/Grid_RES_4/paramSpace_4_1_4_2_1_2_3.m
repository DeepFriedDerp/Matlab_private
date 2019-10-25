function [aeroForces] = paramSpace_4_1_4_2_1_2_3(sailStates,airStates)

	CL = (3.800089)*sailStates.alpha + (0.283315)*sailStates.beta + (-2.825210)*sailStates.p + (38.513599)*sailStates.q + (1.341738)*sailStates.r + (0.010533)*sailStates.de;
	CD = 0.065050;
	CY = (-0.066650)*sailStates.alpha + (-0.028480)*sailStates.beta + (0.409660)*sailStates.p + (-1.057312)*sailStates.q + (-0.081600)*sailStates.r + (-0.000224)*sailStates.de;

	Cl = (1.473207)*sailStates.alpha + (-0.067048)*sailStates.beta + (-1.504980)*sailStates.p + (13.530840)*sailStates.q + (1.003600)*sailStates.r + (0.000917)*sailStates.de;
	Cm = (-13.064567)*sailStates.alpha + (-1.094841)*sailStates.beta + (9.086017)*sailStates.p + (-143.598221)*sailStates.q + (-4.510277)*sailStates.r + (-0.067664)*sailStates.de;
	Cn = (-0.264989)*sailStates.alpha + (0.031575)*sailStates.beta + (-0.619511)*sailStates.p + (2.373669)*sailStates.q + (-0.016958)*sailStates.r + (0.000334)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end