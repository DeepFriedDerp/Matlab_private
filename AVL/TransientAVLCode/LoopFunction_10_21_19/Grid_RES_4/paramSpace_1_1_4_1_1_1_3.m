function [aeroForces] = paramSpace_1_1_4_1_1_1_3(sailStates,airStates)

	CL = (5.027259)*sailStates.alpha + (-0.681956)*sailStates.beta + (-3.534153)*sailStates.p + (49.862545)*sailStates.q + (-3.132446)*sailStates.r + (0.012654)*sailStates.de;
	CD = -1.840190;
	CY = (-0.552963)*sailStates.alpha + (-0.021908)*sailStates.beta + (-1.070810)*sailStates.p + (-1.002333)*sailStates.q + (-0.213105)*sailStates.r + (-0.000214)*sailStates.de;

	Cl = (1.173784)*sailStates.alpha + (0.356723)*sailStates.beta + (-1.985985)*sailStates.p + (19.166649)*sailStates.q + (-2.664752)*sailStates.r + (0.001709)*sailStates.de;
	Cm = (-8.666184)*sailStates.alpha + (2.494892)*sailStates.beta + (9.976152)*sailStates.p + (-160.076126)*sailStates.q + (10.369028)*sailStates.r + (-0.069511)*sailStates.de;
	Cn = (1.886074)*sailStates.alpha + (0.112025)*sailStates.beta + (2.134243)*sailStates.p + (-7.455841)*sailStates.q + (-0.026991)*sailStates.r + (0.000026)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end