function [aeroForces] = paramSpace_4_1_2_3_2_3_2(sailStates,airStates)

	CL = (4.142889)*sailStates.alpha + (0.347347)*sailStates.beta + (-2.511553)*sailStates.p + (37.318733)*sailStates.q + (1.635957)*sailStates.r + (0.010975)*sailStates.de;
	CD = -0.187470;
	CY = (-0.000000)*sailStates.alpha + (-0.024786)*sailStates.beta + (0.515873)*sailStates.p + (-0.000001)*sailStates.q + (-0.102613)*sailStates.r + (-0.000000)*sailStates.de;

	Cl = (1.346685)*sailStates.alpha + (-0.147873)*sailStates.beta + (-1.217392)*sailStates.p + (11.039225)*sailStates.q + (1.283194)*sailStates.r + (0.000455)*sailStates.de;
	Cm = (-12.695366)*sailStates.alpha + (-1.256076)*sailStates.beta + (7.681727)*sailStates.p + (-133.820877)*sailStates.q + (-5.438483)*sailStates.r + (-0.066661)*sailStates.de;
	Cn = (-0.064415)*sailStates.alpha + (0.050385)*sailStates.beta + (-0.975444)*sailStates.p + (3.643677)*sailStates.q + (-0.013073)*sailStates.r + (0.000087)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end