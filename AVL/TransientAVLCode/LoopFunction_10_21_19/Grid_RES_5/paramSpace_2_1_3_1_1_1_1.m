function [aeroForces] = paramSpace_2_1_3_1_1_1_1(sailStates,airStates)

	CL = (4.423490)*sailStates.alpha + (-0.000000)*sailStates.beta + (-2.115162)*sailStates.p + (35.846233)*sailStates.q + (-1.893498)*sailStates.r + (0.011371)*sailStates.de;
	CD = -0.594570;
	CY = (-0.052776)*sailStates.alpha + (-0.025000)*sailStates.beta + (-0.606014)*sailStates.p + (-1.364610)*sailStates.q + (-0.128861)*sailStates.r + (-0.000286)*sailStates.de;

	Cl = (0.891017)*sailStates.alpha + (0.357077)*sailStates.beta + (-0.807691)*sailStates.p + (7.278708)*sailStates.q + (-1.542475)*sailStates.r + (-0.000242)*sailStates.de;
	Cm = (-11.132144)*sailStates.alpha + (0.000000)*sailStates.beta + (5.969079)*sailStates.p + (-122.335159)*sailStates.q + (6.277775)*sailStates.r + (-0.066282)*sailStates.de;
	Cn = (-0.481844)*sailStates.alpha + (0.075899)*sailStates.beta + (1.301286)*sailStates.p + (-4.484794)*sailStates.q + (-0.014717)*sailStates.r + (0.000285)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end