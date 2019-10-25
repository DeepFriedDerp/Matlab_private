function [aeroForces] = paramSpace_2_4_3_1_1_1_2(sailStates,airStates)

	CL = (5.530099)*sailStates.alpha + (0.515027)*sailStates.beta + (-2.622275)*sailStates.p + (37.260319)*sailStates.q + (-2.106295)*sailStates.r + (0.011424)*sailStates.de;
	CD = -1.801060;
	CY = (-0.219606)*sailStates.alpha + (-0.026414)*sailStates.beta + (-0.843794)*sailStates.p + (-1.693496)*sailStates.q + (-0.055365)*sailStates.r + (-0.000363)*sailStates.de;

	Cl = (1.084740)*sailStates.alpha + (0.622747)*sailStates.beta + (-1.179005)*sailStates.p + (9.779965)*sailStates.q + (-1.929548)*sailStates.r + (0.000247)*sailStates.de;
	Cm = (-12.387431)*sailStates.alpha + (-2.005995)*sailStates.beta + (8.392386)*sailStates.p + (-136.946671)*sailStates.q + (7.151669)*sailStates.r + (-0.069082)*sailStates.de;
	Cn = (-0.107364)*sailStates.alpha + (0.030986)*sailStates.beta + (1.888641)*sailStates.p + (-7.173461)*sailStates.q + (0.002472)*sailStates.r + (0.000314)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end