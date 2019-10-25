function [aeroForces] = paramSpace_1_1_2_1_1_1_3(sailStates,airStates)

	CL = (5.002580)*sailStates.alpha + (-0.725673)*sailStates.beta + (-3.532091)*sailStates.p + (49.960659)*sailStates.q + (-3.152824)*sailStates.r + (0.012474)*sailStates.de;
	CD = -1.876960;
	CY = (-0.564067)*sailStates.alpha + (-0.021492)*sailStates.beta + (-1.100049)*sailStates.p + (-1.002331)*sailStates.q + (-0.218778)*sailStates.r + (-0.000214)*sailStates.de;

	Cl = (1.153455)*sailStates.alpha + (0.367326)*sailStates.beta + (-1.985095)*sailStates.p + (19.170979)*sailStates.q + (-2.713115)*sailStates.r + (0.001709)*sailStates.de;
	Cm = (-8.247901)*sailStates.alpha + (2.763310)*sailStates.beta + (9.953156)*sailStates.p + (-160.076126)*sailStates.q + (10.484643)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (1.923009)*sailStates.alpha + (0.114037)*sailStates.beta + (2.178321)*sailStates.p + (-7.477606)*sailStates.q + (-0.027951)*sailStates.r + (0.000057)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end