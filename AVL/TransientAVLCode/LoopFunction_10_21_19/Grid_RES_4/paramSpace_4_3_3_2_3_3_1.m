function [aeroForces] = paramSpace_4_3_3_2_3_3_1(sailStates,airStates)

	CL = (4.223091)*sailStates.alpha + (-0.135427)*sailStates.beta + (-2.191913)*sailStates.p + (35.481358)*sailStates.q + (1.663689)*sailStates.r + (0.011121)*sailStates.de;
	CD = -0.361290;
	CY = (0.049998)*sailStates.alpha + (-0.026137)*sailStates.beta + (0.529548)*sailStates.p + (1.057314)*sailStates.q + (-0.105296)*sailStates.r + (0.000223)*sailStates.de;

	Cl = (0.948223)*sailStates.alpha + (-0.340729)*sailStates.beta + (-0.867442)*sailStates.p + (7.558338)*sailStates.q + (1.347732)*sailStates.r + (-0.000169)*sailStates.de;
	Cm = (-11.801817)*sailStates.alpha + (0.519084)*sailStates.beta + (6.506032)*sailStates.p + (-125.069839)*sailStates.q + (-5.555337)*sailStates.r + (-0.066745)*sailStates.de;
	Cn = (0.319572)*sailStates.alpha + (0.061385)*sailStates.beta + (-1.098739)*sailStates.p + (3.707819)*sailStates.q + (-0.015305)*sailStates.r + (-0.000221)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end