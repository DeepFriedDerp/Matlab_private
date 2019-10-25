function [aeroForces] = paramSpace_3_3_2_2_1_1_1(sailStates,airStates)

	CL = (4.272777)*sailStates.alpha + (0.052024)*sailStates.beta + (-2.130485)*sailStates.p + (30.536974)*sailStates.q + (-0.531453)*sailStates.r + (0.010626)*sailStates.de;
	CD = -0.326690;
	CY = (-0.031701)*sailStates.alpha + (-0.024761)*sailStates.beta + (-0.300582)*sailStates.p + (-0.668511)*sailStates.q + (0.019725)*sailStates.r + (-0.000143)*sailStates.de;

	Cl = (0.969840)*sailStates.alpha + (0.189313)*sailStates.beta + (-0.850061)*sailStates.p + (6.230006)*sailStates.q + (-0.607278)*sailStates.r + (-0.000243)*sailStates.de;
	Cm = (-14.799535)*sailStates.alpha + (-0.223232)*sailStates.beta + (7.551335)*sailStates.p + (-125.787453)*sailStates.q + (1.819265)*sailStates.r + (-0.068952)*sailStates.de;
	Cn = (-0.331708)*sailStates.alpha + (-0.011341)*sailStates.beta + (0.735306)*sailStates.p + (-2.924248)*sailStates.q + (-0.004820)*sailStates.r + (0.000136)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end