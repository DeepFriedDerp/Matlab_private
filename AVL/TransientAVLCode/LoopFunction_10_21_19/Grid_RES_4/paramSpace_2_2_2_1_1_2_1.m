function [aeroForces] = paramSpace_2_2_2_1_1_2_1(sailStates,airStates)

	CL = (3.855009)*sailStates.alpha + (-0.000997)*sailStates.beta + (-1.698922)*sailStates.p + (27.715847)*sailStates.q + (0.221244)*sailStates.r + (0.010634)*sailStates.de;
	CD = -0.015160;
	CY = (-0.318749)*sailStates.alpha + (-0.024226)*sailStates.beta + (0.226696)*sailStates.p + (-1.915493)*sailStates.q + (0.014926)*sailStates.r + (-0.000407)*sailStates.de;

	Cl = (0.719670)*sailStates.alpha + (-0.029799)*sailStates.beta + (-0.512216)*sailStates.p + (3.252934)*sailStates.q + (0.214812)*sailStates.r + (-0.000724)*sailStates.de;
	Cm = (-14.109665)*sailStates.alpha + (0.019017)*sailStates.beta + (5.996246)*sailStates.p + (-113.694908)*sailStates.q + (-0.714097)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (0.570448)*sailStates.alpha + (-0.003332)*sailStates.beta + (-0.476872)*sailStates.p + (3.636882)*sailStates.q + (-0.015104)*sailStates.r + (0.000585)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end