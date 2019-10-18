function [aeroForces] = paramSpace_2_1_1_1_1_1_1(sailStates,airStates)

	CL = (5.695092)*sailStates.alpha + (-1.832959)*sailStates.beta + (-3.629054)*sailStates.p + (49.783531)*sailStates.q + (2.139068)*sailStates.r + (0.012678)*sailStates.de;
	CD = -5.231700;
	CY = (1.850412)*sailStates.alpha + (-0.115824)*sailStates.beta + (0.280608)*sailStates.p + (14.544415)*sailStates.q + (-0.031792)*sailStates.r + (0.003076)*sailStates.de;

	Cl = (-4.319149)*sailStates.alpha + (-0.985713)*sailStates.beta + (-1.831628)*sailStates.p + (15.813559)*sailStates.q + (2.315308)*sailStates.r + (0.001536)*sailStates.de;
	Cm = (1.338319)*sailStates.alpha + (8.076408)*sailStates.beta + (11.403772)*sailStates.p + (-163.031067)*sailStates.q + (-7.511948)*sailStates.r + (-0.068057)*sailStates.de;
	Cn = (-2.070733)*sailStates.alpha + (0.192980)*sailStates.beta + (-0.818067)*sailStates.p + (-8.325106)*sailStates.q + (-0.176919)*sailStates.r + (-0.003996)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end