function [aeroForces] = paramSpace_12_1_1_2_2_2_1(sailStates,airStates)

	CL = (4.124927)*sailStates.alpha + (0.000000)*sailStates.beta + (-2.358762)*sailStates.p + (34.664837)*sailStates.q + (1.070529)*sailStates.r + (0.011149)*sailStates.de;
	CD = -0.079360;
	CY = (0.039406)*sailStates.alpha + (-0.025000)*sailStates.beta + (0.306029)*sailStates.p + (0.520428)*sailStates.q + (-0.043065)*sailStates.r + (0.000111)*sailStates.de;

	Cl = (1.127187)*sailStates.alpha + (-0.173893)*sailStates.beta + (-1.031783)*sailStates.p + (8.567318)*sailStates.q + (0.818780)*sailStates.r + (0.000082)*sailStates.de;
	Cm = (-13.867493)*sailStates.alpha + (-0.000000)*sailStates.beta + (7.666049)*sailStates.p + (-130.856766)*sailStates.q + (-3.578772)*sailStates.r + (-0.068597)*sailStates.de;
	Cn = (0.058160)*sailStates.alpha + (0.024439)*sailStates.beta + (-0.605026)*sailStates.p + (2.094675)*sailStates.q + (-0.009841)*sailStates.r + (-0.000085)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end