function [aeroForces] = paramSpace_13_1_3_1_1_2_1(sailStates,airStates)

	CL = (5.224863)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.068703)*sailStates.p + (35.299751)*sailStates.q + (2.250766)*sailStates.r + (0.011280)*sailStates.de;
	CD = -1.016350;
	CY = (-0.283999)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.902744)*sailStates.p + (-0.624084)*sailStates.q + (-0.159200)*sailStates.r + (-0.000132)*sailStates.de;

	Cl = (1.559325)*sailStates.alpha + (-0.426479)*sailStates.beta + (-0.779807)*sailStates.p + (7.126940)*sailStates.q + (1.878196)*sailStates.r + (-0.000371)*sailStates.de;
	Cm = (-12.285285)*sailStates.alpha + (0.000000)*sailStates.beta + (5.648077)*sailStates.p + (-120.478767)*sailStates.q + (-7.493334)*sailStates.r + (-0.066945)*sailStates.de;
	Cn = (1.042986)*sailStates.alpha + (0.075200)*sailStates.beta + (-1.921583)*sailStates.p + (8.808893)*sailStates.q + (0.031883)*sailStates.r + (0.000310)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end