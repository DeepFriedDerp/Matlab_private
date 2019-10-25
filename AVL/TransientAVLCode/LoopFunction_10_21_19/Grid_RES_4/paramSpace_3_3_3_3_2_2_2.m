function [aeroForces] = paramSpace_3_3_3_3_2_2_2(sailStates,airStates)

	CL = (4.050208)*sailStates.alpha + (-0.026889)*sailStates.beta + (-2.566537)*sailStates.p + (34.977291)*sailStates.q + (0.337898)*sailStates.r + (0.011026)*sailStates.de;
	CD = 0.032840;
	CY = (0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.083098)*sailStates.p + (0.000000)*sailStates.q + (-0.005447)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.230508)*sailStates.alpha + (-0.048745)*sailStates.beta + (-1.191654)*sailStates.p + (9.585043)*sailStates.q + (0.239602)*sailStates.r + (0.000300)*sailStates.de;
	Cm = (-14.656638)*sailStates.alpha + (0.107388)*sailStates.beta + (8.754970)*sailStates.p + (-137.194580)*sailStates.q + (-1.155668)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.038564)*sailStates.alpha + (0.002839)*sailStates.beta + (-0.113918)*sailStates.p + (0.251255)*sailStates.q + (-0.003148)*sailStates.r + (0.000004)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end