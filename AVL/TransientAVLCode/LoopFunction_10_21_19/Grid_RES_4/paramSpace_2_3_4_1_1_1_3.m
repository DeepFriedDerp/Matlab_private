function [aeroForces] = paramSpace_2_3_4_1_1_1_3(sailStates,airStates)

	CL = (5.196440)*sailStates.alpha + (0.170029)*sailStates.beta + (-3.526891)*sailStates.p + (44.677238)*sailStates.q + (-2.213910)*sailStates.r + (0.012098)*sailStates.de;
	CD = -1.784310;
	CY = (-0.510333)*sailStates.alpha + (-0.025345)*sailStates.beta + (-0.864860)*sailStates.p + (-1.471504)*sailStates.q + (-0.056841)*sailStates.r + (-0.000322)*sailStates.de;

	Cl = (1.264206)*sailStates.alpha + (0.540135)*sailStates.beta + (-1.943596)*sailStates.p + (16.962452)*sailStates.q + (-2.002985)*sailStates.r + (0.001525)*sailStates.de;
	Cm = (-11.516447)*sailStates.alpha + (-0.641762)*sailStates.beta + (11.416653)*sailStates.p + (-162.286758)*sailStates.q + (7.484890)*sailStates.r + (-0.072841)*sailStates.de;
	Cn = (1.332720)*sailStates.alpha + (0.031866)*sailStates.beta + (1.890789)*sailStates.p + (-7.196709)*sailStates.q + (0.001027)*sailStates.r + (0.000198)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end