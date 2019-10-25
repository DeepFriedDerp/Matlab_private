function [aeroForces] = paramSpace_7_1_4_1_2_2_1(sailStates,airStates)

	CL = (4.470227)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.041991)*sailStates.p + (30.041773)*sailStates.q + (0.893347)*sailStates.r + (0.010723)*sailStates.de;
	CD = -0.576190;
	CY = (0.019050)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.441016)*sailStates.p + (0.910009)*sailStates.q + (0.015497)*sailStates.r + (0.000195)*sailStates.de;

	Cl = (0.909021)*sailStates.alpha + (-0.257347)*sailStates.beta + (-0.786360)*sailStates.p + (5.710696)*sailStates.q + (0.931825)*sailStates.r + (-0.000335)*sailStates.de;
	Cm = (-14.520683)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.198297)*sailStates.p + (-123.255226)*sailStates.q + (-3.077064)*sailStates.r + (-0.069033)*sailStates.de;
	Cn = (0.507973)*sailStates.alpha + (-0.008987)*sailStates.beta + (-1.022372)*sailStates.p + (3.904575)*sailStates.q + (-0.002672)*sailStates.r + (-0.000194)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end