function [aeroForces] = paramSpace_3_1_4_2_3_3_1(sailStates,airStates)

	CL = (4.271549)*sailStates.alpha + (0.301250)*sailStates.beta + (-2.178688)*sailStates.p + (32.633930)*sailStates.q + (1.098475)*sailStates.r + (0.010884)*sailStates.de;
	CD = -0.365830;
	CY = (0.037771)*sailStates.alpha + (-0.023582)*sailStates.beta + (0.433305)*sailStates.p + (0.870358)*sailStates.q + (-0.028308)*sailStates.r + (0.000185)*sailStates.de;

	Cl = (1.069138)*sailStates.alpha + (-0.179455)*sailStates.beta + (-0.932120)*sailStates.p + (7.574077)*sailStates.q + (1.002239)*sailStates.r + (-0.000038)*sailStates.de;
	Cm = (-13.497874)*sailStates.alpha + (-1.257054)*sailStates.beta + (7.206880)*sailStates.p + (-125.466835)*sailStates.q + (-3.764169)*sailStates.r + (-0.067966)*sailStates.de;
	Cn = (0.284241)*sailStates.alpha + (0.016173)*sailStates.beta + (-0.933864)*sailStates.p + (3.318309)*sailStates.q + (-0.000923)*sailStates.r + (-0.000189)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end