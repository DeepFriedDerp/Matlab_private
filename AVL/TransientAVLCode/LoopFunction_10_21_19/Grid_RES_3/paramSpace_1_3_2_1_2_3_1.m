function [aeroForces] = paramSpace_1_3_2_1_2_3_1(sailStates,airStates)

	CL = (5.499273)*sailStates.alpha + (-0.338994)*sailStates.beta + (-1.474076)*sailStates.p + (20.701799)*sailStates.q + (1.676356)*sailStates.r + (0.008843)*sailStates.de;
	CD = -2.099600;
	CY = (-0.413464)*sailStates.alpha + (-0.026316)*sailStates.beta + (0.933324)*sailStates.p + (-0.589408)*sailStates.q + (0.164570)*sailStates.r + (-0.000123)*sailStates.de;

	Cl = (0.937883)*sailStates.alpha + (-0.547068)*sailStates.beta + (-0.371405)*sailStates.p + (0.696863)*sailStates.q + (1.743670)*sailStates.r + (-0.000892)*sailStates.de;
	Cm = (-16.033993)*sailStates.alpha + (1.324648)*sailStates.beta + (6.771582)*sailStates.p + (-110.634644)*sailStates.q + (-5.507503)*sailStates.r + (-0.065270)*sailStates.de;
	Cn = (2.031741)*sailStates.alpha + (-0.068568)*sailStates.beta + (-2.142106)*sailStates.p + (10.028154)*sailStates.q + (-0.058708)*sailStates.r + (0.000320)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end