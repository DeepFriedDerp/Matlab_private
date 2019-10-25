function [aeroForces] = paramSpace_3_1_2_1_1_2_2(sailStates,airStates)

	CL = (4.568424)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.936087)*sailStates.p + (35.228462)*sailStates.q + (0.481033)*sailStates.r + (0.010152)*sailStates.de;
	CD = -0.728960;
	CY = (0.036131)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.491515)*sailStates.p + (-0.624083)*sailStates.q + (0.086690)*sailStates.r + (-0.000134)*sailStates.de;

	Cl = (1.671210)*sailStates.alpha + (-0.220865)*sailStates.beta + (-1.569236)*sailStates.p + (12.651224)*sailStates.q + (0.645607)*sailStates.r + (0.001057)*sailStates.de;
	Cm = (-15.261549)*sailStates.alpha + (0.000000)*sailStates.beta + (10.975950)*sailStates.p + (-150.579605)*sailStates.q + (-1.514518)*sailStates.r + (-0.069965)*sailStates.de;
	Cn = (0.065101)*sailStates.alpha + (-0.038944)*sailStates.beta + (-1.352068)*sailStates.p + (7.579409)*sailStates.q + (-0.075822)*sailStates.r + (0.000304)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end