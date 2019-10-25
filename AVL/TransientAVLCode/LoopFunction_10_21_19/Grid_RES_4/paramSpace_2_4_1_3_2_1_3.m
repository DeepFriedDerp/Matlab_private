function [aeroForces] = paramSpace_2_4_1_3_2_1_3(sailStates,airStates)

	CL = (4.185215)*sailStates.alpha + (0.258306)*sailStates.beta + (-2.823984)*sailStates.p + (37.616959)*sailStates.q + (-1.031281)*sailStates.r + (0.011112)*sailStates.de;
	CD = -0.188360;
	CY = (-0.036732)*sailStates.alpha + (-0.024696)*sailStates.beta + (-0.416314)*sailStates.p + (0.065300)*sailStates.q + (-0.027294)*sailStates.r + (0.000014)*sailStates.de;

	Cl = (1.327459)*sailStates.alpha + (0.271617)*sailStates.beta + (-1.367778)*sailStates.p + (11.287819)*sailStates.q + (-0.898096)*sailStates.r + (0.000551)*sailStates.de;
	Cm = (-13.955100)*sailStates.alpha + (-1.069011)*sailStates.beta + (9.408575)*sailStates.p + (-143.297119)*sailStates.q + (3.527060)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (0.079987)*sailStates.alpha + (0.012693)*sailStates.beta + (0.837358)*sailStates.p + (-3.450129)*sailStates.q + (0.001601)*sailStates.r + (-0.000073)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end