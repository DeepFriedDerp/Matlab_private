function [aeroForces] = paramSpace_4_2_4_3_1_3_3(sailStates,airStates)

	CL = (4.253695)*sailStates.alpha + (0.140951)*sailStates.beta + (-2.765140)*sailStates.p + (39.902115)*sailStates.q + (1.887190)*sailStates.r + (0.011088)*sailStates.de;
	CD = -0.241440;
	CY = (-0.019997)*sailStates.alpha + (-0.025775)*sailStates.beta + (0.655266)*sailStates.p + (-0.684400)*sailStates.q + (-0.130414)*sailStates.r + (-0.000146)*sailStates.de;

	Cl = (1.541561)*sailStates.alpha + (-0.257822)*sailStates.beta + (-1.390868)*sailStates.p + (12.730803)*sailStates.q + (1.514767)*sailStates.r + (0.000675)*sailStates.de;
	Cm = (-12.595638)*sailStates.alpha + (-0.545205)*sailStates.beta + (8.365721)*sailStates.p + (-141.172913)*sailStates.q + (-6.304744)*sailStates.r + (-0.068333)*sailStates.de;
	Cn = (-0.232232)*sailStates.alpha + (0.060260)*sailStates.beta + (-1.215533)*sailStates.p + (4.914827)*sailStates.q + (-0.004684)*sailStates.r + (0.000282)*sailStates.de;

	q = 0.5 * airStates.rho * (sailStates.windspeed * sailStates.windspeed);

	aeroForces.L = CL * q * sailStates.Sref;
	aeroForces.D = CD * q * sailStates.Sref;
	aeroForces.Y = CY * q * sailStates.Sref;

	aeroForces.l = Cl * q * sailStates.Sref * sailStates.Bref;
	aeroForces.m = Cm * q * sailStates.Sref * sailStates.Cref;
	aeroForces.n = Cn * q * sailStates.Sref * sailStates.Bref;

end