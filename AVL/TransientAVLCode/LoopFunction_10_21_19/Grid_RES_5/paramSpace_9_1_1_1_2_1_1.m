function [aeroForces] = paramSpace_9_1_1_1_2_1_1(sailStates,airStates)

	CL = (5.096302)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.052516)*sailStates.p + (29.984110)*sailStates.q + (-1.405403)*sailStates.r + (0.010724)*sailStates.de;
	CD = -0.948060;
	CY = (0.287947)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.757858)*sailStates.p + (1.046668)*sailStates.q + (0.026355)*sailStates.r + (0.000224)*sailStates.de;

	Cl = (1.440721)*sailStates.alpha + (0.336558)*sailStates.beta + (-0.792911)*sailStates.p + (5.692456)*sailStates.q + (-1.349923)*sailStates.r + (-0.000312)*sailStates.de;
	Cm = (-15.503710)*sailStates.alpha + (0.000000)*sailStates.beta + (7.318169)*sailStates.p + (-123.745377)*sailStates.q + (4.791425)*sailStates.r + (-0.069078)*sailStates.de;
	Cn = (-1.061390)*sailStates.alpha + (-0.011753)*sailStates.beta + (1.671437)*sailStates.p + (-8.292980)*sailStates.q + (-0.010426)*sailStates.r + (-0.000415)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end