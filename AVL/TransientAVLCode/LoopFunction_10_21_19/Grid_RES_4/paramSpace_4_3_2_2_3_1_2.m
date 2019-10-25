function [aeroForces] = paramSpace_4_3_2_2_3_1_2(sailStates,airStates)

	CL = (4.329924)*sailStates.alpha + (0.022966)*sailStates.beta + (-2.425620)*sailStates.p + (31.530878)*sailStates.q + (-0.234200)*sailStates.r + (0.009969)*sailStates.de;
	CD = -0.425710;
	CY = (0.086546)*sailStates.alpha + (-0.025754)*sailStates.beta + (-0.374423)*sailStates.p + (0.756270)*sailStates.q + (0.074450)*sailStates.r + (0.000160)*sailStates.de;

	Cl = (1.353454)*sailStates.alpha + (0.162521)*sailStates.beta + (-1.136958)*sailStates.p + (8.716722)*sailStates.q + (-0.444953)*sailStates.r + (0.000340)*sailStates.de;
	Cm = (-15.505723)*sailStates.alpha + (-0.107458)*sailStates.beta + (9.104131)*sailStates.p + (-135.926239)*sailStates.q + (0.697809)*sailStates.r + (-0.067795)*sailStates.de;
	Cn = (-0.439539)*sailStates.alpha + (-0.027646)*sailStates.beta + (1.019256)*sailStates.p + (-5.787427)*sailStates.q + (-0.069261)*sailStates.r + (-0.000293)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end