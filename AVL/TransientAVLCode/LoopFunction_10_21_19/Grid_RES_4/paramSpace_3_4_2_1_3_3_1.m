function [aeroForces] = paramSpace_3_4_2_1_3_3_1(sailStates,airStates)

	CL = (5.258144)*sailStates.alpha + (-0.499296)*sailStates.beta + (-1.737534)*sailStates.p + (30.092642)*sailStates.q + (1.990873)*sailStates.r + (0.011024)*sailStates.de;
	CD = -1.786040;
	CY = (-0.048936)*sailStates.alpha + (-0.026627)*sailStates.beta + (0.808021)*sailStates.p + (1.915490)*sailStates.q + (-0.053028)*sailStates.r + (0.000404)*sailStates.de;

	Cl = (0.440494)*sailStates.alpha + (-0.603553)*sailStates.beta + (-0.456283)*sailStates.p + (3.073548)*sailStates.q + (1.835112)*sailStates.r + (-0.000891)*sailStates.de;
	Cm = (-11.391706)*sailStates.alpha + (1.953181)*sailStates.beta + (5.438685)*sailStates.p + (-112.650780)*sailStates.q + (-6.767218)*sailStates.r + (-0.066832)*sailStates.de;
	Cn = (1.465512)*sailStates.alpha + (0.030258)*sailStates.beta + (-1.862572)*sailStates.p + (7.114192)*sailStates.q + (0.003861)*sailStates.r + (-0.000413)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end