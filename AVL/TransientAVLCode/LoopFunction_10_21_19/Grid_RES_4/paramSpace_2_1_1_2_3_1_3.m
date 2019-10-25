function [aeroForces] = paramSpace_2_1_1_2_3_1_3(sailStates,airStates)

	CL = (4.712993)*sailStates.alpha + (-0.372037)*sailStates.beta + (-2.967494)*sailStates.p + (39.236496)*sailStates.q + (-1.607846)*sailStates.r + (0.011269)*sailStates.de;
	CD = -0.621620;
	CY = (-0.007531)*sailStates.alpha + (-0.025991)*sailStates.beta + (-0.715033)*sailStates.p + (0.870358)*sailStates.q + (-0.046958)*sailStates.r + (0.000188)*sailStates.de;

	Cl = (1.797024)*sailStates.alpha + (0.211638)*sailStates.beta + (-1.579556)*sailStates.p + (13.698676)*sailStates.q + (-1.417873)*sailStates.r + (0.000982)*sailStates.de;
	Cm = (-14.040861)*sailStates.alpha + (1.499506)*sailStates.beta + (9.714826)*sailStates.p + (-146.834122)*sailStates.q + (5.471121)*sailStates.r + (-0.070120)*sailStates.de;
	Cn = (0.259780)*sailStates.alpha + (0.023530)*sailStates.beta + (1.469078)*sailStates.p + (-6.827231)*sailStates.q + (0.009956)*sailStates.r + (-0.000360)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end