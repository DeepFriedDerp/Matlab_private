function [aeroForces] = paramSpace_1_3_2_2_2_3_1(sailStates,airStates)

	CL = (4.126644)*sailStates.alpha + (-0.065341)*sailStates.beta + (-2.025917)*sailStates.p + (28.505322)*sailStates.q + (0.284026)*sailStates.r + (0.009792)*sailStates.de;
	CD = -0.345650;
	CY = (-0.085372)*sailStates.alpha + (-0.025506)*sailStates.beta + (0.316389)*sailStates.p + (-0.267956)*sailStates.q + (0.055788)*sailStates.r + (-0.000056)*sailStates.de;

	Cl = (0.962610)*sailStates.alpha + (-0.168365)*sailStates.beta + (-0.782107)*sailStates.p + (5.384706)*sailStates.q + (0.468340)*sailStates.r + (-0.000292)*sailStates.de;
	Cm = (-14.928919)*sailStates.alpha + (0.282045)*sailStates.beta + (7.582784)*sailStates.p + (-123.711845)*sailStates.q + (-0.894309)*sailStates.r + (-0.066408)*sailStates.de;
	Cn = (0.521126)*sailStates.alpha + (-0.020663)*sailStates.beta + (-0.820340)*sailStates.p + (4.173022)*sailStates.q + (-0.037750)*sailStates.r + (0.000143)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end