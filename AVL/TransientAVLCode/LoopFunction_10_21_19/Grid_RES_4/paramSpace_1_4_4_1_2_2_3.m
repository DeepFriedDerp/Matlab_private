function [aeroForces] = paramSpace_1_4_4_1_2_2_3(sailStates,airStates)

	CL = (3.517470)*sailStates.alpha + (0.219597)*sailStates.beta + (-3.314949)*sailStates.p + (42.204720)*sailStates.q + (-1.307014)*sailStates.r + (0.011056)*sailStates.de;
	CD = 0.077700;
	CY = (-0.030183)*sailStates.alpha + (-0.022885)*sailStates.beta + (-0.303361)*sailStates.p + (0.662188)*sailStates.q + (-0.060271)*sailStates.r + (0.000141)*sailStates.de;

	Cl = (1.249851)*sailStates.alpha + (0.215552)*sailStates.beta + (-1.807237)*sailStates.p + (15.971258)*sailStates.q + (-0.907402)*sailStates.r + (0.001335)*sailStates.de;
	Cm = (-12.649112)*sailStates.alpha + (-0.692642)*sailStates.beta + (10.878457)*sailStates.p + (-157.701080)*sailStates.q + (4.343370)*sailStates.r + (-0.069233)*sailStates.de;
	Cn = (0.463893)*sailStates.alpha + (0.028711)*sailStates.beta + (0.363004)*sailStates.p + (-0.950929)*sailStates.q + (-0.037193)*sailStates.r + (-0.000258)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end