function [aeroForces] = paramSpace_2_1_2_1_3_1_3(sailStates,airStates)

	CL = (7.300964)*sailStates.alpha + (-0.675544)*sailStates.beta + (-3.472596)*sailStates.p + (44.631748)*sailStates.q + (-3.116569)*sailStates.r + (0.011850)*sailStates.de;
	CD = -3.013450;
	CY = (-0.273533)*sailStates.alpha + (-0.027032)*sailStates.beta + (-1.442246)*sailStates.p + (1.915493)*sailStates.q + (-0.094597)*sailStates.r + (0.000416)*sailStates.de;

	Cl = (3.081666)*sailStates.alpha + (0.430396)*sailStates.beta + (-1.978057)*sailStates.p + (17.754841)*sailStates.q + (-2.777660)*sailStates.r + (0.001608)*sailStates.de;
	Cm = (-14.194155)*sailStates.alpha + (2.615986)*sailStates.beta + (10.953400)*sailStates.p + (-159.650192)*sailStates.q + (10.548498)*sailStates.r + (-0.071570)*sailStates.de;
	Cn = (1.591874)*sailStates.alpha + (0.047484)*sailStates.beta + (3.055094)*sailStates.p + (-14.770003)*sailStates.q + (0.026718)*sailStates.r + (-0.000840)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end