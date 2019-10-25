function [aeroForces] = paramSpace_3_2_3_2_2_2_2(sailStates,airStates)

	CL = (4.050208)*sailStates.alpha + (0.026889)*sailStates.beta + (-2.566537)*sailStates.p + (34.977291)*sailStates.q + (0.337898)*sailStates.r + (0.011026)*sailStates.de;
	CD = 0.032840;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.083098)*sailStates.p + (0.000000)*sailStates.q + (-0.005447)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.280568)*sailStates.alpha + (-0.034115)*sailStates.beta + (-1.224301)*sailStates.p + (9.988915)*sailStates.q + (0.241756)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-14.656638)*sailStates.alpha + (-0.107388)*sailStates.beta + (8.754970)*sailStates.p + (-137.194580)*sailStates.q + (-1.155668)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.045486)*sailStates.alpha + (0.002591)*sailStates.beta + (-0.111778)*sailStates.p + (0.224784)*sailStates.q + (-0.003289)*sailStates.r + (0.000004)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end