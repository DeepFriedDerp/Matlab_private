function [aeroForces] = paramSpace_1_2_3_3_2_3_1(sailStates,airStates)

	CL = (3.957506)*sailStates.alpha + (-0.009437)*sailStates.beta + (-2.179869)*sailStates.p + (30.791733)*sailStates.q + (-0.220180)*sailStates.r + (0.010099)*sailStates.de;
	CD = -0.087540;
	CY = (-0.036745)*sailStates.alpha + (-0.024776)*sailStates.beta + (0.119523)*sailStates.p + (-0.194782)*sailStates.q + (0.023768)*sailStates.r + (-0.000041)*sailStates.de;

	Cl = (1.103042)*sailStates.alpha + (-0.055840)*sailStates.beta + (-0.957458)*sailStates.p + (7.507501)*sailStates.q + (0.027029)*sailStates.r + (0.000045)*sailStates.de;
	Cm = (-14.680198)*sailStates.alpha + (0.013907)*sailStates.beta + (7.798993)*sailStates.p + (-127.822792)*sailStates.q + (0.781651)*sailStates.r + (-0.067003)*sailStates.de;
	Cn = (0.293511)*sailStates.alpha + (-0.012262)*sailStates.beta + (-0.418722)*sailStates.p + (2.506951)*sailStates.q + (-0.040064)*sailStates.r + (0.000086)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end