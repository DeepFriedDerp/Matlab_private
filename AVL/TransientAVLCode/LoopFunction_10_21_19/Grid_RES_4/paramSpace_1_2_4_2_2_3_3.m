function [aeroForces] = paramSpace_1_2_4_2_2_3_3(sailStates,airStates)

	CL = (4.148056)*sailStates.alpha + (0.013820)*sailStates.beta + (-2.791617)*sailStates.p + (34.908981)*sailStates.q + (-0.105896)*sailStates.r + (0.010248)*sailStates.de;
	CD = -0.315210;
	CY = (0.073763)*sailStates.alpha + (-0.025265)*sailStates.beta + (0.221012)*sailStates.p + (0.301044)*sailStates.q + (0.043994)*sailStates.r + (0.000064)*sailStates.de;

	Cl = (1.398671)*sailStates.alpha + (-0.125908)*sailStates.beta + (-1.473062)*sailStates.p + (12.213688)*sailStates.q + (0.176233)*sailStates.r + (0.000892)*sailStates.de;
	Cm = (-14.997983)*sailStates.alpha + (-0.098591)*sailStates.beta + (10.107166)*sailStates.p + (-145.703583)*sailStates.q + (0.391202)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (0.126231)*sailStates.alpha + (-0.027086)*sailStates.beta + (-0.757400)*sailStates.p + (4.077844)*sailStates.q + (-0.057712)*sailStates.r + (-0.000043)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end