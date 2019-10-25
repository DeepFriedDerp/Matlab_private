function [aeroForces] = paramSpace_3_1_3_3_2_2_3(sailStates,airStates)

	CL = (3.954784)*sailStates.alpha + (0.084600)*sailStates.beta + (-2.807226)*sailStates.p + (36.819546)*sailStates.q + (0.369688)*sailStates.r + (0.010986)*sailStates.de;
	CD = 0.033370;
	CY = (0.001943)*sailStates.alpha + (-0.024863)*sailStates.beta + (0.093057)*sailStates.p + (-0.065300)*sailStates.q + (-0.006102)*sailStates.r + (-0.000014)*sailStates.de;

	Cl = (1.396497)*sailStates.alpha + (-0.017699)*sailStates.beta + (-1.460211)*sailStates.p + (12.289467)*sailStates.q + (0.270080)*sailStates.r + (0.000811)*sailStates.de;
	Cm = (-14.304484)*sailStates.alpha + (-0.335148)*sailStates.beta + (9.557001)*sailStates.p + (-143.297119)*sailStates.q + (-1.262532)*sailStates.r + (-0.069741)*sailStates.de;
	Cn = (-0.088377)*sailStates.alpha + (0.002392)*sailStates.beta + (-0.116559)*sailStates.p + (0.213975)*sailStates.q + (-0.003816)*sailStates.r + (0.000024)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end