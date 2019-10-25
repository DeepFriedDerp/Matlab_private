function [aeroForces] = paramSpace_1_4_4_3_2_1_3(sailStates,airStates)

	CL = (4.130639)*sailStates.alpha + (0.339939)*sailStates.beta + (-2.763086)*sailStates.p + (39.407040)*sailStates.q + (-1.727615)*sailStates.r + (0.011190)*sailStates.de;
	CD = -0.184560;
	CY = (-0.033520)*sailStates.alpha + (-0.024227)*sailStates.beta + (-0.532374)*sailStates.p + (0.194782)*sailStates.q + (-0.105875)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.308686)*sailStates.alpha + (0.368921)*sailStates.beta + (-1.329160)*sailStates.p + (11.830851)*sailStates.q + (-1.323375)*sailStates.r + (0.000530)*sailStates.de;
	Cm = (-12.817155)*sailStates.alpha + (-1.169994)*sailStates.beta + (8.501665)*sailStates.p + (-140.845245)*sailStates.q + (5.721565)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (0.202469)*sailStates.alpha + (0.051152)*sailStates.beta + (0.996134)*sailStates.p + (-3.919969)*sailStates.q + (-0.012800)*sailStates.r + (-0.000163)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end