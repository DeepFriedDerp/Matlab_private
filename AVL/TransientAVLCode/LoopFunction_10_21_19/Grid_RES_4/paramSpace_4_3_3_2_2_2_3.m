function [aeroForces] = paramSpace_4_3_3_2_2_2_3(sailStates,airStates)

	CL = (3.772462)*sailStates.alpha + (-0.079422)*sailStates.beta + (-2.867176)*sailStates.p + (38.609211)*sailStates.q + (1.146842)*sailStates.r + (0.010788)*sailStates.de;
	CD = 0.083390;
	CY = (0.009214)*sailStates.alpha + (-0.024646)*sailStates.beta + (0.276803)*sailStates.p + (-0.301043)*sailStates.q + (-0.055070)*sailStates.r + (-0.000064)*sailStates.de;

	Cl = (1.298136)*sailStates.alpha + (-0.152518)*sailStates.beta + (-1.465149)*sailStates.p + (12.772223)*sailStates.q + (0.813743)*sailStates.r + (0.000805)*sailStates.de;
	Cm = (-13.324165)*sailStates.alpha + (0.293986)*sailStates.beta + (9.417441)*sailStates.p + (-145.703583)*sailStates.q + (-3.858688)*sailStates.r + (-0.068813)*sailStates.de;
	Cn = (-0.275818)*sailStates.alpha + (0.026334)*sailStates.beta + (-0.359137)*sailStates.p + (0.804751)*sailStates.q + (-0.032469)*sailStates.r + (0.000114)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end