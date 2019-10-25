function [aeroForces] = paramSpace_1_2_1_3_2_1_3(sailStates,airStates)

	CL = (4.146478)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.799297)*sailStates.p + (39.504086)*sailStates.q + (-1.641784)*sailStates.r + (0.011185)*sailStates.de;
	CD = -0.180470;
	CY = (-0.037888)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.549826)*sailStates.p + (0.173373)*sailStates.q + (-0.096966)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.397030)*sailStates.alpha + (0.267999)*sailStates.beta + (-1.395710)*sailStates.p + (12.417702)*sailStates.q + (-1.322523)*sailStates.r + (0.000672)*sailStates.de;
	Cm = (-12.829979)*sailStates.alpha + (0.000000)*sailStates.beta + (8.742687)*sailStates.p + (-142.582367)*sailStates.q + (5.516368)*sailStates.r + (-0.069099)*sailStates.de;
	Cn = (0.243163)*sailStates.alpha + (0.047255)*sailStates.beta + (1.014293)*sailStates.p + (-3.774040)*sailStates.q + (-0.011173)*sailStates.r + (-0.000123)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end