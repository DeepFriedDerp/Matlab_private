function [aeroForces] = paramSpace_12_1_2_2_2_2_1(sailStates,airStates)

	CL = (4.108735)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.358269)*sailStates.p + (34.699764)*sailStates.q + (1.078985)*sailStates.r + (0.011085)*sailStates.de;
	CD = -0.084050;
	CY = (0.038076)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.320740)*sailStates.p + (0.520429)*sailStates.q + (-0.045096)*sailStates.r + (0.000111)*sailStates.de;

	Cl = (1.125188)*sailStates.alpha + (-0.181246)*sailStates.beta + (-1.031538)*sailStates.p + (8.568928)*sailStates.q + (0.842410)*sailStates.r + (0.000082)*sailStates.de;
	Cm = (-13.719613)*sailStates.alpha + (0.000000)*sailStates.beta + (7.659311)*sailStates.p + (-130.856766)*sailStates.q + (-3.626715)*sailStates.r + (-0.068597)*sailStates.de;
	Cn = (0.060973)*sailStates.alpha + (0.025472)*sailStates.beta + (-0.626919)*sailStates.p + (2.106135)*sailStates.q + (-0.009909)*sailStates.r + (-0.000093)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end