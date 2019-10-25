function [aeroForces] = paramSpace_1_2_4_3_1_3_2(sailStates,airStates)

	CL = (4.059105)*sailStates.alpha + (-0.001261)*sailStates.beta + (-2.445763)*sailStates.p + (32.799225)*sailStates.q + (-0.186913)*sailStates.r + (0.010308)*sailStates.de;
	CD = -0.131180;
	CY = (-0.058258)*sailStates.alpha + (-0.024506)*sailStates.beta + (0.180891)*sailStates.p + (-0.489618)*sailStates.q + (0.035929)*sailStates.r + (-0.000104)*sailStates.de;

	Cl = (1.273484)*sailStates.alpha + (-0.074952)*sailStates.beta + (-1.172598)*sailStates.p + (9.461476)*sailStates.q + (0.071034)*sailStates.r + (0.000408)*sailStates.de;
	Cm = (-15.028890)*sailStates.alpha + (-0.034197)*sailStates.beta + (8.786243)*sailStates.p + (-135.545776)*sailStates.q + (0.661704)*sailStates.r + (-0.067757)*sailStates.de;
	Cn = (0.319961)*sailStates.alpha + (-0.016779)*sailStates.beta + (-0.581038)*sailStates.p + (3.581108)*sailStates.q + (-0.055296)*sailStates.r + (0.000169)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end