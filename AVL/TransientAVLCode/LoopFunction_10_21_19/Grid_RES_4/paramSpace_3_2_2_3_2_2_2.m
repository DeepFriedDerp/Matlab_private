function [aeroForces] = paramSpace_3_2_2_3_2_2_2(sailStates,airStates)

	CL = (4.063941)*sailStates.alpha + (0.019664)*sailStates.beta + (-2.566783)*sailStates.p + (34.960709)*sailStates.q + (0.329150)*sailStates.r + (0.011056)*sailStates.de;
	CD = 0.028690;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.068126)*sailStates.p + (0.000000)*sailStates.q + (-0.004465)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.280948)*sailStates.alpha + (-0.026876)*sailStates.beta + (-1.224424)*sailStates.p + (9.988156)*sailStates.q + (0.217775)*sailStates.r + (0.000388)*sailStates.de;
	Cm = (-14.725522)*sailStates.alpha + (-0.061502)*sailStates.beta + (8.758286)*sailStates.p + (-137.194580)*sailStates.q + (-1.105066)*sailStates.r + (-0.070064)*sailStates.de;
	Cn = (-0.043896)*sailStates.alpha + (0.002110)*sailStates.beta + (-0.089662)*sailStates.p + (0.213204)*sailStates.q + (-0.003169)*sailStates.r + (0.000014)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end