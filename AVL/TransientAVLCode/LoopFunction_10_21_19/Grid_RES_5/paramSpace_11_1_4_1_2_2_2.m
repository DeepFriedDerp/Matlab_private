function [aeroForces] = paramSpace_11_1_4_1_2_2_2(sailStates,airStates)

	CL = (4.427629)*sailStates.alpha + (-0.000000)*sailStates.beta + (-3.126774)*sailStates.p + (41.614658)*sailStates.q + (1.685452)*sailStates.r + (0.011665)*sailStates.de;
	CD = -0.616630;
	CY = (0.233669)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.622732)*sailStates.p + (0.768922)*sailStates.q + (-0.065370)*sailStates.r + (0.000167)*sailStates.de;

	Cl = (1.332584)*sailStates.alpha + (-0.342337)*sailStates.beta + (-1.640766)*sailStates.p + (14.313196)*sailStates.q + (1.482120)*sailStates.r + (0.001054)*sailStates.de;
	Cm = (-12.633107)*sailStates.alpha + (0.000000)*sailStates.beta + (10.045277)*sailStates.p + (-151.567520)*sailStates.q + (-5.731761)*sailStates.r + (-0.071297)*sailStates.de;
	Cn = (-0.580134)*sailStates.alpha + (0.035981)*sailStates.beta + (-1.255930)*sailStates.p + (4.407045)*sailStates.q + (-0.006105)*sailStates.r + (-0.000121)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end