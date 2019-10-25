function [aeroForces] = paramSpace_1_2_2_3_2_3_3(sailStates,airStates)

	CL = (3.977901)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.711006)*sailStates.p + (35.299316)*sailStates.q + (-0.311330)*sailStates.r + (0.010462)*sailStates.de;
	CD = -0.074680;
	CY = (0.029766)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.078317)*sailStates.p + (0.173374)*sailStates.q + (0.013809)*sailStates.r + (0.000037)*sailStates.de;

	Cl = (1.317320)*sailStates.alpha + (-0.046075)*sailStates.beta + (-1.367927)*sailStates.p + (11.320295)*sailStates.q + (-0.065471)*sailStates.r + (0.000672)*sailStates.de;
	Cm = (-14.579780)*sailStates.alpha + (-0.000000)*sailStates.beta + (9.524652)*sailStates.p + (-142.582367)*sailStates.q + (1.081625)*sailStates.r + (-0.069099)*sailStates.de;
	Cn = (0.177510)*sailStates.alpha + (-0.008124)*sailStates.beta + (-0.395461)*sailStates.p + (2.449671)*sailStates.q + (-0.038744)*sailStates.r + (-0.000017)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end