function [aeroForces] = paramSpace_1_1_1_2_2_2_1(sailStates,airStates)

	CL = (6.214395)*sailStates.alpha + (0.198783)*sailStates.beta + (-2.513136)*sailStates.p + (31.401140)*sailStates.q + (-0.458227)*sailStates.r + (0.009176)*sailStates.de;
	CD = -2.088480;
	CY = (1.523884)*sailStates.alpha + (-0.053853)*sailStates.beta + (-0.531042)*sailStates.p + (12.425961)*sailStates.q + (-0.070793)*sailStates.r + (0.002642)*sailStates.de;

	Cl = (0.657785)*sailStates.alpha + (-0.266228)*sailStates.beta + (-1.366898)*sailStates.p + (11.848413)*sailStates.q + (0.086706)*sailStates.r + (0.000470)*sailStates.de;
	Cm = (-15.947661)*sailStates.alpha + (-0.988342)*sailStates.beta + (8.596437)*sailStates.p + (-135.423431)*sailStates.q + (1.407881)*sailStates.r + (-0.068132)*sailStates.de;
	Cn = (-1.459479)*sailStates.alpha + (-0.004059)*sailStates.beta + (0.638608)*sailStates.p + (-11.389613)*sailStates.q + (0.120471)*sailStates.r + (-0.003539)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end