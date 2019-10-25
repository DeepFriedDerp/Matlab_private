function [aeroForces] = paramSpace_1_2_1_3_3_1_1(sailStates,airStates)

	CL = (4.302955)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.280694)*sailStates.p + (35.315174)*sailStates.q + (-1.587165)*sailStates.r + (0.010934)*sailStates.de;
	CD = -0.244140;
	CY = (0.106114)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.572751)*sailStates.p + (0.318252)*sailStates.q + (-0.101022)*sailStates.r + (0.000067)*sailStates.de;

	Cl = (1.293468)*sailStates.alpha + (0.273683)*sailStates.beta + (-0.972976)*sailStates.p + (8.481353)*sailStates.q + (-1.278326)*sailStates.r + (-0.000027)*sailStates.de;
	Cm = (-12.931464)*sailStates.alpha + (-0.000000)*sailStates.beta + (6.947271)*sailStates.p + (-127.854218)*sailStates.q + (5.321699)*sailStates.r + (-0.067624)*sailStates.de;
	Cn = (-0.333466)*sailStates.alpha + (0.048258)*sailStates.beta + (1.136585)*sailStates.p + (-4.798086)*sailStates.q + (0.005067)*sailStates.r + (-0.000164)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end