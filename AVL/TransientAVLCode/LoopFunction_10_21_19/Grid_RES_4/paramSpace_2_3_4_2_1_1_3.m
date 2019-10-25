function [aeroForces] = paramSpace_2_3_4_2_1_1_3(sailStates,airStates)

	CL = (4.306943)*sailStates.alpha + (0.083984)*sailStates.beta + (-3.003370)*sailStates.p + (39.367764)*sailStates.q + (-1.180271)*sailStates.r + (0.011535)*sailStates.de;
	CD = -0.345400;
	CY = (-0.155837)*sailStates.alpha + (-0.025144)*sailStates.beta + (-0.421748)*sailStates.p + (-0.668513)*sailStates.q + (-0.027713)*sailStates.r + (-0.000145)*sailStates.de;

	Cl = (1.339492)*sailStates.alpha + (0.263502)*sailStates.beta + (-1.533623)*sailStates.p + (12.937806)*sailStates.q + (-1.014247)*sailStates.r + (0.000852)*sailStates.de;
	Cm = (-13.837452)*sailStates.alpha + (-0.299971)*sailStates.beta + (9.968823)*sailStates.p + (-148.601761)*sailStates.q + (3.974689)*sailStates.r + (-0.071270)*sailStates.de;
	Cn = (0.291483)*sailStates.alpha + (0.015486)*sailStates.beta + (0.896637)*sailStates.p + (-3.392112)*sailStates.q + (-0.001260)*sailStates.r + (0.000084)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end