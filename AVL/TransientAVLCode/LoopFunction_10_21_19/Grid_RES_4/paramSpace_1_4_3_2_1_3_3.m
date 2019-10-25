function [aeroForces] = paramSpace_1_4_3_2_1_3_3(sailStates,airStates)

	CL = (4.172294)*sailStates.alpha + (-0.048871)*sailStates.beta + (-2.794232)*sailStates.p + (34.565014)*sailStates.q + (0.086081)*sailStates.r + (0.010006)*sailStates.de;
	CD = -0.402840;
	CY = (0.004622)*sailStates.alpha + (-0.026188)*sailStates.beta + (0.328267)*sailStates.p + (-0.455226)*sailStates.q + (0.065280)*sailStates.r + (-0.000096)*sailStates.de;

	Cl = (1.394421)*sailStates.alpha + (-0.148513)*sailStates.beta + (-1.414729)*sailStates.p + (11.308679)*sailStates.q + (0.328811)*sailStates.r + (0.000763)*sailStates.de;
	Cm = (-14.824430)*sailStates.alpha + (0.255215)*sailStates.beta + (10.293462)*sailStates.p + (-145.756409)*sailStates.q + (-0.206510)*sailStates.r + (-0.067895)*sailStates.de;
	Cn = (0.194952)*sailStates.alpha + (-0.017744)*sailStates.beta + (-0.978785)*sailStates.p + (5.635000)*sailStates.q + (-0.073339)*sailStates.r + (0.000204)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end