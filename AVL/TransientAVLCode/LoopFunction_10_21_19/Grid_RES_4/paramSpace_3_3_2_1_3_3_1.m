function [aeroForces] = paramSpace_3_3_2_1_3_3_1(sailStates,airStates)

	CL = (5.320405)*sailStates.alpha + (-0.167005)*sailStates.beta + (-1.757069)*sailStates.p + (30.358711)*sailStates.q + (1.993378)*sailStates.r + (0.011193)*sailStates.de;
	CD = -1.786300;
	CY = (-0.047302)*sailStates.alpha + (-0.025592)*sailStates.beta + (0.808539)*sailStates.p + (1.915492)*sailStates.q + (-0.053062)*sailStates.r + (0.000407)*sailStates.de;

	Cl = (0.514944)*sailStates.alpha + (-0.523604)*sailStates.beta + (-0.498002)*sailStates.p + (3.550369)*sailStates.q + (1.838880)*sailStates.r + (-0.000810)*sailStates.de;
	Cm = (-11.608215)*sailStates.alpha + (0.653184)*sailStates.beta + (5.505344)*sailStates.p + (-113.694908)*sailStates.q + (-6.775630)*sailStates.r + (-0.067877)*sailStates.de;
	Cn = (1.420712)*sailStates.alpha + (0.031208)*sailStates.beta + (-1.861131)*sailStates.p + (7.089543)*sailStates.q + (0.003699)*sailStates.r + (-0.000416)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end