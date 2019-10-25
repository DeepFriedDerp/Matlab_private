function [aeroForces] = paramSpace_2_1_1_1_2_2_2(sailStates,airStates)

	CL = (4.400318)*sailStates.alpha + (0.266725)*sailStates.beta + (-3.116148)*sailStates.p + (42.063271)*sailStates.q + (1.821599)*sailStates.r + (0.011762)*sailStates.de;
	CD = -0.602530;
	CY = (0.228164)*sailStates.alpha + (-0.023989)*sailStates.beta + (0.621415)*sailStates.p + (0.715007)*sailStates.q + (-0.081861)*sailStates.r + (0.000154)*sailStates.de;

	Cl = (1.359064)*sailStates.alpha + (-0.256453)*sailStates.beta + (-1.664920)*sailStates.p + (14.852630)*sailStates.q + (1.537933)*sailStates.r + (0.001138)*sailStates.de;
	Cm = (-12.438825)*sailStates.alpha + (-0.982806)*sailStates.beta + (9.832413)*sailStates.p + (-150.764221)*sailStates.q + (-6.110579)*sailStates.r + (-0.070345)*sailStates.de;
	Cn = (-0.639219)*sailStates.alpha + (0.044186)*sailStates.beta + (-1.242130)*sailStates.p + (4.410673)*sailStates.q + (-0.010106)*sailStates.r + (-0.000065)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end