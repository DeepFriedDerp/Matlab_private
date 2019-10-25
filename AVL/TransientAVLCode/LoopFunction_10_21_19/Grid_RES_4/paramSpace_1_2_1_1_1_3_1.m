function [aeroForces] = paramSpace_1_2_1_1_1_3_1(sailStates,airStates)

	CL = (6.366724)*sailStates.alpha + (0.131769)*sailStates.beta + (-1.506410)*sailStates.p + (19.883114)*sailStates.q + (2.024199)*sailStates.r + (0.008573)*sailStates.de;
	CD = -2.587850;
	CY = (-0.665456)*sailStates.alpha + (-0.022259)*sailStates.beta + (1.158635)*sailStates.p + (-2.326704)*sailStates.q + (0.230717)*sailStates.r + (-0.000486)*sailStates.de;

	Cl = (1.881528)*sailStates.alpha + (-0.438571)*sailStates.beta + (-0.455703)*sailStates.p + (1.190682)*sailStates.q + (2.004378)*sailStates.r + (-0.000626)*sailStates.de;
	Cm = (-18.097109)*sailStates.alpha + (-0.472812)*sailStates.beta + (7.449583)*sailStates.p + (-113.341965)*sailStates.q + (-6.543067)*sailStates.r + (-0.065707)*sailStates.de;
	Cn = (2.555624)*sailStates.alpha + (-0.103619)*sailStates.beta + (-2.648979)*sailStates.p + (13.830766)*sailStates.q + (-0.110724)*sailStates.r + (0.000855)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end