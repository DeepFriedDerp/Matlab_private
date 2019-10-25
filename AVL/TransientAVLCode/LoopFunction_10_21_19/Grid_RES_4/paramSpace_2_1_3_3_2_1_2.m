function [aeroForces] = paramSpace_2_1_3_3_2_1_2(sailStates,airStates)

	CL = (4.236498)*sailStates.alpha + (-0.210495)*sailStates.beta + (-2.564274)*sailStates.p + (35.475517)*sailStates.q + (-0.979143)*sailStates.r + (0.011045)*sailStates.de;
	CD = -0.185540;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (-0.375937)*sailStates.p + (-0.000001)*sailStates.q + (-0.024640)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.377502)*sailStates.alpha + (0.122149)*sailStates.beta + (-1.253140)*sailStates.p + (10.522188)*sailStates.q + (-0.828752)*sailStates.r + (0.000468)*sailStates.de;
	Cm = (-14.205069)*sailStates.alpha + (0.779526)*sailStates.beta + (8.546667)*sailStates.p + (-136.150452)*sailStates.q + (3.308394)*sailStates.r + (-0.069002)*sailStates.de;
	Cn = (-0.043602)*sailStates.alpha + (0.012815)*sailStates.beta + (0.779166)*sailStates.p + (-3.330620)*sailStates.q + (0.002111)*sailStates.r + (-0.000072)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end