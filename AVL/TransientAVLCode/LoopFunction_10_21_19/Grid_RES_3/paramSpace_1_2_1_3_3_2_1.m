function [aeroForces] = paramSpace_1_2_1_3_3_2_1(sailStates,airStates)

	CL = (3.906846)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.236095)*sailStates.p + (33.241913)*sailStates.q + (-0.927824)*sailStates.r + (0.010523)*sailStates.de;
	CD = 0.059220;
	CY = (0.070485)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.268455)*sailStates.p + (0.318251)*sailStates.q + (-0.047366)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.130633)*sailStates.alpha + (0.121535)*sailStates.beta + (-0.958863)*sailStates.p + (7.933969)*sailStates.q + (-0.665688)*sailStates.r + (-0.000027)*sailStates.de;
	Cm = (-13.651229)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.332160)*sailStates.p + (-127.854218)*sailStates.q + (3.138889)*sailStates.r + (-0.067624)*sailStates.de;
	Cn = (-0.091119)*sailStates.alpha + (0.021430)*sailStates.beta + (0.446390)*sailStates.p + (-1.693717)*sailStates.q + (-0.009021)*sailStates.r + (-0.000109)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end