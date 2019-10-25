function [aeroForces] = paramSpace_1_2_1_1_2_1_2(sailStates,airStates)

	CL = (6.537765)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.653753)*sailStates.p + (42.360638)*sailStates.q + (-3.137250)*sailStates.r + (0.012050)*sailStates.de;
	CD = -2.408070;
	CY = (0.000000)*sailStates.alpha + (-0.025000)*sailStates.beta + (-1.254032)*sailStates.p + (0.000001)*sailStates.q + (-0.221120)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.955186)*sailStates.alpha + (0.627016)*sailStates.beta + (-1.222327)*sailStates.p + (11.754808)*sailStates.q + (-2.722234)*sailStates.r + (0.000336)*sailStates.de;
	Cm = (-10.999670)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.994064)*sailStates.p + (-135.529190)*sailStates.q + (10.463873)*sailStates.r + (-0.068373)*sailStates.de;
	Cn = (-0.165965)*sailStates.alpha + (0.110560)*sailStates.beta + (2.653432)*sailStates.p + (-11.195780)*sailStates.q + (0.025570)*sailStates.r + (-0.000207)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end