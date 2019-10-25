function [aeroForces] = paramSpace_4_1_2_1_1_2_1(sailStates,airStates)

	CL = (4.778051)*sailStates.alpha + (-0.000000)*sailStates.beta + (-1.978203)*sailStates.p + (27.622896)*sailStates.q + (0.970492)*sailStates.r + (0.009969)*sailStates.de;
	CD = -0.826230;
	CY = (-0.277741)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.633047)*sailStates.p + (-1.241890)*sailStates.q + (0.089013)*sailStates.r + (-0.000264)*sailStates.de;

	Cl = (1.322710)*sailStates.alpha + (-0.266713)*sailStates.beta + (-0.768512)*sailStates.p + (5.076574)*sailStates.q + (1.025658)*sailStates.r + (-0.000272)*sailStates.de;
	Cm = (-15.941586)*sailStates.alpha + (0.000000)*sailStates.beta + (7.691076)*sailStates.p + (-123.350212)*sailStates.q + (-3.198268)*sailStates.r + (-0.067889)*sailStates.de;
	Cn = (1.032347)*sailStates.alpha + (-0.037484)*sailStates.beta + (-1.483856)*sailStates.p + (7.895562)*sailStates.q + (-0.049291)*sailStates.r + (0.000473)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end