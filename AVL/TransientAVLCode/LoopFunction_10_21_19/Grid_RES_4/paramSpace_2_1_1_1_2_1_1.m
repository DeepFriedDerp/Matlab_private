function [aeroForces] = paramSpace_2_1_1_1_2_1_1(sailStates,airStates)

	CL = (6.143511)*sailStates.alpha + (-0.603083)*sailStates.beta + (-1.720160)*sailStates.p + (30.218569)*sailStates.q + (-2.447954)*sailStates.r + (0.010964)*sailStates.de;
	CD = -2.347500;
	CY = (0.379014)*sailStates.alpha + (-0.024479)*sailStates.beta + (-1.111065)*sailStates.p + (-0.221998)*sailStates.q + (-0.072800)*sailStates.r + (-0.000047)*sailStates.de;

	Cl = (1.334320)*sailStates.alpha + (0.404084)*sailStates.beta + (-0.543185)*sailStates.p + (4.313225)*sailStates.q + (-2.248892)*sailStates.r + (-0.000673)*sailStates.de;
	Cm = (-12.217861)*sailStates.alpha + (2.430160)*sailStates.beta + (5.238830)*sailStates.p + (-111.854546)*sailStates.q + (8.327002)*sailStates.r + (-0.066766)*sailStates.de;
	Cn = (-1.963737)*sailStates.alpha + (0.040069)*sailStates.beta + (2.461644)*sailStates.p + (-10.860969)*sailStates.q + (0.015887)*sailStates.r + (-0.000096)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end