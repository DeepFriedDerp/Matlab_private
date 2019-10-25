function [aeroForces] = paramSpace_4_1_3_1_3_1_3(sailStates,airStates)

	CL = (6.125331)*sailStates.alpha + (-0.320510)*sailStates.beta + (-3.192161)*sailStates.p + (34.096462)*sailStates.q + (-1.351551)*sailStates.r + (0.009309)*sailStates.de;
	CD = -2.449550;
	CY = (-0.266052)*sailStates.alpha + (-0.021492)*sailStates.beta + (-0.963993)*sailStates.p + (1.002334)*sailStates.q + (0.191786)*sailStates.r + (0.000214)*sailStates.de;

	Cl = (2.495511)*sailStates.alpha + (0.362279)*sailStates.beta + (-1.877545)*sailStates.p + (14.982499)*sailStates.q + (-1.463908)*sailStates.r + (0.001709)*sailStates.de;
	Cm = (-15.915705)*sailStates.alpha + (1.232419)*sailStates.beta + (12.898250)*sailStates.p + (-160.076126)*sailStates.q + (4.321338)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (0.718128)*sailStates.alpha + (-0.109829)*sailStates.beta + (2.518010)*sailStates.p + (-13.579298)*sailStates.q + (-0.135436)*sailStates.r + (-0.000524)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end