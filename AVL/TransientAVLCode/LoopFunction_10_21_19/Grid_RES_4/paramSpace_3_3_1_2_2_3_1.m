function [aeroForces] = paramSpace_3_3_1_2_2_3_1(sailStates,airStates)

	CL = (4.530447)*sailStates.alpha + (-0.088646)*sailStates.beta + (-2.191106)*sailStates.p + (32.893337)*sailStates.q + (1.277609)*sailStates.r + (0.011141)*sailStates.de;
	CD = -0.451190;
	CY = (-0.072862)*sailStates.alpha + (-0.025002)*sailStates.beta + (0.513844)*sailStates.p + (0.100923)*sailStates.q + (-0.033690)*sailStates.r + (0.000022)*sailStates.de;

	Cl = (1.144720)*sailStates.alpha + (-0.288170)*sailStates.beta + (-0.871649)*sailStates.p + (6.853494)*sailStates.q + (1.093287)*sailStates.r + (-0.000226)*sailStates.de;
	Cm = (-14.127421)*sailStates.alpha + (0.316448)*sailStates.beta + (7.194335)*sailStates.p + (-126.149185)*sailStates.q + (-4.304220)*sailStates.r + (-0.068986)*sailStates.de;
	Cn = (0.515143)*sailStates.alpha + (0.016703)*sailStates.beta + (-1.128722)*sailStates.p + (5.065734)*sailStates.q + (0.005850)*sailStates.r + (0.000071)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end