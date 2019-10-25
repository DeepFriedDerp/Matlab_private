function [aeroForces] = paramSpace_1_1_3_1_3_1_1(sailStates,airStates)

	CL = (7.395954)*sailStates.alpha + (-0.728660)*sailStates.beta + (-1.730173)*sailStates.p + (35.931515)*sailStates.q + (-3.310544)*sailStates.r + (0.011665)*sailStates.de;
	CD = -2.987310;
	CY = (0.686726)*sailStates.alpha + (-0.027872)*sailStates.beta + (-1.404251)*sailStates.p + (1.002336)*sailStates.q + (-0.279287)*sailStates.r + (0.000207)*sailStates.de;

	Cl = (2.376814)*sailStates.alpha + (0.449128)*sailStates.beta + (-0.525214)*sailStates.p + (5.868166)*sailStates.q + (-2.827884)*sailStates.r + (-0.000755)*sailStates.de;
	Cm = (-10.326299)*sailStates.alpha + (2.705430)*sailStates.beta + (3.318538)*sailStates.p + (-107.565659)*sailStates.q + (10.908322)*sailStates.r + (-0.064308)*sailStates.de;
	Cn = (-2.514272)*sailStates.alpha + (0.145609)*sailStates.beta + (3.111863)*sailStates.p + (-14.694158)*sailStates.q + (0.077213)*sailStates.r + (-0.000479)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end