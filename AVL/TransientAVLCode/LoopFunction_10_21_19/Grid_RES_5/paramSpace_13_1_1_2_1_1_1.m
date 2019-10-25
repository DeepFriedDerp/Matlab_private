function [aeroForces] = paramSpace_13_1_1_2_1_1_1(sailStates,airStates)

	CL = (4.000007)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.248218)*sailStates.p + (31.778589)*sailStates.q + (0.355655)*sailStates.r + (0.010428)*sailStates.de;
	CD = -0.034360;
	CY = (-0.029172)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.032172)*sailStates.p + (-0.261303)*sailStates.q + (0.005701)*sailStates.r + (-0.000055)*sailStates.de;

	Cl = (1.098850)*sailStates.alpha + (0.026512)*sailStates.beta + (-0.986337)*sailStates.p + (7.825227)*sailStates.q + (0.089811)*sailStates.r + (0.000038)*sailStates.de;
	Cm = (-14.785638)*sailStates.alpha + (0.000000)*sailStates.beta + (7.845167)*sailStates.p + (-129.217163)*sailStates.q + (-1.189783)*sailStates.r + (-0.067754)*sailStates.de;
	Cn = (-0.148136)*sailStates.alpha + (-0.004675)*sailStates.beta + (0.208856)*sailStates.p + (-1.083660)*sailStates.q + (-0.022351)*sailStates.r + (0.000069)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end