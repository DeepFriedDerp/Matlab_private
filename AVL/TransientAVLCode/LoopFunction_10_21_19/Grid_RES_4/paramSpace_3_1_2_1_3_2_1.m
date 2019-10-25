function [aeroForces] = paramSpace_3_1_2_1_3_2_1(sailStates,airStates)

	CL = (3.809482)*sailStates.alpha + (-0.018673)*sailStates.beta + (-1.679552)*sailStates.p + (27.433439)*sailStates.q + (-0.231148)*sailStates.r + (0.010499)*sailStates.de;
	CD = -0.020310;
	CY = (0.322562)*sailStates.alpha + (-0.022945)*sailStates.beta + (-0.241966)*sailStates.p + (1.915493)*sailStates.q + (0.015792)*sailStates.r + (0.000404)*sailStates.de;

	Cl = (0.773322)*sailStates.alpha + (0.025596)*sailStates.beta + (-0.535641)*sailStates.p + (3.580025)*sailStates.q + (-0.237553)*sailStates.r + (-0.000636)*sailStates.de;
	Cm = (-13.961823)*sailStates.alpha + (0.079463)*sailStates.beta + (5.932350)*sailStates.p + (-112.650780)*sailStates.q + (0.764644)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (-0.583936)*sailStates.alpha + (-0.005235)*sailStates.beta + (0.501483)*sailStates.p + (-3.676754)*sailStates.q + (-0.014929)*sailStates.r + (-0.000576)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end