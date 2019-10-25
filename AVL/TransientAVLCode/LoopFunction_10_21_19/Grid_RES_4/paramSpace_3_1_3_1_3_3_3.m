function [aeroForces] = paramSpace_3_1_3_1_3_3_3(sailStates,airStates)

	CL = (5.166292)*sailStates.alpha + (0.552884)*sailStates.beta + (-3.506682)*sailStates.p + (44.444725)*sailStates.q + (2.231911)*sailStates.r + (0.011860)*sailStates.de;
	CD = -1.839090;
	CY = (0.519853)*sailStates.alpha + (-0.023061)*sailStates.beta + (0.894676)*sailStates.p + (1.471500)*sailStates.q + (-0.058588)*sailStates.r + (0.000320)*sailStates.de;

	Cl = (1.295456)*sailStates.alpha + (-0.352406)*sailStates.beta + (-1.999273)*sailStates.p + (17.695683)*sailStates.q + (2.054967)*sailStates.r + (0.001687)*sailStates.de;
	Cm = (-11.143721)*sailStates.alpha + (-2.197569)*sailStates.beta + (11.342207)*sailStates.p + (-161.242615)*sailStates.q + (-7.595372)*sailStates.r + (-0.071759)*sailStates.de;
	Cn = (-1.461199)*sailStates.alpha + (0.033195)*sailStates.beta + (-1.930630)*sailStates.p + (7.164794)*sailStates.q + (0.000300)*sailStates.r + (-0.000229)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end