function [aeroForces] = paramSpace_1_2_2_1_2_1_2(sailStates,airStates)

	CL = (5.227047)*sailStates.alpha + (0.313377)*sailStates.beta + (-3.077399)*sailStates.p + (42.277214)*sailStates.q + (-2.324906)*sailStates.r + (0.011752)*sailStates.de;
	CD = -1.018340;
	CY = (-0.032358)*sailStates.alpha + (-0.023333)*sailStates.beta + (-0.933260)*sailStates.p + (1.226116)*sailStates.q + (-0.122779)*sailStates.r + (0.000264)*sailStates.de;

	Cl = (1.965787)*sailStates.alpha + (0.518377)*sailStates.beta + (-1.576403)*sailStates.p + (14.118496)*sailStates.q + (-1.941358)*sailStates.r + (0.000875)*sailStates.de;
	Cm = (-13.525417)*sailStates.alpha + (-1.140046)*sailStates.beta + (9.387601)*sailStates.p + (-148.931046)*sailStates.q + (7.770970)*sailStates.r + (-0.070142)*sailStates.de;
	Cn = (0.458873)*sailStates.alpha + (0.051578)*sailStates.beta + (1.897494)*sailStates.p + (-8.896361)*sailStates.q + (0.021325)*sailStates.r + (-0.000541)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end