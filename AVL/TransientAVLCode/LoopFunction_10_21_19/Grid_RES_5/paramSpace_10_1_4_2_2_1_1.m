function [aeroForces] = paramSpace_10_1_4_2_2_1_1(sailStates,airStates)

	CL = (4.157798)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.342786)*sailStates.p + (32.590282)*sailStates.q + (-0.305233)*sailStates.r + (0.010768)*sailStates.de;
	CD = -0.095620;
	CY = (0.077365)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.225926)*sailStates.p + (0.466416)*sailStates.q + (0.015848)*sailStates.r + (0.000100)*sailStates.de;

	Cl = (1.207669)*sailStates.alpha + (0.094119)*sailStates.beta + (-1.031475)*sailStates.p + (7.988042)*sailStates.q + (-0.334324)*sailStates.r + (0.000073)*sailStates.de;
	Cm = (-14.934415)*sailStates.alpha + (-0.000000)*sailStates.beta + (8.213301)*sailStates.p + (-131.613632)*sailStates.q + (0.996809)*sailStates.r + (-0.069591)*sailStates.de;
	Cn = (-0.295488)*sailStates.alpha + (-0.006581)*sailStates.beta + (0.570459)*sailStates.p + (-3.256275)*sailStates.q + (-0.011789)*sailStates.r + (-0.000196)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end