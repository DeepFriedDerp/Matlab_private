function [aeroForces] = paramSpace_14_1_4_2_2_1_2(sailStates,airStates)

	CL = (3.785789)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.642059)*sailStates.p + (35.089733)*sailStates.q + (0.504495)*sailStates.r + (0.010153)*sailStates.de;
	CD = 0.016230;
	CY = (0.025343)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.027671)*sailStates.p + (0.230434)*sailStates.q + (0.005906)*sailStates.r + (0.000049)*sailStates.de;

	Cl = (1.270375)*sailStates.alpha + (0.004708)*sailStates.beta + (-1.319184)*sailStates.p + (11.007702)*sailStates.q + (0.240387)*sailStates.r + (0.000633)*sailStates.de;
	Cm = (-13.965934)*sailStates.alpha + (0.000000)*sailStates.beta + (9.257459)*sailStates.p + (-140.986252)*sailStates.q + (-1.782496)*sailStates.r + (-0.068102)*sailStates.de;
	Cn = (-0.269910)*sailStates.alpha + (-0.001001)*sailStates.beta + (0.318201)*sailStates.p + (-2.666169)*sailStates.q + (-0.059418)*sailStates.r + (-0.000109)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end