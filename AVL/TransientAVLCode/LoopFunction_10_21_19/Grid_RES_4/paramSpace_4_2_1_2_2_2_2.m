function [aeroForces] = paramSpace_4_2_1_2_2_2_2(sailStates,airStates)

	CL = (3.927230)*sailStates.alpha + (0.058280)*sailStates.beta + (-2.481243)*sailStates.p + (35.209171)*sailStates.q + (0.973529)*sailStates.r + (0.010767)*sailStates.de;
	CD = 0.057290;
	CY = (-0.000000)*sailStates.alpha + (-0.024976)*sailStates.beta + (0.199987)*sailStates.p + (-0.000000)*sailStates.q + (-0.039780)*sailStates.r + (0.000000)*sailStates.de;

	Cl = (1.227431)*sailStates.alpha + (-0.078736)*sailStates.beta + (-1.179394)*sailStates.p + (10.101959)*sailStates.q + (0.645171)*sailStates.r + (0.000375)*sailStates.de;
	Cm = (-13.992836)*sailStates.alpha + (-0.181088)*sailStates.beta + (8.186090)*sailStates.p + (-134.847153)*sailStates.q + (-3.240741)*sailStates.r + (-0.067687)*sailStates.de;
	Cn = (-0.124630)*sailStates.alpha + (0.018813)*sailStates.beta + (-0.272668)*sailStates.p + (0.624601)*sailStates.q + (-0.027725)*sailStates.r + (0.000040)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end