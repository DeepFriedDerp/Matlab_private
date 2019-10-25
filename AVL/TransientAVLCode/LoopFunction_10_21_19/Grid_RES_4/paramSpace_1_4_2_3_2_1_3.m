function [aeroForces] = paramSpace_1_4_2_3_2_1_3(sailStates,airStates)

	CL = (4.073815)*sailStates.alpha + (0.382026)*sailStates.beta + (-2.761478)*sailStates.p + (39.503960)*sailStates.q + (-1.745525)*sailStates.r + (0.011015)*sailStates.de;
	CD = -0.183670;
	CY = (-0.036745)*sailStates.alpha + (-0.024146)*sailStates.beta + (-0.561212)*sailStates.p + (0.194783)*sailStates.q + (-0.111639)*sailStates.r + (0.000041)*sailStates.de;

	Cl = (1.307375)*sailStates.alpha + (0.384954)*sailStates.beta + (-1.328422)*sailStates.p + (11.835245)*sailStates.q + (-1.370420)*sailStates.r + (0.000530)*sailStates.de;
	Cm = (-12.419474)*sailStates.alpha + (-1.434648)*sailStates.beta + (8.481376)*sailStates.p + (-140.845245)*sailStates.q + (5.823565)*sailStates.r + (-0.067374)*sailStates.de;
	Cn = (0.212935)*sailStates.alpha + (0.053944)*sailStates.beta + (1.039562)*sailStates.p + (-3.942058)*sailStates.q + (-0.013278)*sailStates.r + (-0.000141)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end