function [aeroForces] = paramSpace_1_1_1_3_1_1_1(sailStates,airStates)

	CL = (3.999284)*sailStates.alpha + (-0.296481)*sailStates.beta + (-2.289694)*sailStates.p + (34.932381)*sailStates.q + (-1.328311)*sailStates.r + (0.010793)*sailStates.de;
	CD = -0.124610;
	CY = (-0.040382)*sailStates.alpha + (-0.022991)*sailStates.beta + (-0.414424)*sailStates.p + (-0.665002)*sailStates.q + (-0.073011)*sailStates.r + (-0.000140)*sailStates.de;

	Cl = (1.125881)*sailStates.alpha + (0.156688)*sailStates.beta + (-1.023484)*sailStates.p + (8.899304)*sailStates.q + (-1.074204)*sailStates.r + (0.000143)*sailStates.de;
	Cm = (-12.574519)*sailStates.alpha + (1.177396)*sailStates.beta + (7.190707)*sailStates.p + (-128.181442)*sailStates.q + (4.478399)*sailStates.r + (-0.066826)*sailStates.de;
	Cn = (-0.070335)*sailStates.alpha + (0.039195)*sailStates.beta + (0.798241)*sailStates.p + (-2.470153)*sailStates.q + (-0.017168)*sailStates.r + (0.000138)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end