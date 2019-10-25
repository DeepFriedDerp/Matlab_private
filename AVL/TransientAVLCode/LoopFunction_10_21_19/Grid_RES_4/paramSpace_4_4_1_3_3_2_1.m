function [aeroForces] = paramSpace_4_4_1_3_3_2_1(sailStates,airStates)

	CL = (3.818314)*sailStates.alpha + (-0.141943)*sailStates.beta + (-2.226028)*sailStates.p + (32.723972)*sailStates.q + (0.740452)*sailStates.r + (0.010486)*sailStates.de;
	CD = 0.058930;
	CY = (0.074800)*sailStates.alpha + (-0.026751)*sailStates.beta + (0.089786)*sailStates.p + (0.684401)*sailStates.q + (-0.017933)*sailStates.r + (0.000143)*sailStates.de;

	Cl = (0.952990)*sailStates.alpha + (-0.114840)*sailStates.beta + (-0.910746)*sailStates.p + (7.226939)*sailStates.q + (0.442706)*sailStates.r + (-0.000095)*sailStates.de;
	Cm = (-13.791670)*sailStates.alpha + (0.434662)*sailStates.beta + (7.481241)*sailStates.p + (-127.495163)*sailStates.q + (-2.479341)*sailStates.r + (-0.066048)*sailStates.de;
	Cn = (-0.119642)*sailStates.alpha + (0.018466)*sailStates.beta + (-0.095419)*sailStates.p + (-0.387963)*sailStates.q + (-0.033223)*sailStates.r + (-0.000172)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end